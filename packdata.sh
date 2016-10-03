go-bindata-assetfs -ignore=\\.DS_Store -pkg www www/...
sed -i '' -e 's/assetFS()/AssetFS()/g' bindata_assetfs.go
mv bindata_assetfs.go webserver/www/www.go
echo "Packed www"
#cd ..
#go run main.go
