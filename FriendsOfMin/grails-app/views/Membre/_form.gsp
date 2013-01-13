<%@ page import="friendsofmin.Membre" %>



<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="membre.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${membreInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="membre.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${membreInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="membre.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${membreInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'sexe', 'error')} required">
	<label for="sexe">
		<g:message code="membre.sexe.label" default="Sexe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexe" from="${membreInstance.constraints.sexe.inList}" required="" value="${membreInstance?.sexe}" valueMessagePrefix="membre.sexe"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="membre.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="age" min="13" required="" value="${fieldValue(bean: membreInstance, field: 'age')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'amis', 'error')} ">
	<label for="amis">
		<g:message code="membre.amis.label" default="Amis" />
		
	</label>
	<g:select name="amis" from="${friendsofmin.Membre.list()}" multiple="multiple" optionKey="id" size="5" value="${membreInstance?.amis*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'passions', 'error')} ">
	<label for="passions">
		<g:message code="membre.passions.label" default="Passions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${membreInstance?.passions?}" var="p">
    <li><g:link controller="passions" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="passions" action="create" params="['membre.id': membreInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'passions.label', default: 'Passions')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="membre.photos.label" default="Photos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${membreInstance?.photos?}" var="p">
    <li><g:link controller="photoTaggee" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="photoTaggee" action="create" params="['membre.id': membreInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'photoTaggee.label', default: 'PhotoTaggee')])}</g:link>
</li>
</ul>

</div>

