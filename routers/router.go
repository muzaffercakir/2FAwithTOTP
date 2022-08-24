package routers

import (
	"otpAuth/controllers"

	"github.com/beego/beego"
)

func init() {
	beego.Router("/", &controllers.Base{}, "get,post:Index")
	beego.Router("/admin", &controllers.Base{}, "get,post:Admin")
	beego.Router("/create", &controllers.Base{}, "get,post:Create")
	beego.Router("/admin/auth", &controllers.Base{}, "get,post:AuthPage")
	beego.Router("/admin/loginauth", &controllers.Base{}, "get,post:LoginAuthPage")
	beego.Router("/admin/logout", &controllers.Base{}, "get,post:Logout")
	beego.Router("/admin/authinactive", &controllers.Base{}, "get,post:Set2faInactive")

}
