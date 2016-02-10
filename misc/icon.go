package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	var err error
	id := 500

	data := ""
	divData := `
<html>
<head>
<style>

.item {
	width: 40px;
	height: 40px;
	position: relative;
	overflow:hidden;
	float: left;
}
</style>
<link rel="stylesheet" type="text/css" href="icon.css">
</head>
<div style="width: 1000px;  position: relative">
`
	for fileId := 1; fileId < 178; fileId++ {
		for x := 0; x < 201; x += 40 {
			for y := 0; y < 201; y += 40 {
				data += fmt.Sprintf(".icon-%d { background: url('dragitem%d.png') -%dpx -%dpx; }\n", id, fileId, x, y)
				divData += fmt.Sprintf("<div title='%d' class='item icon-%d'></div>\n", id, id)
				id++
			}
		}
	}
	fmt.Println(data)

	divData += "</html>"
	err = ioutil.WriteFile("icon.css", []byte(data), 0775)
	if err != nil {
		fmt.Println("error writing file:", err.Error())
		os.Exit(1)
	}

	err = ioutil.WriteFile("index.html", []byte(divData), 0775)
	if err != nil {
		fmt.Println("error writing file:", err.Error())
		os.Exit(1)
	}

}
