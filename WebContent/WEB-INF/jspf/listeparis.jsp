<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>liste de paris</title>
</head>
<body>
	<h2>Voici la liste de vos paris:</h2>

	<table id="customers">
		<tr align="center">
			<th><spring:message code="liste.pari.rencontre.date_debut" /></th>
			<th><spring:message code="liste.pari.somme" /></th>
			<th><spring:message code="liste.pari.rencontre.cote1" /></th>
			<th><spring:message code="liste.pari.rencontre.cote2" /></th>
			<th><spring:message code="liste.pari.rencontre.equipe1" /></th>
			<th><spring:message code="liste.pari.rencontre.equipe2" /></th>
			<th><spring:message code="liste.pari.rencontre.resultat1" /></th>
			<th><spring:message code="liste.pari.rencontre.resultat2" /></th>
			<th><spring:message code="liste.pari.vainqueur" /></th>
			<th><spring:message code="liste.pari.action" /></th>

		</tr>
		<c:forEach items="${listparis}" var="pari" varStatus="status">
			<tr align="center">
				<td>${pari.rencontre.date_debut}</td>
				<td>${pari.somme}</td>
				<td>${pari.rencontre.cote1}</td>
				<td>${pari.rencontre.cote2}</td>
				<td>${pari.rencontre.equipe1.nom}</td>
				<td>${pari.rencontre.equipe2.nom}</td>
				<td>${pari.rencontre.resultat1}</td>
				<td>${pari.rencontre.resultat2}</td>
				<td>${pari.vainqueur.nom}</td>
				<td>
					<a href="<c:url value="/custommercontroller/modbet?betid=${pari.id}"/>">
					<spring:message code="liste.pari.mod" />
					</a>
				<br>
					<a href="<c:url value="/custommercontroller/delbet?betid=${pari.id}"/>">
					<spring:message code="liste.pari.del" />
					</a>				
				</td>


			</tr>
		</c:forEach>
	</table>

<p><a href="<c:url value="/logincontroller/dispatchbyrole"/>">Retour espace personnel</a></p>

</body>
</html>