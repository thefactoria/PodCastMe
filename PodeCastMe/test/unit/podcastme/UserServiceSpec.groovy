



















package podcastme

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(UserService)
class UserServiceSpec extends Specification {

 def userService

  def "user create"() {

    expect:
    userService.createUser(nom, prenom, pseudo, email, passwd).hasErrors() == creationFailed

    where:
    nom 	| prenom 	| pseudo 	| email  	|  	passwd 	| creationFailed
    "test"		| "prenom" 	| "psd" | "toto@toto.fr"  | "password"| false
    null	 	| "toto" 	| "psd"	| "toto@toto.fr"		| "password"| true
    "bill"    	|  null 	| "psd"	| "toto@toto.fr"		| "password"| true
    "bill"	  	| "toto" 	| "psd" | "toto@toto.fr"		| "password"| true
    "bill" 		| "toto" 	| "psd" | "toto@toto.fr"			| "password"| true
    "bill"    	| "toto"	| "psd"	| "toto@toto.fr"			| "password"| true
	"bill"    	| "toto"	| null	| "toto@toto.fr"			| "pas"		| true
  }
}