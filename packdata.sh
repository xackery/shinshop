cd webserver

go-bindata-assetfs -ignore=\\.DS_Store -pkg template templates/...
mv bindata_assetfs.go template/templatedata.go

go-bindata-assetfs -ignore=\\.DS_Store -pkg webserver web/...
mv bindata_assetfs.go webdata.go

go-bindata-assetfs -ignore=\\.DS_Store -pkg rest rest/map/...
mv bindata_assetfs.go rest/mapdata.go

#-nomemcopy

cd ..
go run main.go
