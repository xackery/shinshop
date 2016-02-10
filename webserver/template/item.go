package template

import (
	"log"
	"net/http"
)

func ItemIndex(w http.ResponseWriter, r *http.Request) {
	ItemEditor(w, r)
	return
}

func ItemEditor(w http.ResponseWriter, r *http.Request) {
	var err error
	if !isTemplateLoaded {
		err = LoadTemplates()
		if err != nil {
			log.Println("Error loading templates:", err.Error())
		}
	}

	type Index struct {
		*Site
	}

	resp := Index{
		Site: SiteInit(),
	}
	//resp := someStruct{}
	err = contentTemplate["item/editor"].Execute(w, resp)
	if err != nil {
		log.Println("Error executing index", err.Error())
	}
}
