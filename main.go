package main

import (
	"log"
	"os"

	"github.com/xackery/shinshop/webserver"
)

func main() {
	log.Println("Initializing...")
	err := webserver.Start("localhost:12345")
	if err != nil {
		log.Println("Error with webserver:", err.Error())
		os.Exit(1)
	}
}
