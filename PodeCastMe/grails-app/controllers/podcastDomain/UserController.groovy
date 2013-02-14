package podcastDomain

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def inscription(){
		render(view: "/user/edit.gsp")
	}
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
		session.user = userInstance
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
		render(view:"/layouts/accueil.gsp")
    }

  
	def login = {
		if (request.method == 'POST') {
			def u = User.findByPseudoAndPasswd(params.pseudo, params.passwd)
			if (u) {
				// username and password match -> log in
				session.user = u
				if(u.isAdmin)
				render(view:"/layouts/administration.gsp")
				else
				render(view:"/layouts/accueil.gsp")
				//redirect(action: "list", params: params)
			} else {
			flash.message = "User not found"
			redirect(action: "create")
			}
		} 
	}
	
	def logout = {
		session.invalidate()
		render(view:'/index')
		}

}
