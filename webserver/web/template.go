package web

import (
	"fmt"
	"github.com/xackery/shinshop/webserver/www"
	templatepkg "html/template"
	"io/ioutil"
	"os"
)

type template struct {
	IsLoaded bool
	Data     *templatepkg.Template
}

var templates map[string]*template

func init() {
	if templates == nil {
		templates = make(map[string]*template)
	}
}

func GetTemplate(path string) (newTemplate *templatepkg.Template, err error) {
	if templates[path] == nil || !templates[path].IsLoaded {
		var data []byte
		if os.Getenv("SHINDEV") == "1" {
			if data, err = ioutil.ReadFile("www/" + path); err != nil {
				err = fmt.Errorf("failed to find file (template) %s: %s", path, err.Error())
				return
			}
		} else {
			if data, err = www.Asset("www/" + path); err != nil {
				err = fmt.Errorf("failed to find file (template) %s: %s", path, err.Error())
				return
			}
		}
		templateData := &templatepkg.Template{}
		if templateData, err = templatepkg.New(path).Parse(string(data)); err != nil {
			err = fmt.Errorf("failed loading template %s: %s", path, err.Error())
			return
		}
		templates[path] = &template{
			IsLoaded: false,
			Data:     templateData,
		}
		if os.Getenv("SHINDEV") != "1" {
			templates[path].IsLoaded = true
		}
	}
	newTemplate = templates[path].Data
	return
}
