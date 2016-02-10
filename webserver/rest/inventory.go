package rest

import (
	"encoding/json"
	"fmt"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/database/inventory"
	"log"
	"net/http"
)

func InventoryGetByCharacterId(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		*Site
		Inventory []*inventory.InventoryOutput
	}

	resp := Index{
		Site: SiteInit(),
	}
	resp.Message = "Get inventory by character ID"

	if r.Method != "POST" {
		resp.Message = "Only POST methods are accepted."
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	id := r.FormValue("id")
	if len(id) == 0 {
		resp.Message = "Post value of id required."
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding:", err.Error())
		}
		return
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

	inv, err := inventory.GetByCharacterId(db, id)
	if err != nil {
		resp.Message = "Failed to get inventory: " + err.Error()
		log.Println("Failed to get inventory:" + err.Error())
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	resp.Inventory = inv
	resp.Status = 1
	resp.Message = fmt.Sprintf("There are %d inventory items.", len(inv))
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}
