package web

import (
	"fmt"
	"github.com/xackery/shinshop/webserver/www"
	"html/template"
	"io/ioutil"
	"os"
)

func ParseTemplateData(tpl *template.Template, path string) (err error) {
	var data string
	if data, err = readTemplateData(path); err != nil {
		err = fmt.Errorf("failed loading %s template: %s", path, err.Error())
		return
	}

	if tpl, err = tpl.New(path).Parse(data); err != nil {
		err = fmt.Errorf("failed parsing %s template: %s", path, err.Error())
		return
	}
	return
}

func readTemplateData(path string) (data string, err error) {
	var bData []byte
	if os.Getenv("SHINDEV") == "1" {
		if bData, err = ioutil.ReadFile("www/" + path); err != nil {
			err = fmt.Errorf("failed to find file (template) %s: %s", path, err.Error())
			return
		}
	} else {
		if bData, err = www.Asset("www/" + path); err != nil {
			err = fmt.Errorf("failed to find file (template) %s: %s", path, err.Error())
			return
		}
	}
	data = string(bData)
	return
}
