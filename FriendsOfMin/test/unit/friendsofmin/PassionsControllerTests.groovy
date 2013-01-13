package friendsofmin



import org.junit.*
import grails.test.mixin.*

@TestFor(PassionsController)
@Mock(Passions)
class PassionsControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/passions/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.passionsInstanceList.size() == 0
        assert model.passionsInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.passionsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.passionsInstance != null
        assert view == '/passions/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/passions/show/1'
        assert controller.flash.message != null
        assert Passions.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/passions/list'


        populateValidParams(params)
        def passions = new Passions(params)

        assert passions.save() != null

        params.id = passions.id

        def model = controller.show()

        assert model.passionsInstance == passions
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/passions/list'


        populateValidParams(params)
        def passions = new Passions(params)

        assert passions.save() != null

        params.id = passions.id

        def model = controller.edit()

        assert model.passionsInstance == passions
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/passions/list'

        response.reset()


        populateValidParams(params)
        def passions = new Passions(params)

        assert passions.save() != null

        // test invalid parameters in update
        params.id = passions.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/passions/edit"
        assert model.passionsInstance != null

        passions.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/passions/show/$passions.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        passions.clearErrors()

        populateValidParams(params)
        params.id = passions.id
        params.version = -1
        controller.update()

        assert view == "/passions/edit"
        assert model.passionsInstance != null
        assert model.passionsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/passions/list'

        response.reset()

        populateValidParams(params)
        def passions = new Passions(params)

        assert passions.save() != null
        assert Passions.count() == 1

        params.id = passions.id

        controller.delete()

        assert Passions.count() == 0
        assert Passions.get(passions.id) == null
        assert response.redirectedUrl == '/passions/list'
    }
}
