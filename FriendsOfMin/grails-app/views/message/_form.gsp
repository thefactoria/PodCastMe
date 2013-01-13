<%@ page import="friendsofmin.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'messages', 'error')} required">
	<label for="messages">
		<g:message code="message.messages.label" default="Messages" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="messages" required="" value="${messageInstance?.messages}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="message.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${messageInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'env', 'error')} required">
	<label for="env">
		<g:message code="message.env.label" default="Env" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="env" name="env.id" from="${friendsofmin.Membre.list()}" optionKey="id" required="" value="${messageInstance?.env?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'rec', 'error')} required">
	<label for="rec">
		<g:message code="message.rec.label" default="Rec" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rec" name="rec.id" from="${friendsofmin.Membre.list()}" optionKey="id" required="" value="${messageInstance?.rec?.id}" class="many-to-one"/>
</div>

