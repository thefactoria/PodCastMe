package friendsofmin


import friendsofmin.Membre
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Membre)
class MembreTests {

    void testToString() {
	 Membre m=new Membre(nom: 'ok', prenom: 'ko', mail: 'mail@mail.mail', sexe: 'M', age: 43)
       assertTrue(m.toString()=='ok')
    }
}
