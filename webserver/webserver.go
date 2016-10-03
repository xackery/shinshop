package webserver

import (
	"encoding/json"
	"fmt"
	"github.com/skratchdot/open-golang/open"
	"github.com/xackery/eqemuconfig"
	"github.com/xackery/shinshop/database"
	restpkg "github.com/xackery/shinshop/webserver/rest"
	"github.com/xackery/shinshop/webserver/web"
	"github.com/xackery/shinshop/webserver/www"
	"log"
	"net/http"
	"os"
	"strings"
)

var config *eqemuconfig.Config

func Start(addr string) (err error) {
	if config, err = eqemuconfig.GetConfig(); err != nil {
		err = fmt.Errorf("Error loading config: %s", err.Error())
		return
	}

	if _, err = database.Connect(config); err != nil {
		err = fmt.Errorf("Error connecting to DB: %s", err.Error())
		return
	}

	http.HandleFunc("/", router)
	log.Println("Listening on", addr)
	if os.Getenv("SHINDEV") == "1" {
		log.Println("Development mode enabled")
	} else {
		go openBrowser(addr)
	}
	if err = http.ListenAndServe(addr, nil); err != nil {
		return
	}
	return
}

func router(w http.ResponseWriter, r *http.Request) {
	var err error

	if len(r.RequestURI) == 0 {
		r.RequestURI = "/"
	}
	if r.RequestURI[len(r.RequestURI)-1:len(r.RequestURI)] != "/" {
		r.RequestURI += "/"
	}
	r.RequestURI = strings.ToLower(r.RequestURI)
	switch r.RequestURI {
	case "/":
		handleWebCore(w, r, web.Index)
	case "/api/":
		handleRestCore(w, r, restpkg.Index)
	default:
		//rest
		if strings.Contains("/api/", r.RequestURI) {
			rest := &restpkg.Rest{
				Status:  0,
				Message: "Invalid endpoint requested.",
			}
			if err = json.NewEncoder(w).Encode(rest); err != nil {
				err = fmt.Errorf("failed to encode json object: %s", err.Error())
			}
			return
		}

		//web
		if os.Getenv("SHINDEV") == "1" {
			fmt.Println("FileServ")
			http.FileServer(http.Dir("www/")).ServeHTTP(w, r)
		} else {
			http.FileServer(www.AssetFS()).ServeHTTP(w, r)
		}
		break
	}
}

func openBrowser(addr string) {
	open.Run("http://" + addr + "/")
}
