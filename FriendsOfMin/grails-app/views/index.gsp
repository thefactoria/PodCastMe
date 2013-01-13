<%@ page import="friendsofmin.Membre" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome To Friends of Mine</title>

<style type="text/css" media="screen">
#status {
	background-color: #bcbcbc;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>




	<div id="page-body" role="main">
		<h1>Welcome to Friends of Mine</h1>
		<p>This web site will help you to connect with your friends
			.... <br> watching pictures ,videos and more awesome stuff be tuned !!!</p>

		 <%-- <div id="controller-list" role="navigation">
			<h2>Available Controllers:</h2>
			<ul>
				<g:each var="c"
					in="${grailsApplication.controllerClasses.sort { it.fullName } }">
					<li class="controller"><g:link
							controller="${c.logicalPropertyName}">
							${c.fullName}
						</g:link></li>
				</g:each>
			</ul>
		</div>
	</div>
	--%>
	<br/>
	<br/>
	<br/>
			
				<g:set var="entityName" value="${message(code: 'membre.label', default: 'Membre')}" />
		<g:fieldValue bean="${membreInstance}" field="nom"/>
	<g:form controller="Membre" action="connexion" methode="post" >
	<label for="nom">
		<g:message code="membre.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'nom', 'error')} required">
	<g:textField name="nom" required="" />
	</div>
	<br/>
	Password
	<br/>
	<input type="password" name="mdp"  />
		<br/>
		
		
			
		<g:submitButton class="connexion" name="Valider" value="Connexion"/>
		
		</g:form>
	
	<br/>
<a href="http://localhost:8080/FriendsOfMin/Membre/create">Crée un nouveau membre </a>	
	
	<br/>	<br/>
	<br/>
	<br/>	<br/>
	<br/>
	<br/>
	
	<g:include page="footer.gsp" />
	<g:include page="DateTagLib.groovy" />

</body>
</html>
