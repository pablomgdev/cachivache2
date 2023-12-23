package main

import (
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
	v1Router := router.Group("api/v1")
  {
		v1Router.GET("/", func(c *gin.Context) {
			c.JSON(200, gin.H{
				"message": "Hello, Gin!",
			})
		})
  }

	// Starting server
	log.Println("Starting server on: http://"+host+":"+port)
	router.Run(":"+port)
}
