package friendsofmin
/*
 Une activite est caracterisee par un titre ainsi qu'un descriptif. Ecrire une classe
 Activite
comportant une methode toString.
 */
class Activite {
	static hasMany = [participants : Membre]
    Membre m
	String titre,desc
	String toString() { return titre }
}
