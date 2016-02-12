package spawn

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/goeq/spawn"
)

type SpawnOutput struct {
	spawn.Spawn2
}

//Search for items by name
func GetSpawnsByZone(db *sqlx.DB, name string) (npcs []*SpawnOutput, err error) {

	rows, err := db.Queryx(`SELECT spawn2.* FROM spawnentry 
INNER JOIN spawn2 ON spawnentry.spawngroupid = spawn2.spawngroupid 
		WHERE spawn2.zone = ?
	 	GROUP BY spawn2.id;`, name)
	if err != nil {
		fmt.Errorf("Error querying: %s", err.Error())
		return
	}

	for rows.Next() {
		npc := &SpawnOutput{}
		err = rows.StructScan(&npc)
		if err != nil {
			return
		}
		npcs = append(npcs, npc)
	}
	return
}
