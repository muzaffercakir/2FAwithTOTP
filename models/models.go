package models

import (
	"github.com/beego/beego/orm"
)

type DemoUser struct {
	Id          int64  `orm:"auto"`
	Email       string `orm:"size(255)"`
	Password    string `orm:"size(255)"`
	OtpSecret   string `orm:"size(255)"`
	IsOtpActive bool   `orm:"int8(1);default(0)"`
}

func init() {
	orm.RegisterModel(
		new(DemoUser),
		//new(User),
	)

}

// Daha Sonra Kullanılacak Olan Model

/* type User struct {
	Id         int64     `orm:"auto"`
	Firstname  string    `orm:"size(255)"`
	Lastname   string    `orm:"size(255)"`
	Email      string    `orm:"size(255)"`
	Password   string    `orm:"size(255)"`
	Status     bool      `orm:"int8(1);default(0)"`
	AuthStatus bool      `orm:"int8(1);default(0)"`
	Created    time.Time `orm:"auto_now_add;type(datetime)"`
	Updated    time.Time `orm:"auto_now;type(datetime)"`
} */
