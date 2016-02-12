package rest

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"
	"strings"
)

type Line struct {
	X1 float64
	Y1 float64
	X2 float64
	Y2 float64
}

func MapGetByShortname(w http.ResponseWriter, r *http.Request) {
	var err error

	type Index struct {
		*Site
		Lines []Line
	}

	resp := Index{
		Site: SiteInit(),
	}

	if r.Method != "POST" {
		resp.Message = "Only POST methods are accepted."
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding post fail:", err.Error())
		}
		return
	}

	name := r.FormValue("name")
	if len(name) == 0 {
		resp.Message = "Post value of name required."
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error responding:", err.Error())
		}
		return
	}

	bMap, err := ioutil.ReadFile(fmt.Sprintf("webserver/rest/map/%s_1.txt", name))
	if err != nil {
		resp.Message = "Error finding map: " + err.Error()
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			log.Println("Error decoding json:", err.Error())
		}
		return
	}

	reader := csv.NewReader(strings.NewReader(string(bMap)))
	records, err := reader.ReadAll()
	if err != nil {
		log.Fatal(err)
	}

	//iterate each entry
	for _, record := range records {

		entries := strings.Split(record[0], " ")
		drawType := entries[0]
		if drawType == "L" {
			line := Line{}
			line.X1, err = strconv.ParseFloat(strings.TrimSpace(entries[1]), 64) //entries[1]), 64)
			line.Y1, err = strconv.ParseFloat(strings.TrimSpace(record[1]), 64)
			line.X2, err = strconv.ParseFloat(strings.TrimSpace(record[3]), 64)
			line.Y2, err = strconv.ParseFloat(strings.TrimSpace(record[4]), 64)
			line.X1 += 2000
			line.Y1 += 2000
			line.X2 += 2000
			line.Y2 += 2000

			line.X1 /= 5
			line.Y1 /= 5
			line.X2 /= 5
			line.Y2 /= 5
			//outData += fmt.Sprintf("svg.line(g, %f, %f, %f, %f);\n", line.x1, line.y1, line.x2, line.y2)
			resp.Lines = append(resp.Lines, line)
		}
	}

	err = json.NewEncoder(w).Encode(resp)
	if err != nil {
		log.Println("Error requesting RestIndex:", err.Error())
	}
}
