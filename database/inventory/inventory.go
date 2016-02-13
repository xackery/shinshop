package inventory

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/goeq/inventory"
	"github.com/xackery/goeq/item"
)

type InventoryOutput struct {
	inventory.Inventory
	item.Item
}

type ActionParams struct {
	Itemid      int64 `db:"itemid"`
	Slotid      int64 `db:"slotid"`
	Charid      int64 `db:"charid"`
	Quantity    int64 `db:"quantity"`
	Oldslotid   int64 `db:"oldslotid"`
	Refid       int64 `db:"refid"`
	Oldquantity int64 `db:"oldquantity"`
}

//Get an Inventory by Character ID
func GetByCharacterId(db *sqlx.DB, id string) (items []*InventoryOutput, err error) {
	//items = &[]InventoryOutput{}

	rows, err := db.Queryx(`SELECT i.slotid, items.icon, i.itemid, items.Name, items.slots, i.charges, 
		items.bagslots
		FROM inventory i 
		JOIN items ON (i.itemid = items.id) 
		WHERE i.charid = ? ORDER BY i.slotid ASC`, id)
	if err != nil {
		fmt.Errorf("Error querying: %s", err.Error())
		return
	}

	for rows.Next() {
		item := &InventoryOutput{}
		err = rows.StructScan(&item)
		if err != nil {
			return
		}
		items = append(items, item)
	}
	return
}

func ActionAdd(db *sqlx.DB, params ActionParams) (err error) {
	result, err := db.NamedExec(`INSERT INTO inventory (itemid, slotid, charges, charid) VALUES (:itemid, :slotid, :quantity, :charid);`, params)
	if err != nil {
		return
	}
	count, err := result.LastInsertId()
	if err != nil {
		return
	}
	if count < 1 {
		err = fmt.Errorf("No action added.")
	}
	return
}

func ActionMove(db *sqlx.DB, params ActionParams) (err error) {
	fmt.Println(params)
	fmt.Println("Move", params.Oldslotid, "to", params.Slotid, "where charges =", params.Oldquantity, ",id =", params.Itemid)
	result, err := db.NamedExec(`UPDATE inventory SET 
		itemid = :itemid, 
		slotid = :slotid, 
		charges = :quantity,
		charid = :charid
		WHERE slotid = :oldslotid AND
		itemid = :itemid AND 
		charid = :charid
		`, params)

	if err != nil {
		return
	}
	count, err := result.RowsAffected()
	if err != nil {
		return
	}
	if count < 1 {
		err = fmt.Errorf("No rows affected.")
	}
	return
}
func ActionRemove(db *sqlx.DB, params ActionParams) (err error) {
	result, err := db.NamedExec(`DELETE FROM inventory WHERE
		itemid = :itemid AND
		slotid = :slotid AND
		charges = :quantity AND
		charid = :charid
		LIMIT 1
		`, params)
	if err != nil {
		return
	}
	count, err := result.LastInsertId()
	if err != nil {
		return
	}
	if count < 1 {
		err = fmt.Errorf("No action added.")
	}
	return
}
func ActionUpdate(db *sqlx.DB, params ActionParams) (err error) {
	result, err := db.NamedExec(`UPDATE inventory SET 
		itemid = :itemid, 
		slotid = :slotid, 
		charges = :quantity,
		charid = :charid,
		WHERE itemid = :itemid AND
		slotid = :oldslotid AND
		charges = :oldquantity
		`, params)
	if err != nil {
		return
	}
	count, err := result.LastInsertId()
	if err != nil {
		return
	}
	if count < 1 {
		err = fmt.Errorf("No action added.")
	}
	return
}
