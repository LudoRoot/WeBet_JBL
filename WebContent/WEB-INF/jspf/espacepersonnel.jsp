<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="utf-8">
<style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 18px;
    margin: auto;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    font-family:'Comic Sans MS';
    align: center
}


.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.button1:hover {
    background-color: #4CAF50;
    color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="message.espaceperso.title" /></title>
</head>
<body>
	<h2><spring:message code="message.espaceperso.message1" /></h2>

		<p> <spring:message code="message.espaceperso.montantsolde" /> ${activelogin.client.soldecompte} euro.</p>
		
		<p>	<form method ="get" action="<c:url value="/custommercontroller/goaddmoney" />">
			<button type="submit" class="button button1">
						<spring:message code="message.espaceperso.addmoney" />
			</button>
		</form> 
		</p>
		
		<p>	<form method ="get" action="<c:url value="/custommercontroller/gomodifdataperso" />">
			<button type="submit" class="button button1">
						<spring:message code="message.espaceperso.modifdonnees" />
			</button>
		</form> 
		</p>
		
		<p>	<form method ="get" action="<c:url value="/custommercontroller/golistparis" />">
			<button type="submit" class="button button1">
						<spring:message code="message.espaceperso.seebets" />
			</button>
		</form> 
		</p>
		
		<p>	<form method ="get" action="<c:url value="/custommercontroller/gotoaffichedesrencontre" />">
			<button type="submit" class="button button1">
						<spring:message code="message.espaceperso.rencontresproposees" />
			</button>
		</form> 
		</p>
		
		<p><a href="<c:url value="/logout"/>">Log out</a></p>
	

</body>
</html>