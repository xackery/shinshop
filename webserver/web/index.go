package web

import (
	"fmt"
	"html/template"
	"net/http"
	"os"
)

//this stores the template, should be written once. (Dev can cause race conditions)
var indexTemplate *template.Template

func Index(w http.ResponseWriter, r *http.Request) (err error) {

	//Which templates to load
	paths := []string{
		"_header.tpl",
		"index.tpl",
		"_sidebar.tpl",
		"_footer.tpl",
	}

	//Load templates only once (unless dev)
	if indexTemplate == nil || os.Getenv("SHINDEV") == "1" {
		indexTemplate = template.New("index")

		for _, path := range paths {
			if err = ParseTemplateData(indexTemplate, path); err != nil {
				err = fmt.Errorf("error parsing: %s", err.Error())
				return
			}
		}
	}

	//Prepare template data
	type templateData struct {
		*SiteData
		Content string
	}

	//Custom index page content
	data := &templateData{
		Content: "Shinshop!",
	}

	//prepare general content
	if data.SiteData, err = NewSiteData(); err != nil {
		err = fmt.Errorf("error loading new site data: %s", err.Error())
		return
	}

	//set any overrides to general content
	data.Title = "Shinshop | Index"

	//render template
	for _, path := range paths {
		if err = indexTemplate.ExecuteTemplate(w, path, data); err != nil {
			err = fmt.Errorf("error rendering %s: %s", path, err.Error())
			return
		}
	}
	return
}
