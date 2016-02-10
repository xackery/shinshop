package rest

import (
	"encoding/json"
	"log"
	"net/http"
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
