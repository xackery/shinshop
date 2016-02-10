package webserver

import (
	"github.com/gorilla/pat"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/webserver/rest"
	"github.com/xackery/shinshop/webserver/template"
	"log"
	"net/http"
)

func Start(addr string) (err error) {
	config, err := eqemuconfig.GetConfig()
	if err != nil {
		log.Println("Error loading config:", err.Error())
		return
	}
	//Do a quick DB test
	_, err = database.Connect(config)
	if err != nil {
		log.Println("Error connecting to DB:", err.Error())
		return
	}
	r := pat.New()
	r.Get("/", Index)
	r.Get("/item/", template.ItemIndex)
	r.Get("/character/", template.CharacterIndex)
	r.Get("/character/inventory/:cid", template.CharacterInventory)
	r.Get("/item/editor/", template.ItemEditor)
	r.Get("/rest/", rest.Index)
	r.Get("/rest/item/getbyid", rest.ItemGetById)
	r.Get("/rest/inventory/getbycharacterid", rest.InventoryGetByCharacterId)
	http.Handle("/", r)
	log.Println("Started Web Server on", addr)
	err = http.ListenAndServe(addr, nil)
	return
}

func Index(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		//log.Println("Request to", r.URL.Path)
		http.FileServer(assetFS()).ServeHTTP(w, r)
		return
	}
	template.Index(w, r)
	return
}
