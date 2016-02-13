echo Building Linux
GOOS=linux GOARCH=amd64 go build main.go
mv main bin/shinshop-linux-x64
GOOS=linux GOARCH=386 go build main.go
mv main bin/shinshop-linux-x86
echo Building Windows
GOOS=windows GOARCH=amd64 go build main.go
mv main.exe bin/shinshop-windows-x64.exe
GOOS=windows GOARCH=386 go build main.go
mv main.exe bin/shinshop-windows-x86.exe
echo Building OSX
GOOS=darwin GOARCH=amd64 go build main.go
mv main bin/shinshop-osx-x64