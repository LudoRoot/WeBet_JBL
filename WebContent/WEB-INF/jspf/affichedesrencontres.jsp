<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
<style>
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>affiche des rencontres</title>
</head>
<body>
 <h1>Voici les rencontres diponibles : </h1>
 <br>
 <p> <spring:message code="message.espaceperso.montantsolde" /> ${activelogin.client.soldecompte} euro.</p>
 
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

<p><a href="<c:url value="/custommercontroller/golistparis"/>">Voir mes paris</a></p>
<p><a href="<c:url value="/logincontroller/dispatchbyrole"/>">Retour espace personnel</a></p>
 
 
</body>
</html>