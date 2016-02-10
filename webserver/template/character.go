package template

import (
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	"github.com/xackery/shinshop/database/character"
	"log"
	"net/http"
)

func CharacterIndex(w http.ResponseWriter, r *http.Request) {
	CharacterInventory(w, r)
	return
}

func CharacterInventory(w http.ResponseWriter, r *http.Request) {
	var err error

	if !isTemplateLoaded {
		err = LoadTemplates()
		if err != nil {
			log.Println("Error loading templates:", err.Error())
			//TODO: exit properly
			return
		}
	}

	config, err := eqemuconfig.GetConfig()
	if err != nil {
		log.Println("Error loading Config:", err.Error())
		//TODO: exit properly
		return
	}

	db, err := database.Connect(config)
	if err != nil {
		log.Println("Error connecting to DB:", err.Error())
		//TODO: exit properly
		return
	}

	type Index struct {
		Name string
		*Site
		Character *character.CharacterOutput
	}

	resp := Index{
		Name: "Testing2",
		Site: SiteInit(),
		//Character: &character.CharacterOutput{}, //Name: "Testing!", Id: 123},
	}
	params := r.URL.Query()
	id := params.Get("cid")
	if len(id) == 0 {
		//log.Println("Empty ID!")

		id = "2"
	}

	resp.Character, err = character.GetById(db, id)
	db.Close()
	if err != nil {
		log.Println("Error getting ID from DB:", err.Error())
		return
	}
	//resp := someStruct{}
	err = contentTemplate["character/inventory"].Execute(w, resp)
	if err != nil {
		log.Println("Error executing index", err.Error())
	}

}
