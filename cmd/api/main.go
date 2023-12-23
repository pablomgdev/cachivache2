package main

import (
	"cachivache2/api/routers"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	// Environment variables
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	host := os.Getenv("HOST")
	port := os.Getenv("PORT")

	// Middlewares
	router := gin.New()
	router.Use(gin.Logger())
	router.Use(gin.Recovery())

	// Routes
	routers.SetExampleRoutes(router)

	// Starting server
	log.Println("Starting server on: http://"+host+":"+port)
	router.Run(":"+port)
}
