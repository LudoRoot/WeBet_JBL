<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="message.menu.titre" /></title>
</head>
<body>

	<c:if test="${param.error}">
		<spring:message code="message.menu.connectionerror" />
	</c:if>
	<c:if test="${param.logout}">
		<spring:message code="message.menu.connectionlogout" />
	</c:if>

	<sec:authorize access="!isAuthenticated()">
		<form method="POST" action="<c:url value="/menu" />">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<label for="username"><spring:message code="message.menu.utilisateur" /></label> 
			<input type="text" name="username" value="${login.email}"> 
			<br> 
			<label for="password"><spring:message code="message.menu.mdp" /></label> 
			<input type="password" name="password" value="${login.mdp}"> 
			<br>
			<input type="submit" value="<spring:message code="message.login.boutonconnection"/>" />
		</form>
		
		<form method="GET" action="<c:url value="/logincontroller/gotoinscription" />">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="<spring:message code="message.login.boutoninscription" />" />
		</form>
	</sec:authorize>

</body>
</html>