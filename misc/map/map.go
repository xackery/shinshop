package main

import (
	"encoding/csv"
	"fmt"
	"io/ioutil"
	"log"
	"strconv"
	"strings"
)

type Line struct {
	x1 float64
	y1 float64
	x2 float64
	y2 float64
}

func main() {

	bMap, err := ioutil.ReadFile("maps/kael_1.txt")
	if err != nil {
		log.Println("Error:", err.Error())
	}
	r := csv.NewReader(strings.NewReader(string(bMap)))
	records, err := r.ReadAll()
	if err != nil {
		log.Fatal(err)
	}
	outData := ""
	//iterate each entry
	for _, record := range records {

		entries := strings.Split(record[0], " ")
		drawType := entries[0]
		if drawType == "L" {
			line := Line{}
			line.x1, err = strconv.ParseFloat(strings.TrimSpace(entries[1]), 64) //entries[1]), 64)
			line.y1, err = strconv.ParseFloat(strings.TrimSpace(record[1]), 64)
			line.x2, err = strconv.ParseFloat(strings.TrimSpace(record[3]), 64)
			line.y2, err = strconv.ParseFloat(strings.TrimSpace(record[4]), 64)
			line.x1 += 2000
			line.y1 += 2000
			line.x2 += 2000
			line.y2 += 2000

			line.x1 /= 5
			line.y1 /= 5
			line.x2 /= 5
			line.y2 /= 5
			outData += fmt.Sprintf("svg.line(g, %f, %f, %f, %f);\n", line.x1, line.y1, line.x2, line.y2)
		}
	}

	ioutil.WriteFile("out.txt", []byte(outData), 0755)
}
