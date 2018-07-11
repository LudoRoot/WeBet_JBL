<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="message.modifbet.titre" /></title>
</head>

<body>

<p> <spring:message code="message.espaceperso.montantsolde" /> ${activelogin.client.soldecompte} euro.</p>
<br>
<p> cote:${bettomodif.rencontre.cote1}<- ${bettomodif.rencontre.equipe1.nom} <strong>VS</strong> ${bettomodif.rencontre.equipe2.nom} -> cote:${bettomodif.rencontre.cote2} <br> <cote match nul:${rencontre.cotenull}>
<sec:authorize access="hasRole('ROLE_USER')">
								<form action="<c:url value="/custommercontroller/modbet/${bettomodif.id}"/>">
										
										<input type="radio" name="choix" value="${bettomodif.rencontre.equipe1.id}"> ${bettomodif.rencontre.equipe1.nom}
										<input type="radio" name="choix" value="0" > match nul 
										<input type="radio" name="choix" value="${bettomodif.rencontre.equipe2.id}"> ${bettomodif.rencontre.equipe2.nom}
										<br>
																				
 									<spring:message code="affiche.rencontres.text2" />: 	<input type="number" name="mise" value="${mise}" min="1" max=
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

</body>
</html>