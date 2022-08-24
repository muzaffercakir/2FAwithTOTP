package lib

import (
	"os"
	"strconv"

	"github.com/beego/beego"
	"github.com/joho/godotenv"
)

func ConfigGet(config string) string {
	if err := godotenv.Load(); err != nil {
		return beego.AppConfig.String(config)
	}
	return os.Getenv(config)
}

func ConfigInt(config string) int {
	if err := godotenv.Load(); err != nil {
		format, err := beego.AppConfig.Int(config)
		if err != nil {
			beego.Error(err)
		}
		return format
	}
	format, err := strconv.Atoi(os.Getenv(config))
	if err != nil {
		beego.Error(err)
	}
	return format
}
