package routers

import (
	"cachivache2/api/handlers"

	"github.com/gin-gonic/gin"
)

func SetExampleRoutes(router *gin.Engine) {
	v1Router := router.Group("api/v1")
	{
		v1Router.GET("/", handlers.ExampleHandler)
	}
}
