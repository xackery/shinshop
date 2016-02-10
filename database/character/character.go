package character

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"github.com/xackery/goeq/character"
)

type CharacterOutput struct {
	character.CharacterData
	ClassName string `db:"class_name"`
	GuildName string `db:"guild_name"`
	GuildId   int    `db:"guild_id"`
	GuildRank int    `db:"guild_rank"`
}

//Find all Characters by wildcard name
func FindAllByName(db *sqlx.DB, name string) (characters []*CharacterOutput, err error) {
	rows, err := db.Query(`SELECT cd.*, cs.name as class_name, g.name as guild_name, g.id as guild_id, gm.rank as guild_rank 
		FROM character_data cd 
		JOIN class_skill cs ON (cs.class = cd.class) 
		LEFT JOIN guild_members gm ON (gm.char_id = cd.id) 
		LEFT JOIN guilds g ON (g.id = gm.guild_id) 
		WHERE cd.Name LIKE '?'`, "%"+name+"%")
	if err != nil {
		fmt.Println("Error initial")
		return
	}

	fmt.Println("Getting Characters by Name", name)
	for rows.Next() {
		char := &CharacterOutput{}
		err = rows.Scan(char)
		if err != nil {
			return
		}
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
