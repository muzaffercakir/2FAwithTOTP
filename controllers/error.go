package controllers

import "github.com/beego/beego"

type Error struct {
	Base
}

func (c *Error) NestPrepare() {
}

func (c *Error) Error404() {
	flash := beego.NewFlash()
	flash.Error("page not found")
	c.TplName = "error/404.tpl"
}

func (c *Error) Error500() {
	flash := beego.NewFlash()
	flash.Error("internal server error")
	c.TplName = "error/500.tpl"
}

func (c *Error) ErrorDb() {
	flash := beego.NewFlash()
	flash.Error("database is now down")
	c.TplName = "error/database.tpl"
}

func (c *Error) Error401() {
	c.TplName = "error/401.tpl"
}

func (c *Error) Error403() {
	c.TplName = "error/401.tpl"
}

func (c *Error) Error429() {
	c.TplName = "error/401.tpl"
}

func (c *Error) Error406() {
	c.TplName = "error/401.tpl"
}
