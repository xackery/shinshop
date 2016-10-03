package main

import (
	"fmt"
	"github.com/xackery/shinshop/applog"
	"github.com/xackery/shinshop/webserver"
	"log"
	"os"
)

func main() {
	applog.StartupInteractive()
	log.Println("Initializing Shinshop...")
	err := webserver.Start("127.0.0.1:12345")
	if err != nil {
		log.Println("Error with webserver:", err.Error())
		fmt.Println("Press enter to exit.")
		exit := ""
		fmt.Scan(&exit)
		os.Exit(1)
	}
}
