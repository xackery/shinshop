package inventory

import (
	"encoding/json"
	"fmt"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/database/inventory"
	"log"
	"net/http"
	"strconv"
)

//Parse event paramaters from InventoryAdd/Remove/Update etc
func parseEventParameters(r *http.Request) (params inventory.ActionParams, err error) {
	if r.Method != "POST" {
		err = fmt.Errorf("Only POST methods are accepted.")
		return
	}

	itemid := r.FormValue("itemid")
	params.Itemid, err = strconv.ParseInt(itemid, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of id (%s): %s", itemid, err.Error())
		return
	}

	slotid := r.FormValue("slotid")
	log.Println(slotid)
	params.Slotid, err = strconv.ParseInt(slotid, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of slotid (%s): %s", slotid, err.Error())
		return
	}
	log.Println(params.Slotid)

	charid := r.FormValue("charid")
	params.Charid, err = strconv.ParseInt(charid, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of charid (%s): %s", charid, err.Error())
		return
	}

	oldslotid := r.FormValue("oldslotid")
	params.Oldslotid, err = strconv.ParseInt(oldslotid, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of oldslotid (%s): %s", oldslotid, err.Error())
		return
	}

	refid := r.FormValue("refid")
	params.Refid, err = strconv.ParseInt(refid, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of refid (%s): %s", refid, err.Error())
		return
	}

	oldquantity := r.FormValue("oldquantity")
	params.Oldquantity, err = strconv.ParseInt(oldquantity, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of oldquantity (%s): %s", oldquantity, err.Error())
		return
	}

	quantity := r.FormValue("quantity")
	params.Quantity, err = strconv.ParseInt(quantity, 10, 64)
	if err != nil {
		err = fmt.Errorf("Invalid value of quantity (%s): %s", quantity, err.Error())
		return
	}
	return
}

func ActionAdd(w http.ResponseWriter, r *http.Request) {
	log.Println("add!")
	var err error

	type Index struct {
		Status    int
		Message   string
		Inventory []*inventory.InventoryOutput
	}

	resp := Index{
		Status:  0,
		Message: "Unkown Error.",
	}
	resp.Message = "Add to character inventory"
	params, err := parseEventParameters(r)

	if err != nil {
		resp.Message = err.Error()
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

	err = inventory.ActionAdd(db, params)
	if err != nil {
		resp.Message = "Failed to add action: " + err.Error()
		log.Println("Failed to add action:" + err.Error())
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	resp.Status = 1
	resp.Message = "Added action successfully."
	//resp.Message = fmt.Sprintf("There are %d inventory items.", len(inv))
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}

func ActionUpdate(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		Status    int
		Message   string
		Inventory []*inventory.InventoryOutput
	}

	resp := Index{
		Status:  0,
		Message: "Unkown Error.",
	}
	resp.Message = "Add to character inventory"
	params, err := parseEventParameters(r)
	if err != nil {
		resp.Message = err.Error()
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

	err = inventory.ActionUpdate(db, params)
	if err != nil {
		resp.Message = "Failed to add action: " + err.Error()
		log.Println("Failed to add action:" + err.Error())
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	resp.Status = 1
	resp.Message = "Added action successfully."
	//resp.Message = fmt.Sprintf("There are %d inventory items.", len(inv))
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}

func ActionRemove(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		Status    int
		Message   string
		Inventory []*inventory.InventoryOutput
	}

	resp := Index{
		Status:  0,
		Message: "Unkown Error.",
	}
	resp.Message = "Add to character inventory"
	params, err := parseEventParameters(r)
	if err != nil {
		resp.Message = err.Error()
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

	err = inventory.ActionRemove(db, params)
	if err != nil {
		resp.Message = "Failed to add action: " + err.Error()
		log.Println("Failed to add action:" + err.Error())
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	resp.Status = 1
	resp.Message = "Added action successfully."
	//resp.Message = fmt.Sprintf("There are %d inventory items.", len(inv))
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}

func ActionMove(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		Status    int
		Message   string
		Inventory []*inventory.InventoryOutput
	}

	resp := Index{
		Status:  0,
		Message: "Unkown Error.",
	}
	resp.Message = "Add to character inventory"
	params, err := parseEventParameters(r)
	if err != nil {
		resp.Message = err.Error()
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

	err = inventory.ActionMove(db, params)
	if err != nil {
		resp.Message = "Failed to add action: " + err.Error()
		log.Println("Failed to add action:" + err.Error())
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	resp.Status = 1
	resp.Message = "Added action successfully."
	//resp.Message = fmt.Sprintf("There are %d inventory items.", len(inv))
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}
