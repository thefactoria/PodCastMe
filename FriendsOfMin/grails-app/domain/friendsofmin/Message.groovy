package friendsofmin

class Message {
   
   String messages
   Membre env,rec
   Date date
   static constraints = {
	   messages blank: false
   }
}
