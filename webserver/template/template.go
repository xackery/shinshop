package template

import (
	"html/template"
	"log"
	"net/http"
	//"os"
)

var isTemplateLoaded = false

var contentTemplate map[string]*template.Template

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
	bData, err = Asset("templates/_template.tpl")
	if err != nil {
		return
	}

	//Create _template
	contentTemplate["_template"], err = template.New("_template").Parse(string(bData))
	if err != nil {
		return
	}

	bData, err = Asset("templates/_header.tpl")
	if err != nil {
		return
	}

	_, err = contentTemplate["_template"].New("header").Parse(string(bData))
	if err != nil {
		return
	}

	paths := []string{
		"account/manager",
		"index/index",
		"item/editor",
		"character/inventory",
	}

	for _, path := range paths {
		contentTemplate[path], err = contentTemplate["_template"].Clone()
		if err != nil {
			return
		}
		bData, err = Asset("templates/" + path + ".tpl")
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

	if r.URL.Path != "/" {
		log.Println("Request to", r.URL.Path)
		http.FileServer(assetFS()).ServeHTTP(w, r)
		return
	}

	//resp := someStruct{}
	err = contentTemplate["index/index"].Execute(w, resp)
	if err != nil {
		log.Println("Error executing index", err.Error())
	}
}
