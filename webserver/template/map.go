package template

import (
	"log"
	"net/http"
)

func MapIndex(w http.ResponseWriter, r *http.Request) {
	ItemEditor(w, r)
	return
}

func MapEditor(w http.ResponseWriter, r *http.Request) {
	var err error
	if !isTemplateLoaded {
		err = LoadTemplates()
		if err != nil {
			log.Println("Error loading templates:", err.Error())
		}
	}

	type Index struct {
		*Site
		LastSearchQuery string
	}

	resp := Index{
		Site: SiteInit(),
	}

	params := r.URL.Query()
	name := params.Get("name")
	if len(name) < 1 {
		name = "kael"
	}
	resp.LastSearchQuery = name

	//resp := someStruct{}
	err = contentTemplate["map/editor"].Execute(w, resp)
	if err != nil {
		log.Println("Error executing index", err.Error())
	}
}
