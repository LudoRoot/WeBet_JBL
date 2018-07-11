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
<title><spring:message code="affiche.rencontres.titre" /></title>
</head>
<body>
<script type="text/javascript">
function maFonction(nb){
	var cote1 = document.getElementById('choix1'+nb).checked;
	var cote0 = document.getElementById('choix0'+nb).checked;
	var cote2 = document.getElementById('choix2'+nb).checked;
	if(cote1) {
		document.getElementById('test'+nb).innerHTML = "Gains potentiels :"+document.getElementById('cote1'+nb).value*document.getElementById('mise'+nb).value;
	}
	if(cote0) {
		document.getElementById('test'+nb).innerHTML = "Gains potentiels :"+document.getElementById('cote0'+nb).value*document.getElementById('mise'+nb).value;
	}
	if(cote2) {
		document.getElementById('test'+nb).innerHTML = "Gains potentiels :"+document.getElementById('cote2'+nb).value*document.getElementById('mise'+nb).value;
	}
}
</script>
 <h1><spring:message code="affiche.rencontres.text1" /></h1>
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
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:if test="${today.time lt rencontre.date_debut.time}">
										<input type="hidden" id="cote1${rencontre.id}" value="${rencontre.cote1}" />
										<input type="hidden" id="cote0${rencontre.id}" value="${rencontre.cotenull}" />
										<input type="hidden" id="cote2${rencontre.id}" value="${rencontre.cote2}" />
										<input onclick="maFonction(${rencontre.id})" id="choix1${rencontre.id}" type="radio" name="choix" value="${rencontre.equipe1.id}"> ${rencontre.equipe1.nom}
										<input onclick="maFonction(${rencontre.id})" id="choix0${rencontre.id}" type="radio" name="choix" value="0" > match nul 
										<input onclick="maFonction(${rencontre.id})" id="choix2${rencontre.id}" type="radio" name="choix" value="${rencontre.equipe2.id}"> ${rencontre.equipe2.nom}
										<br>
																				
 										<spring:message code="affiche.rencontres.text2" />: 	<input type="number" id="mise${rencontre.id}" name="mise" onchange="maFonction(${rencontre.id})" value="${mise}" min="1" max=
 												<c:choose>
    												<c:when test="${activelogin.client.montantmax >= activelogin.client.soldecompte}">
       												 	"${activelogin.client.soldecompte}" 
        											</c:when>    
    												<c:otherwise>
       													"${activelogin.client.montantmax}"
    												</c:otherwise>
												</c:choose>
 											>
									<div id="test${rencontre.id}"></div>
									<input type="submit">
									</c:if>
								</form>   						
								</sec:authorize>
							</p> 
						</c:if>
					</c:forEach>
				</th>
 			</c:forEach>
 		</tr>
 	
 	
 	</table>

<p><a href="<c:url value="/custommercontroller/golistparis"/>"><spring:message code="affiche.rencontres.text3" /></a></p>
<p><a href="<c:url value="/logincontroller/dispatchbyrole"/>"><spring:message code="affiche.rencontres.text4" /></a></p>
 
 
</body>
</html>