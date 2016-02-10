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
