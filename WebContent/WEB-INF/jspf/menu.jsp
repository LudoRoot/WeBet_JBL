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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	
	<c:if test="${param.error}">
		<spring:message code="message.menu.connectionerror" />
	</c:if>
	<c:if test="${param.logout}">
		<spring:message code="message.menu.connectionlogout" />
	</c:if>

	<sec:authorize access="!isAuthenticated()">
<div class="container">	
<h2>Connexion</h2>
  <form method="POST" action="<c:url value="/menu" />">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
    <div class="form-group">
      <label for="username"><spring:message code="message.menu.utilisateur" /></label>
      <input type="text" class="form-control" name="username" value="${login.email}" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="password"><spring:message code="message.menu.mdp" /></label>
      <input type="password" class="form-control" name="password" value="${login.mdp}" placeholder="Enter password">
    </div>
    <button type="submit" class="btn btn-default" value="<spring:message code="message.login.boutonconnection"/>">Se connecter</button>
  <br>
  </form>
  		<form method="GET" action="<c:url value="/logincontroller/gotoinscription" />">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			<button type="submit" class="btn btn-default" value="<spring:message code="message.login.boutoninscription" />">S'inscrire</button>
		</form>
</div>
	</sec:authorize>
</body>
</html>