package podcastme

import podcastDomain.User

class UserService {

User createUser(nom, prenom, pseudo, email, passwd) {
    User user = new User(nom: nom, prenom: prenom, pseudo : pseudo, email : email, passwd : passwd)
    user.save()
	user
  }
}
