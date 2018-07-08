<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
<style>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>affiche des rencontres</title>
</head>
<body>
 <h1>Voici les rencontres diponibles : </h1>
 <br>
 
 	<table style="width: 100%">
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
							<p>${rencontre.equipe1.nom} <strong>VS</strong> ${rencontre.equipe2.nom}
								<sec:authorize access="hasRole('ROLE_USER')">
								<form action="<c:url value="/custommercontroller/dobet/${rencontre.id}/"/>">
 									Mise: <input type="number" name="mise">
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
 
 
</body>
</html>