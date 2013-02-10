<%@ page import="podcastDomain.Groupe" %>



<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'nomGroupe', 'error')} required">
	<label for="nomGroupe">
		<g:message code="groupe.nomGroupe.label" default="Nom Groupe" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomGroupe" maxlength="30" pattern="${groupeInstance.constraints.nomGroupe.matches}" required="" value="${groupeInstance?.nomGroupe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="groupe.user.label" default="User" />
		
	</label>
	<g:select id="user" name="user.id" from="${podcastDomain.User.list()}" optionKey="id" value="${groupeInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'podcasts', 'error')} ">
	<label for="podcasts">
		<g:message code="groupe.podcasts.label" default="Podcasts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${groupeInstance?.podcasts?}" var="p">
    <li><g:link controller="podcast" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="podcast" action="create" params="['groupe.id': groupeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'podcast.label', default: 'Podcast')])}</g:link>
</li>
</ul>

</div>

