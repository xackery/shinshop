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
	Itemid      int64
	Slotid      int64
	Charid      int64
	Oldslotid   int64
	Refid       int64
	Oldquantity int64
	Quantity    int64
}

//Get an Inventory by Character ID
func GetByCharacterId(db *sqlx.DB, id string) (items []*InventoryOutput, err error) {
	//items = &[]InventoryOutput{}

	rows, err := db.Queryx(`SELECT * FROM inventory i 
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
	return
}

func ActionMove(db *sqlx.DB, params ActionParams) (err error) {
	return
}
func ActionRemove(db *sqlx.DB, params ActionParams) (err error) {
	return
}
func ActionUpdate(db *sqlx.DB, params ActionParams) (err error) {
	return
}
