<%@ page import="friendsofmin.Activite" %>



<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'desc', 'error')} ">
	<label for="desc">
		<g:message code="activite.desc.label" default="Desc" />
		
	</label>
	<g:textField name="desc" value="${activiteInstance?.desc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'm', 'error')} required">
	<label for="m">
		<g:message code="activite.m.label" default="M" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="m" name="m.id" from="${friendsofmin.Membre.list()}" optionKey="id" required="" value="${activiteInstance?.m?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'participants', 'error')} ">
	<label for="participants">
		<g:message code="activite.participants.label" default="Participants" />
		
	</label>
	<g:select name="participants" from="${friendsofmin.Membre.list()}" multiple="multiple" optionKey="id" size="5" value="${activiteInstance?.participants*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'titre', 'error')} ">
	<label for="titre">
		<g:message code="activite.titre.label" default="Titre" />
		
	</label>
	<g:textField name="titre" value="${activiteInstance?.titre}"/>
</div>

