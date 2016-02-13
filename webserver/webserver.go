package webserver

import (
	//"github.com/gorilla/pat"
	"github.com/skratchdot/open-golang/open"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/webserver/rest"
	"github.com/xackery/shinshop/webserver/rest/inventory"
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

	template.LoadTemplates()
	//r := pat.New()

	http.HandleFunc("/", Index)
	http.HandleFunc("/item/", template.ItemIndex)
	http.HandleFunc("/character/", template.CharacterSearch)
	http.HandleFunc("/character/search/", template.CharacterSearch)
	http.HandleFunc("/character/inventory/", template.CharacterInventory)

	http.HandleFunc("/map/editor/", template.MapEditor)

	http.HandleFunc("/item/editor/", template.ItemEditor)
	http.HandleFunc("/rest/", rest.Index)
	http.HandleFunc("/rest/item/getbyid", rest.ItemGetById)
	http.HandleFunc("/rest/item/searchbyname", rest.ItemSearchByName)
	http.HandleFunc("/rest/inventory/getbycharacterid", rest.InventoryGetByCharacterId)
	http.HandleFunc("/rest/inventory/add", inventory.ActionAdd)
	http.HandleFunc("/rest/inventory/move", inventory.ActionMove)
	http.HandleFunc("/rest/inventory/remove", inventory.ActionRemove)
	http.HandleFunc("/rest/inventory/update", inventory.ActionUpdate)

	http.HandleFunc("/rest/map/getbyshortname/", rest.MapGetByShortname)

	//http.Handle("/", r)
	log.Println("Started Web Server on", addr)
	go openBrowser(addr)
	err = http.ListenAndServe(addr, nil)
	return
}

func Index(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		//log.Println("Request to", r.URL.Path)
		http.FileServer(assetFS()).ServeHTTP(w, r)
		//http.FileServer(http.Dir("webserver/web/")).ServeHTTP(w, r)
		return
	}
	template.Index(w, r)
	return
}

func openBrowser(addr string) {
	open.Run("http://" + addr + "/character/?name=s")
}
