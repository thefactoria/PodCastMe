<%@ page import="podcastDomain.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'sujet', 'error')} required">
	<label for="sujet">
		<g:message code="contact.sujet.label" default="Sujet" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sujet" maxlength="50" required="" value="${contactInstance?.sujet}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="contact.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" maxlength="50" pattern="${contactInstance.constraints.email.matches}" required="" value="${contactInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="contact.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" maxlength="100" required="" value="${contactInstance?.message}"/>
</div>

