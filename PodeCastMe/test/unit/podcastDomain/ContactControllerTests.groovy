package podcastDomain



import org.junit.*
import grails.test.mixin.*

@TestFor(ContactController)
@Mock(Contact)
class ContactControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contact/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contactInstanceList != 0
        assert model.contactInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contactInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contactInstance != null
        assert view == '/contact/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl != '/contact/show/1'
        assert controller.flash.message == null
        assert Contact.count() != 1
    }

  

   

   

   
}
