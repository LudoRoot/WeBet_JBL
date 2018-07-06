<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Espace Admin</title>
</head>
<body>
	<h2>ceci est l'espace administration</h2>
	
	<!--    <sec:authorize access="hasRole('ROLE_USER')"> -->
		<p><a href="<c:url value="/admincontroller/gomodifdataperso"/>">Mofifier données personnelles</a></p>
		<p><a href="<c:url value="/custommercontroller/golistparis"/>">Consulter mes paris</a></p>
	<!-- 	</sec:authorize> -->
		<p><a href="<c:url value="/logout"/>">Log out</a></p>
	<!-- <p><sec:authentication property="principal.authorities"/></p> -->
	
</body>
</html>