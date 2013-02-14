package podcastDomain



import org.junit.*
import grails.test.mixin.*

@TestFor(GroupeController)
@Mock(Groupe)
class GroupeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/groupe/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.groupeInstanceList.size() == 0
        assert model.groupeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.groupeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.groupeInstance != null
        assert view == '/groupe/create'

        response.reset()
    }









    void testDelete() {
        populateValidParams(params)

















































































        controller.save()
		assert model.groupeInstance != null
		controller.delete()
		assert Groupe.count() == 0
        controller.save()

        assert controller.flash.message == null
















    }
}
