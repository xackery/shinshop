package main

import (
	"github.com/xackery/shinshop/webserver"
	"log"
	"os"
)

func main() {
	log.Println("Initializing...")
	err := webserver.Start("127.0.0.1:12345")
	if err != nil {
		log.Println("Error with webserver:", err.Error())
		os.Exit(1)
	}
}
