<%@ page import="friendsofmin.Passions" %>



<div class="fieldcontain ${hasErrors(bean: passionsInstance, field: 'adherant', 'error')} required">
	<label for="adherant">
		<g:message code="passions.adherant.label" default="Adherant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="adherant" name="adherant.id" from="${friendsofmin.Membre.list()}" optionKey="id" required="" value="${passionsInstance?.adherant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passionsInstance, field: 'passion', 'error')} required">
	<label for="passion">
		<g:message code="passions.passion.label" default="Passion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="passion" name="passion.id" from="${friendsofmin.Activite.list()}" optionKey="id" required="" value="${passionsInstance?.passion?.id}" class="many-to-one"/>
</div>

