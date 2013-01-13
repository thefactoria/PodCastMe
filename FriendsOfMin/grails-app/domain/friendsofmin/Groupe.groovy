package friendsofmin

class Groupe {
	Membre admin
	static hasMany = [participants : Membre]
	String desc
	Photo profil
    static constraints = {
		admin blank: false, unique: true
    }
}
