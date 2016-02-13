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

func CharacterSearch(w http.ResponseWriter, r *http.Request) {

	type Index struct {
		Name string
		*Site
		Characters      []*character.CharacterOutput
		LastSearchQuery string
	}

	resp := Index{
		Name: "Testing2",
		Site: SiteInit(),
		//Character: &character.CharacterOutput{}, //Name: "Testing!", Id: 123},

	}

	params := r.URL.Query()
	name := params.Get("name")
	resp.LastSearchQuery = name

	if len(name) > 0 {

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
		defer db.Close()

		characters, err := character.FindAllByName(db, name)
		if err != nil {
			log.Println("Error finding all names", err.Error())
			return
		}
		resp.Characters = characters

	}
	err := contentTemplate["character/search"].Execute(w, resp)
	if err != nil {
		log.Println("Error executing search", err.Error())
	}
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
	defer db.Close()

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
