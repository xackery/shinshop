package webserver

import (
	"encoding/json"
	"fmt"
	restpkg "github.com/xackery/shinshop/webserver/rest"
	"net/http"
	"strings"
)

func handleRestCore(w http.ResponseWriter, r *http.Request, handler func(http.ResponseWriter, *http.Request, *restpkg.Rest) (err error)) {
	var err error
	rest := &restpkg.Rest{
		Status:  0,
		Message: "Unhandled Error",
	}

	w.Header().Set("Access-Control-Allow-Origin", "*")
	if r.Method != "POST" && strings.Contains("/api/", r.RequestURI) {
		rest.Message = "Invalid request method."
		rest.Data = nil
		rest.Status = 0
		err = json.NewEncoder(w).Encode(rest)
		if err != nil {
			fmt.Println("Error decoding rest:", err.Error)
		}
		return
	}

	err = handler(w, r, rest)
	//All errors for every route is handled inside the rest struct
	if err != nil {
		rest.Status = 0
		rest.Message = err.Error()
		rest.Data = nil
	} else {
		rest.Status = 1
		if rest.Message == "" {
			rest.Message = "Completed successfully."
		}
	}

	err = json.NewEncoder(w).Encode(rest)
	if err != nil {
		fmt.Println("Error decoding rest:", err.Error)
	}

	return
}
