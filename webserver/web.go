package webserver

import (
	"github.com/xackery/shinshop/applog"
	"net/http"
)

func handleWebCore(w http.ResponseWriter, r *http.Request, handler func(http.ResponseWriter, *http.Request) (err error)) {
	var err error
	if err = handler(w, r); err != nil {
		applog.Error.Println("Error loading", r.RequestURI, err.Error())
		//TODO: Handle 404/etc
		return
	}
	//http.FileServer(http.Dir("www/")).ServeHTTP(w, r)
	return
}
