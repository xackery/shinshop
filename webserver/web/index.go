package web

import (
	"fmt"
	"html/template"
	"net/http"
	"os"
)

var indexTemplate *template.Template

func Index(w http.ResponseWriter, r *http.Request) (err error) {
	paths := map[string]string{
		"header": "_header.tpl",
		"index":  "index.tpl",
		//"_footer.tpl",
	}

	if indexTemplate == nil || os.Getenv("SHINDEV") == "1" {
		indexTemplate = template.New("index")

		for _, path := range paths {
			if err = ParseTemplateData(indexTemplate, path); err != nil {
				err = fmt.Errorf("error parsing: %s", err.Error())
				return
			}
		}
	}

	type templateData struct {
		*SiteData
		Content string
	}

	data := &templateData{
		Content: "Shinshop!",
	}

	if data.SiteData, err = NewSiteData(); err != nil {
		err = fmt.Errorf("error loading new site data: %s", err.Error())
		return
	}

	data.Title = "Shinshop | Index"
	for name, _ := range paths {
		if err = indexTemplate.ExecuteTemplate(w, name, data); err != nil {
			err = fmt.Errorf("error rendering %s: %s", name, err.Error())
			return
		}
	}
	return
}
