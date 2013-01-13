package friendsofmin

import org.springframework.dao.DataIntegrityViolationException

class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def displayGraph = {
		def img // byte array
		//...
		response.setHeader('Content-length', img.length)
		response.contentType = 'image/png' // or the appropriate image content type
		response.outputStream << img
		response.outputStream.flush()
	}
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [photoInstanceList: Photo.list(params), photoInstanceTotal: Photo.count()]
    }

    def create() {
        [photoInstance: new Photo(params)]
    }

    def save() {
		def image = new Photo()
		image.properties = params
		def f = request.getFile('image')
		//image.fileName = f.getOriginalFilename()
		log.debug ("Image contentType: ")
		//image.contentType = f.getContentType()
		//image.file = f.getBytes()
		if(image.save()) {
			redirect(action:show,id:image.id)
		}
		else {
			render(view:'create',model:[image:image])
		}
       // def photoInstance = new Photo(params)
        //if (!photoInstance.save(flush: true)) {
          //  render(view: "create", model: [photoInstance: photoInstance])
            return
        }

		//flash.message = message(code: 'default.created.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        //redirect(action: "show", id: photoInstance.id)
    //}

    def show() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def edit() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def update() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoInstance.version > version) {
                photoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photo.label', default: 'Photo')] as Object[],
                          "Another user has updated this Photo while you were editing")
                render(view: "edit", model: [photoInstance: photoInstance])
                return
            }
        }

        photoInstance.properties = params

        if (!photoInstance.save(flush: true)) {
            render(view: "edit", model: [photoInstance: photoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

    def delete() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            photoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
