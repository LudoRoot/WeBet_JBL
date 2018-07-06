<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="message.admin.titre" /></title>
</head>
<body>
	<h2><spring:message code="message.admin.accueil" /></h2>
	
	<spring:message code="message.admin.listesport" />
	<br>
	<table>
		<c:forEach items="${liste_sport}" var="i">
		<tr>
			<td>${i.nomSport}</td>
			<td><a href="<c:url value="/admincontroller/gotomodifiersport/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			<td><a href="<c:url value="/admincontroller/supprimersport/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a></td>
		</tr>
		</c:forEach>
	</table>
	<form method="POST"	action="<c:url value="/admincontroller/modifiersport"/>" modelAttribute="sport">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<form:hidden path="sport.id" />
		<form:input path="sport.nomSport" />
		<c:if test="${empty sport.nomSport}">
			<input type="submit" value="<spring:message code="message.bouton.ajouter" />" />
		</c:if>
		<c:if test="${not empty sport.nomSport}">
			<input type="submit" value="<spring:message code="message.bouton.modifier" />" />
		</c:if>
	</form>	
	
	<spring:message code="message.admin.listeequipe" />
	<br>
	<table>
		<c:forEach items="${liste_equipe}" var="i">
		<tr>
			<td>${i.nom}</td>
			<td>${i.sport.nomSport}</td>
			<td><a href="<c:url value="/admincontroller/gotomodifierequipe/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			<td><a href="<c:url value="/admincontroller/supprimerequipe/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a></td>
		</tr>
		</c:forEach>
	</table>
	<form method="POST"	action="<c:url value="/admincontroller/modifierequipe"/>" modelAttribute="equipe">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<form:hidden path="equipe.id" />
		<form:input path="equipe.nom" />
		<form:select path="equipe.sport.id">
			<form:options items="${liste_sport}" itemValue="id" itemLabel="nomSport" />
		</form:select>
		<c:if test="${empty equipe.nom}">
			<input type="submit" value="<spring:message code="message.bouton.ajouter" />" />
		</c:if>
		<c:if test="${not empty equipe.nom}">
			<input type="submit" value="<spring:message code="message.bouton.modifier" />" />
		</c:if>
	</form>	
	
	<spring:message code="message.admin.listerencontre" />
	<br>
	<select>
		<c:forEach items="${liste_sport}" var="choixsport">
			<option>${choixsport.nomSport}</option>
		</c:forEach>
	</select>
	<form method="POST"	action="<c:url value="/admincontroller/modifierrencontre"/>" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<form:hidden path="rencontre.id" />
		<form:select path="rencontre.equipe1.id">
			<c:forEach items="${liste_equipe}" var="i">
				${i.sport.nomSport}   ---   ${choixsport.nomSport}
<%-- 				<c:if test="${i.sport.nomSport}==${choixsport.nomSport}"> --%>
<%-- 					<form:option value="i.id">${i.nom}</form:option> --%>
<%-- 				</c:if> --%>
			</c:forEach>
		</form:select>
		
		
		
	</form>	
	<!--    <sec:authorize access="hasRole('ROLE_USER')"> -->
		<p><a href="<c:url value="/admincontroller/gomodifdataperso"/>">Mofifier données personnelles</a></p>
		<p><a href="<c:url value="/custommercontroller/golistparis"/>">Consulter mes paris</a></p>
	<!-- 	</sec:authorize> -->
		<p><a href="<c:url value="/logout"/>">Log out</a></p>
	<!-- <p><sec:authentication property="principal.authorities"/></p> -->
	
</body>
</html>