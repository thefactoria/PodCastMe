<%@ page import="podcastDomain.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="user.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="30" pattern="${userInstance.constraints.nom.matches}" required="" value="${userInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="user.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" maxlength="30" pattern="${userInstance.constraints.prenom.matches}" required="" value="${userInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'pseudo', 'error')} required">
	<label for="pseudo">
		<g:message code="user.pseudo.label" default="Pseudo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pseudo" maxlength="30" pattern="${userInstance.constraints.pseudo.matches}" required="" value="${userInstance?.pseudo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwd', 'error')} required">
	<label for="passwd">
		<g:message code="user.passwd.label" default="Passwd" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passwd" maxlength="30" pattern="${userInstance.constraints.passwd.matches}" required="" value="${userInstance?.passwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'groupes', 'error')} ">
	<label for="groupes">
		<g:message code="user.groupes.label" default="Groupes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.groupes?}" var="g">
    <li><g:link controller="groupe" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="groupe" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'groupe.label', default: 'Groupe')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="user.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${userInstance?.image}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="user.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${userInstance?.isAdmin}" />
</div>

