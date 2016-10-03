package database

import (
	_ "database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/eqemuconfig"
)

var db *sqlx.DB

func Connect(config *eqemuconfig.Config) (dbInstance *sqlx.DB, err error) {
	if db != nil {
		dbInstance = db
		return
	}
	//Connect to DB
	if dbInstance, err = sqlx.Open("mysql", fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=true", config.Database.Username, config.Database.Password, config.Database.Host, config.Database.Port, config.Database.Db)); err != nil {
		err = fmt.Errorf("Error connecting to DB:", err.Error())
		return
	}
	db = dbInstance
	//defer db.Close()
	return
}

func Disconnect() (err error) {
	if db == nil {
		return
	}
	err = db.Close()
	return
}
