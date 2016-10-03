package web

import (
	"fmt"
	templatepkg "html/template"
	"net/http"
)

func Index(w http.ResponseWriter, r *http.Request) (err error) {
	var tpl *templatepkg.Template
	if tpl, err = GetTemplate("index.html"); err != nil {
		err = fmt.Errorf("error getting template: %s", err.Error())
		return
	}

	type templateData struct {
		Header string
	}
	data := templateData{
		Header: "World!",
	}

	if err = tpl.Execute(w, data); err != nil {
		err = fmt.Errorf("error getting index: %s", err.Error())
		return
	}
	return
}
