package template

import (
	"html/template"
	"log"
	"net/http"
	//"os"
	"io/ioutil"
)

var isTemplateLoaded = false

var contentTemplate map[string]*template.Template

var isProduction = true

func LoadTemplates() (err error) {
	if isTemplateLoaded {
		//When in production, only load template once
		return
	}
	isTemplateLoaded = true

	contentTemplate = make(map[string]*template.Template)
	log.Println("Loading templates")
	var bData []byte
	//First do _template
	if isProduction {
		bData, err = Asset("templates/_template.tpl")
	} else {
		bData, err = ioutil.ReadFile("webserver/templates/_template.tpl")
	}

	if err != nil {
		return
	}

	//Create _template
	contentTemplate["_template"], err = template.New("_template").Parse(string(bData))
	if err != nil {
		return
	}

	if isProduction {
		bData, err = Asset("templates/_header.tpl")
	} else {
		bData, err = ioutil.ReadFile("webserver/templates/_header.tpl")
	}
	if err != nil {
		return
	}

	_, err = contentTemplate["_template"].New("header").Parse(string(bData))
	if err != nil {
		return
	}

	paths := []string{
		"account/manager",
		"character/inventory",
		"character/search",
		"index/index",
		"item/editor",
		"map/editor",
	}

	for _, path := range paths {
		contentTemplate[path], err = contentTemplate["_template"].Clone()
		if err != nil {
			return
		}

		if isProduction {
			bData, err = Asset("templates/" + path + ".tpl")
		} else {
			bData, err = ioutil.ReadFile("webserver/templates/" + path + ".tpl")
		}
		if err != nil {
			return
		}
		_, err = contentTemplate[path].New("content").Parse(string(bData))
		if err != nil {
			return
		}
	}

	return
}

type Site struct {
	Title           string
	UseHeader       bool
	JsTopPage       string
	JsBotPage       string
	Content         string
	LastSearchQuery string
}

func SiteInit() *Site {
	return &Site{
		Title:   "Index",
		Content: "",
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

	if r.URL.Path != "/" {
		log.Println("Request to", r.URL.Path)
		if isProduction {
			http.FileServer(assetFS()).ServeHTTP(w, r)
		} else {
			http.FileServer(http.Dir("webserver/web")).ServeHTTP(w, r)
		}
		return
	}

	//resp := someStruct{}
	err = contentTemplate["index/index"].Execute(w, resp)
	if err != nil {
		log.Println("Error executing index", err.Error())
	}
}
