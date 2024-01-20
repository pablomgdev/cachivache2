package jwt

import (
	"cachivache2/internal/secrets"
)

type claims struct {
	userEmail string
}

var secretKey = secrets.SecretsManager.GetSecret("JWT_SECRET_KEY")

func createToken(claims) {
	
}
