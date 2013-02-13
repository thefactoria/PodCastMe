package podcastDomain



import org.junit.*
import grails.test.mixin.*

@TestFor(UserController)
@Mock(User)
class UserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/user/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userInstanceList.size() == 0
        assert model.userInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userInstance != null
    }

    void testSave() {
        controller.save()
        assert model.userInstance != null
        assert view == '/user/create'
        response.reset()

    }
	
	void testLogout() {
		session.invalidate()
		assert session.user == null
	}
	
 

    void testDelete() {
		controller.save()
		assert model.userInstance != null
        controller.delete()
		assert User.count() == 0

    }
}
