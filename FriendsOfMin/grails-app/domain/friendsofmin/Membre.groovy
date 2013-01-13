package friendsofmin
/*
 Question 1. Pour s'inscrire a Friends of Mine, une personne doit donner son prenom, son nom, son adresse
electronique, son sexe et sa date de naissance. Ecrire une classe
Membre comportant une methode toString
*/
class Membre {
	
   String nom,prenom, mail, sexe
   int age
   static hasMany = [photos : PhotoTaggee,passions : Passions,amis: Membre ]
   //static hasMany = [ amis : Membre]
   
	String toString() { return nom }
static constraints = {
	nom blank: false, unique: true
	prenom blank: false
	mail email: true,blank: false
	sexe blank: false, inList : ['M','F']
	age blank: false,min: 13
	  }
	 
}
//      194.199.56.73 etu5 etu5