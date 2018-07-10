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
<style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 30px;
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


#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}

img {
    display: block;
    margin-left: auto;
    margin-right: auto;
}


h1.intro {
    background-color: #4CAF50;
    color: white;
    text-align="center";
}
</style>
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
<body background=<c:url value="/static/images/Football-field-grass_1920x1200_light.jpg" />>
	<div class="container">

		<c:if test="${param.error}">
			<spring:message code="message.menu.connectionerror" />
		</c:if>
		<c:if test="${param.logout}">
			<spring:message code="message.menu.connectionlogout" />
		</c:if>

		<sec:authorize access="!isAuthenticated()">
			<div class="container">
						<div class="row">
						<div class="col-sm-3" style="height: 200px" align="Left">
						<br><br><br>
				<form method="GET"
					action="<c:url value="/logincontroller/gotoinscription" />">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="submit" class="btn btn-default btn-lg" 
						value="<spring:message code="message.login.boutoninscription" />">S'inscrire</button>
				</form>
			</div>
    <div class="col-sm-6" style="height: 200px" align="Center">	
    
				<br> <img src="<c:url value="/static/images/LogoWeBet.png" />"
 					alt="WeBetLogo" width="450" height="120" />
 					<br>
 					<br>
 	</div>
	<div class="col-sm-3" style="height: 200px" align="Right">	
				<h2>Connexion</h2>
				<form method="POST" action="<c:url value="/menu" />">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<label for="username"><spring:message
								code="message.menu.utilisateur" /></label> <input type="text"
							class="form-control" name="username" value="${login.email}"
							placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="password"><spring:message
								code="message.menu.mdp" /></label> <input type="password"
							class="form-control" name="password" value=""
							placeholder="Enter password">
					</div>
					<button type="submit" class="btn btn-default"
						value="<spring:message code="message.login.boutonconnection"/>">Se
						connecter</button>
					<br>
				</form>
				</div>
			<%-- 	<div class="col-sm-5" >
				<form method="GET"
					action="<c:url value="/logincontroller/gotoinscription" />">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="submit" class="btn btn-default"
						value="<spring:message code="message.login.boutoninscription" />">S'inscrire</button>
				</form> --%>
			</div>
		</sec:authorize>
		<br> 
		
		<img src="<c:url value="/static/images/allsports-3.jpg" />" alt="AllSports" width="420" />
			
	
					<h1 class="intro"><spring:message code="message.menu.presentation" /></h1>		
	
		
		<table id="customers">
 		<tr>
 			<c:forEach items="${liste_sport}" var="sport" varStatus="status">
 				<th>${sport.nomSport}</th>
 			</c:forEach>
 		</tr>
 		<tr>
 			<c:forEach items="${liste_sport}" var="sport" varStatus="status">
 				<td align="center">
 					<c:forEach items="${liste_rencontre}" var="rencontre" varStatus="status">
 						<c:if test="${sport.nomSport == rencontre.equipe1.sport.nomSport}">
							<p> cote:${rencontre.cote1}<- ${rencontre.equipe1.nom} <strong>VS</strong> ${rencontre.equipe2.nom} -> cote:${rencontre.cote2} <br> (cote match nul:${rencontre.cotenull})
								
								<sec:authorize access="hasRole('ROLE_USER')">
								<form action="<c:url value="/custommercontroller/dobet/${rencontre.id}/"/>">
										
										<input type="radio" name="choix" value="${rencontre.equipe1.id}"> ${rencontre.equipe1.nom}
										<input type="radio" name="choix" value="0" > match nul 
										<input type="radio" name="choix" value="${rencontre.equipe2.id}"> ${rencontre.equipe2.nom}
										<br>
																				
 									Mise: 	<input type="number" name="mise" value="${mise}" min="1" max=
 												<c:choose>
    												<c:when test="${activelogin.client.montantmax >= activelogin.client.soldecompte}">
       												 	"${activelogin.client.soldecompte}" 
        											</c:when>    
    												<c:otherwise>
       													"${activelogin.client.montantmax}"
    												</c:otherwise>
												</c:choose>
 											>
									<input type="submit">
								</form>   						
								</sec:authorize>
							</p> 
						</c:if>
					</c:forEach>
				</th>
 			</c:forEach>
 		</tr>
 	
 	
 	</table>
			
</body>
</html>