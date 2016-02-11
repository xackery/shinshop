package rest

import (
	"encoding/json"
	"fmt"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/database/item"
	"log"
	"net/http"
	"strconv"
)

func ItemGetById(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		*Site
	}

	resp := Index{
		Site: SiteInit(),
	}
	resp.Message = "Get item by ID"

	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}

func ItemSearchByName(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		*Site
		Items []*item.ItemOutput
	}

	resp := Index{
		Site: SiteInit(),
	}
	resp.Message = "Search for item by name"

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

	strOffset := r.FormValue("offset")
	offset, err := strconv.ParseInt(strOffset, 10, 64)
	if err != nil {
		offset = 0
	}
	if offset < 0 {
		offset = 0
	}
	if offset > 1000 {
		offset = 1000
	}

	strLimit := r.FormValue("limit")
	limit, err := strconv.ParseInt(strLimit, 10, 64)
	if err != nil {
		limit = 0
	}
	if limit < 0 {
		limit = 0
	}
	if limit > 30 {
		limit = 30
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

	items, err := item.SearchByName(db, name, limit, offset)
	if err != nil {
		resp.Message = "Failed to get inventory: " + err.Error()
		log.Println("Failed to get inventory:" + err.Error())
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	resp.Items = items
	resp.Status = 1
	resp.Message = fmt.Sprintf("There are %d items.", len(items))
	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}
