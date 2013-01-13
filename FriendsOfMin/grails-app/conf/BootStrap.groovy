import friendsofmin.Activite
import friendsofmin.Membre
import friendsofmin.Passions;


class BootStrap {

    def init = { servletContext ->
	
		def f=new Membre (nom: 'kim', prenom: 'duniel', mail: 'mail@mail.mail', sexe: 'M', age: 43)
		def b=new Membre (nom: 'carle', prenom: 'le grand', mail: 'mail@mail.mail', sexe: 'M', age: 21)
		f.save(failOnError: true)
	    def a = new Activite (titre : 'Sky',desc: 'Alpes',m: f)
		a.save(failOnError: true)
		new Activite (titre : 'dance',desc:'Paris',m: f).save(failOnError: true)
		new Activite (titre : 'foot',desc:'Marseille',m: f).save(failOnError: true)
		new Activite (titre : 'rugby',desc:'Toulouse',m: f).save(failOnError: true)
		new Activite (titre : 'jeuxvideo',desc:'Pau',m: f).save(failOnError: true)
		new Activite (titre : 'music',desc:'Lyon',m: f).save(failOnError: true)
		def p=new Passions(adherant : f,passion : a).save()
		f.addToPassions(p)
		f.addToAmis(b)
		Membre.findByNom('ok')
		
		a.addToParticipants(f)
		a.addToParticipants(b)
		
    }
    def destroy = {
    }
}
