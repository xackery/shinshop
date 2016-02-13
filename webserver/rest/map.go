package rest

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/database/grid"
	"github.com/xackery/shinshop/database/spawn"
	"io/ioutil"

	"log"
	"net/http"
	"strconv"
	"strings"
)

type Line struct {
	X1 float64
	Y1 float64
	X2 float64
	Y2 float64
}

type Mob struct {
	X        float64
	Y        float64
	Z        float64
	Pathgrid int
}

type Grid struct {
	Index   int
	Entries []GridEntry
}

type GridEntry struct {
	X     float64
	Y     float64
	Z     float64
	Pause int
}

func MapGetByShortname(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		*Site
		Lines []Line
		Mobs  []Mob
		Grids []Grid
	}

	resp := Index{
		Site: SiteInit(),
	}

	if r.Method != "POST" {
		resp.Message = "Only POST methods are accepted."
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	name := r.FormValue("name")
	if len(name) == 0 {
		resp.Message = "Post value of name required."
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding:", err.Error())
		}
		return
	}

	bMap, err := ioutil.ReadFile(fmt.Sprintf("webserver/rest/map/%s_1.txt", name))
	if err != nil {
		resp.Message = "Error finding map: " + err.Error()
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error decoding json:", err.Error())
		}
		return
	}

	reader := csv.NewReader(strings.NewReader(string(bMap)))
	records, err := reader.ReadAll()
	if err != nil {
		log.Fatal(err)
	}

	//iterate each entry
	for _, record := range records {

		entries := strings.Split(record[0], " ")
		drawType := entries[0]
		if drawType == "L" {
			line := Line{}
			line.X1, err = strconv.ParseFloat(strings.TrimSpace(entries[1]), 64) //entries[1]), 64)
			line.Y1, err = strconv.ParseFloat(strings.TrimSpace(record[1]), 64)
			line.X2, err = strconv.ParseFloat(strings.TrimSpace(record[3]), 64)
			line.Y2, err = strconv.ParseFloat(strings.TrimSpace(record[4]), 64)

			line.X1 += 2000
			line.Y1 += 2000
			line.X2 += 2000
			line.Y2 += 2000

			line.X1 /= 5
			line.Y1 /= 5
			line.X2 /= 5
			line.Y2 /= 5
			//outData += fmt.Sprintf("svg.line(g, %f, %f, %f, %f);\n", line.x1, line.y1, line.x2, line.y2)
			resp.Lines = append(resp.Lines, line)
		}
	}

	config, err := eqemuconfig.GetConfig()
	if err != nil {
		log.Println("Error getting config", err.Error())
		return
	}

	db, err := database.Connect(config)
	if err != nil {
		log.Println("Error connecting to DB:", err.Error())
		//TODO: exit properly
		return
	}

	npcs, err := spawn.GetSpawnsByZone(db, name)
	if err != nil {
		log.Println("Error getting npcs:", err.Error())
	}

	for _, npc := range npcs {
		mob := Mob{
			X:        -npc.X,
			Y:        -npc.Y,
			Pathgrid: npc.Pathgrid,
		}
		mob.X += 2000
		mob.Y += 2000
		mob.X /= 5
		mob.Y /= 5
		resp.Mobs = append(resp.Mobs, mob)
	}

	grids, err := grid.GetGridsByZone(db, name)
	if err != nil {
		log.Println("Error getting grids:", err.Error())
	}

	lastIndex := 0
	gridPack := Grid{}

	for _, grid := range grids {
		if lastIndex != grid.Gridid {
			resp.Grids = append(resp.Grids, gridPack)
			lastIndex = grid.Gridid
			gridPack = Grid{}
			gridPack.Index = grid.Gridid
		}

		newEntry := GridEntry{
			X:     -grid.X,
			Y:     -grid.Y,
			Z:     grid.Z,
			Pause: grid.Pause,
		}
		//newEntry.X += 2000
		//newEntry.Y += 2000
		newEntry.X /= 5
		newEntry.Y /= 5

		gridPack.Entries = append(gridPack.Entries, newEntry)
	}
	if len(grids) > 0 {
		resp.Grids = append(resp.Grids, gridPack)
	}

	log.Println(resp.Grids)

	resp.Status = 1
	resp.Message = "Here's the map"
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}
