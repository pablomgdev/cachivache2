package secrets

import (
	"errors"
	"os"

	"github.com/joho/godotenv"
)

type secretManager struct {
	// empty for now
}

var SecretsManager secretManager

func NewSecretManager() error {
	err := godotenv.Load()
	if err != nil {
		return errors.New("error loading .env file")
	}
	SecretsManager = secretManager{}
	return nil
}

func (sm *secretManager) GetSecret(key string) string {
	value := os.Getenv(key)
	return value
}
