package test.functionnal
import geb.spock.GebReportingSpec 
class AuthentificationFuncSpec extends GebReportingSpec{
	def "doit s authentifier avce un login name et un password valide "(){
		when:
		go "index.gsp"

		then:
		$("#page-title").text() == "Welcome"

		when:
		$("#login-form input[name=username]").value("marwen")
		$("#login-form input[name=password]").value("okok")
		$("#login-form input[name=envoyer]").click()

		then:
		go "/layouts/accueil"
	}

	def "si utilisateur est un administrateur"(){
		when:
		go "index.gsp"

		then:
		$("#page-title").text() == "Welcome"

		when:
		$("#login-form input[name=username]").value("admin")
		$("#login-form input[name=password]").value("admin")
		$("#login-form input[name=envoyer]").click()

		then:
		$(".page-header").text() == "Login"
		$(".errors li").size() == 1
		$(".errors li")[0].text() == "Invalid username or password"

}
}
