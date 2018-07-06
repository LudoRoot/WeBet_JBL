<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>liste de paris</title>
</head>
<body>
	<h2>Voici la liste de vos paris:</h2>

	<table style="width: 100%">
		<tr>
			<th><spring:message code="liste.pari.rencontre.date_debut" /></th>
			<th><spring:message code="liste.pari.somme" /></th>
			<th><spring:message code="liste.pari.rencontre.cote" /></th>
			<th><spring:message code="liste.pari.rencontre.equipe1" /></th>
			<th><spring:message code="liste.pari.rencontre.equipe2" /></th>
			<th><spring:message code="liste.pari.rencontre.resultat1" /></th>
			<th><spring:message code="liste.pari.rencontre.resultat2" /></th>
			<th><spring:message code="liste.pari.vainqueur" /></th>

		</tr>
		<c:forEach items="${listparis}" var="pari" varStatus="status">
			<tr>
				<td>${pari.rencontre.date_debut}</td>
				<td>${pari.somme}</td>
				<td>${pari.rencontre.cote}</td>
				<td>${pari.rencontre.equipe1.nom}</td>
				<td>${pari.rencontre.equipe2.nom}</td>
				<td>${pari.rencontre.resultat1}</td>
				<td>${pari.rencontre.resultat2}</td>
				<td>${pari.vainqueur.nom}</td>


			</tr>
		</c:forEach>
	</table>

</body>
</html>