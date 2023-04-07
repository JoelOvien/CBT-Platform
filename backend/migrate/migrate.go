package main

import (
	"fmt"
	"log"

	"github.com/JoelOvien/CBT-Platform/blob/dev/backend/initializers"
	"github.com/JoelOvien/CBT-Platform/blob/dev/backend/models"
)

// Here we load the environment variables and created the connection pool to Postgres db
func init() {
	config, err := initializers.LoadConfig(".")
	if err != nil {
		log.Fatal("? Could not load environment variables", err)
	}

	initializers.ConnectDB(&config)
}

func main() {
	// We evoke this function provided by GORM to create the db migration and push changes to the database
	initializers.DB.AutoMigrate(&models.User{})
	fmt.Println("🚀 Migration complete")
}
