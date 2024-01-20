package main

import (
	"cachivache2/api/routers"
	"cachivache2/internal/secrets"
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	host := secrets.SecretsManager.GetSecret("HOST")
	port := secrets.SecretsManager.GetSecret("PORT")

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
