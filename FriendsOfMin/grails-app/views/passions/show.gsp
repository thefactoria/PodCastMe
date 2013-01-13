
<%@ page import="friendsofmin.Passions" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passions.label', default: 'Passions')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-passions" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-passions" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list passions">
			
				<g:if test="${passionsInstance?.adherant}">
				<li class="fieldcontain">
					<span id="adherant-label" class="property-label"><g:message code="passions.adherant.label" default="Adherant" /></span>
					
						<span class="property-value" aria-labelledby="adherant-label"><g:link controller="membre" action="show" id="${passionsInstance?.adherant?.id}">${passionsInstance?.adherant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${passionsInstance?.passion}">
				<li class="fieldcontain">
					<span id="passion-label" class="property-label"><g:message code="passions.passion.label" default="Passion" /></span>
					
						<span class="property-value" aria-labelledby="passion-label"><g:link controller="activite" action="show" id="${passionsInstance?.passion?.id}">${passionsInstance?.passion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${passionsInstance?.id}" />
					<g:link class="edit" action="edit" id="${passionsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
