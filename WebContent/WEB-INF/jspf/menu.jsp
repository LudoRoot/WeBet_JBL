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

	<sec:authorize access="!isAuthenticated()">
		<form method="POST"	action="<c:url value="/logincontroller/gotomenu" />" modelAttribute="login">
			<form:label path="login.email">
				<spring:message code="message.login.email" />
			</form:label>
			<form:input path="login.email" name="username" />
			<form:label path="login.mdp">
				<spring:message code="message.login.mdp" />
			</form:label>
			<form:input path="login.mdp" name="password" />
			<input type="submit" value="<spring:message code="message.login.boutonconnection" />" />
		</form>
		<form method="GET" action="<c:url value="/logincontroller/createlogin" />">
			<input type="submit" value="<spring:message code="message.login.boutoninscription" />" />
		</form>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_USER')">
		<spring:message code="message.bienvenue" /> ${login.nom} ${login.prenom} 
	</sec:authorize>
</body>
</html>