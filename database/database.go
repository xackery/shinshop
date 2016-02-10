package database

import (
	_ "database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/eqemuconfig"
)

func Connect(config *eqemuconfig.Config) (db *sqlx.DB, err error) {
	//Connect to DB
	db, err = sqlx.Open("mysql", fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=true", config.Database.Username, config.Database.Password, config.Database.Host, config.Database.Port, config.Database.Db))
	if err != nil {
		err = fmt.Errorf("Error connecting to DB:", err.Error())
		return
	}
	//defer db.Close()
	return
}
