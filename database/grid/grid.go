package grid

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/goeq/grid"
)

type GridOutput struct {
	grid.GridEntries
}

//Search for items by name
func GetGridsByZone(db *sqlx.DB, name string) (grids []*GridOutput, err error) {

	rows, err := db.Queryx(`SELECT grid_entries.* FROM grid_entries 
		INNER JOIN zone ON zone.id = grid_entries.zoneid
		WHERE zone.short_name = ?`, name)
	if err != nil {
		fmt.Errorf("Error querying: %s", err.Error())
		return
	}

	for rows.Next() {
		grid := &GridOutput{}
		err = rows.StructScan(&grid)
		if err != nil {
			return
		}
		grids = append(grids, grid)
	}
	return
}
