package character

import (
	"database/sql"
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/goeq/character"
	//"time"
)

type CharacterOutput struct {
	character.CharacterData
	ClassName     sql.NullString `db:"class_name"`
	GuildName     sql.NullString `db:"guild_name"`
	GuildId       sql.NullInt64  `db:"guild_id"`
	GuildRank     sql.NullInt64  `db:"guild_rank"`
	LastLoginText string
}

//Find all Characters by wildcard name
func FindAllByName(db *sqlx.DB, name string) (characters []*CharacterOutput, err error) {
	rows, err := db.Queryx(`SELECT cd.*, cs.name as class_name, g.name as guild_name, g.id as guild_id, gm.rank as guild_rank 
		FROM character_data cd 
		JOIN class_skill cs ON (cs.class = cd.class) 
		LEFT JOIN guild_members gm ON (gm.char_id = cd.id) 
		LEFT JOIN guilds g ON (g.id = gm.guild_id) 
		WHERE cd.Name LIKE ?`, "%"+name+"%")
	if err != nil {
		fmt.Println("Error initial")
		return
	}

	//fmt.Println("Getting Characters by Name", name)
	for rows.Next() {
		char := &CharacterOutput{}
		err = rows.StructScan(char)
		if err != nil {
			return
		}
		/*
			lastLogin := time.Unix(char.Last_login, 0)
			lastLoginDuration := time.Since(lastLogin)
			if lastLoginDuration.Hours() > 0 {
				char.LastLoginText += fmt.Sprintf("%9.f hour", lastLoginDuration.Hours())
				if lastLoginDuration.Hours() > 0 {
					char.LastLoginText += "s"
				}
				char.LastLoginText += " "
			}
			if lastLoginDuration.Minutes() > 0 {
				if len(char.LastLoginText) > 0 {
					char.LastLoginText += ", "
				}
				char.LastLoginText += fmt.Sprintf("%9.f minute", lastLoginDuration.Minutes())
				if lastLoginDuration.Minutes() > 0 {
					char.LastLoginText += "s"
				}
				char.LastLoginText += " "
			}
			if lastLoginDuration.Seconds() > 0 {
				if len(char.LastLoginText) > 0 {
					char.LastLoginText += ", "
				}
				char.LastLoginText += fmt.Sprintf("%9.f second", lastLoginDuration.Seconds())
				if lastLoginDuration.Seconds() > 0 {
					char.LastLoginText += "s"
				}
				char.LastLoginText += " "
			}
			if len(char.LastLoginText) > 0 {
				char.LastLoginText += "ago"
			}
		*/
		characters = append(characters, char)
	}
	return
}

//Get a character by ID
func GetById(db *sqlx.DB, id string) (character *CharacterOutput, err error) {
	character = &CharacterOutput{}
	err = db.QueryRowx(`SELECT cd.*, cs.name as class_name 
		FROM character_data cd 
		JOIN class_skill cs ON (cs.class = cd.class) 
		WHERE cd.id = ?`, id).StructScan(character)
	if err != nil {
		fmt.Errorf("Error querying: %s", err.Error())
		return
	}
	return
}
