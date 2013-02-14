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

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/groupe/show/1'
        assert controller.flash.message != null
        assert Groupe.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/groupe/list'

        populateValidParams(params)
        def groupe = new Groupe(params)

        assert groupe.save() != null

        params.id = groupe.id

        def model = controller.show()

        assert model.groupeInstance == groupe
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/groupe/list'

        populateValidParams(params)
        def groupe = new Groupe(params)

        assert groupe.save() != null

        params.id = groupe.id

        def model = controller.edit()

        assert model.groupeInstance == groupe
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/groupe/list'

        response.reset()

        populateValidParams(params)
        def groupe = new Groupe(params)

        assert groupe.save() != null

        // test invalid parameters in update
        params.id = groupe.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/groupe/edit"
        assert model.groupeInstance != null

        groupe.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/groupe/show/$groupe.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        groupe.clearErrors()

        populateValidParams(params)
        params.id = groupe.id
        params.version = -1
        controller.update()

        assert view == "/groupe/edit"
        assert model.groupeInstance != null
        assert model.groupeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/groupe/list'

        response.reset()

        populateValidParams(params)
        def groupe = new Groupe(params)

        assert groupe.save() != null
        assert Groupe.count() == 1

        params.id = groupe.id

        controller.delete()

        assert Groupe.count() == 0
        assert Groupe.get(groupe.id) == null
        assert response.redirectedUrl == '/groupe/list'
    }
}
