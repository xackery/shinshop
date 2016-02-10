package rest

import (
	"encoding/json"
	"log"
	"net/http"
)

type Site struct {
	Status  int
	Message string
}

func SiteInit() *Site {
	return &Site{
		Status:  0,
		Message: "Unknown error",
	}
}

func Index(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		*Site
	}

	resp := Index{
		Site: SiteInit(),
	}

	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}
