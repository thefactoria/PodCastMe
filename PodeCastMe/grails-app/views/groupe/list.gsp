
<%@ page import="podcastDomain.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-groupe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nomGroupe" title="${message(code: 'groupe.nomGroupe.label', default: 'Nom Groupe')}" />
					
						<th><g:message code="groupe.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupeInstanceList}" status="i" var="groupeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nomGroupe")}</g:link></td>
					
						<td>${fieldValue(bean: groupeInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
