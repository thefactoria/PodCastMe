
<%@ page import="friendsofmin.Passions" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'passions.label', default: 'Passions')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-passions" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-passions" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="passions.adherant.label" default="Adherant" /></th>
					
						<th><g:message code="passions.passion.label" default="Passion" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${passionsInstanceList}" status="i" var="passionsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${passionsInstance.id}">${fieldValue(bean: passionsInstance, field: "adherant")}</g:link></td>
					
						<td>${fieldValue(bean: passionsInstance, field: "passion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${passionsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
