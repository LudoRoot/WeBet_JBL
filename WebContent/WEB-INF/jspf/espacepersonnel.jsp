<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
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
<title>Espace Perso</title>
</head>
<body>
	<h2>ceci est l'espace personnel de l'utilisateur</h2>

		<p><a href="<c:url value="/custommercontroller/gomodifdataperso"/>">Mofifier données personnelles</a></p>
		<p><a href="<c:url value="/custommercontroller/golistparis"/>">Consulter mes paris</a></p>
		<p>	<form method ="get" action="<c:url value="/custommercontroller/gotoaffichedesrencontre" />">
			<button type="submit" class="button button1">
						Voir les rencontres que WeBet vous propose !
			</button>
		</form> 
		</p>
		
		<p><a href="<c:url value="/logout"/>">Log out</a></p>
	

</body>
</html>