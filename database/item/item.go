package item

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/goeq/item"
)

type ItemOutput struct {
	item.Item
}

//Search for items by name
func SearchByName(db *sqlx.DB, name string, limit int64, offset int64) (items []*ItemOutput, err error) {

	rows, err := db.Queryx(`SELECT * FROM items 
		WHERE Name LIKE ? LIMIT ? OFFSET ?`, "%"+name+"%", limit, offset)
	if err != nil {
		fmt.Errorf("Error querying: %s", err.Error())
		return
	}

	for rows.Next() {
		item := &ItemOutput{}
		err = rows.StructScan(&item)
		if err != nil {
			return
		}
		items = append(items, item)
	}
	return
}
