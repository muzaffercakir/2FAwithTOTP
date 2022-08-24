package lib

import (
	"golang.org/x/crypto/bcrypt"
)

// p => raw password, h => bcrypt or create text
func CryptoPassword(p, h string) (string, error) {
	password := []byte(p)
	if h == "create" {
		hashedPassword, err := bcrypt.GenerateFromPassword(password, bcrypt.DefaultCost)
		if err != nil {
			return "", err
		}
		return string(hashedPassword), nil
	}
	err := bcrypt.CompareHashAndPassword([]byte(h), password)
	return "", err
}
