<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
 <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title><spring:message code="message.admin.titre" /></title>
</head>
<body>
<div class="jumbotron text-center">
  <h2><spring:message code="message.admin.accueil" /></h2>
  <p>Resize this responsive page to see the effect!</p> 
</div>
<!-- <a href="#ancre"> Gestion des rencontres </a>	 -->
	
<!-- <table>
<tr>
<td class="centre" headers="gestion sport" style="width:700px; height:300px; text-align: center"> -->

 <div class="row">
 <div class="col-sm-1" style=text-align: "center";">
 </div>
    <div class="col-sm-4" style="background-color:lavender;">

<!-------------------------- Gestion des sports ------------------------->
	<h3><spring:message code="message.admin.gestionsport" /></h3>
	<h4><spring:message code="message.admin.listesport" /></h4>
	<table class="table table-striped">
		<c:forEach items="${liste_sport}" var="i">
		<tr>
			<td>${i.nomSport}</td>
			
			<td><a href="<c:url value="/admincontroller/gotomodifiersport/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			
			<td class=""><a href="<c:url value="/admincontroller/supprimersport/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a></td>
		</tr>
		</c:forEach>
	</table>
	<form method="POST"	action="<c:url value="/admincontroller/modifiersport"/>" modelAttribute="sport">
		<c:if test="${empty sport.nomSport}">
			<h4><spring:message code="message.admin.ajoutsport" /></h4>
		</c:if>
		<c:if test="${not empty sport.nomSport}">
			<h4><spring:message code="message.admin.modifsport" /></h4>
		</c:if>
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
	<br><br>
<!-------------------------- Gestion des équipes ------------------------->
	<h3><spring:message code="message.admin.gestionequipe" /></h3>
	<h4><spring:message code="message.admin.listeequipe" /></h4>
	
	<table class="table table-striped">
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
		<c:if test="${empty equipe.nom}">
			<h4><spring:message code="message.admin.ajoutequipe" /></h4>
		</c:if>
		<c:if test="${not empty equipe.nom}">
			<h4><spring:message code="message.admin.modifequipe" /></h4>
		</c:if>		
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
	
<!-- 	</td>
<td class="centre" headers="gestion rencontre" style="width:600px; height:300px; ; text-align: center"> -->
	</div>
	<div class="col-sm-6" style=text-align: "center";">
<!-------------------------- Gestion des rencontres ------------------------->
	<h3><spring:message code="message.admin.gestionrencontre" /></h3>
	<h4><spring:message code="message.admin.listerencontre" /></h4>
	
	<table class="table table-striped">
		<c:forEach items="${liste_rencontre}" var="i">
		<tr>
			<td>${i.equipe1.nom}</td>
			<td>${i.resultat1}</td>
			<td>${i.resultat2}</td>
			<td>${i.equipe2.nom}</td>
			<td>${i.date_debut}</td>
			<td>${i.date_fin}</td>
			<td><a href="<c:url value="/admincontroller/gotomodifierrencontre/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			<td><a href="<c:url value="/admincontroller/supprimerrencontre/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a></td>
		</tr>
		</c:forEach>
	</table>
	
	<h4><spring:message code="message.admin.categrencontre" /></h4>
	
	<c:forEach items="${liste_sport}" var="choix">
		<a href="<c:url value="/admincontroller/chargerequipeparsport/${choix.id}" />">${choix.nomSport}</a>
	</c:forEach>
	
	<br>
	<form method="POST" action="<c:url value="/admincontroller/modifierrencontre"/>" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<c:if test="${empty equipe.nom}">
			<h4><spring:message code="message.admin.ajoutrencontre" /></h4>
		</c:if>
		<c:if test="${not empty equipe.nom}">
			<h4><spring:message code="message.admin.modifrencontre" /></h4>
		</c:if>		
		<spring:message code="message.admin.text2" />
		<br>
		<form:select path="rencontre.equipe1.id">
			<form:options items="${liste_equipe2}" itemValue="id" itemLabel="nom"/> 
		</form:select>
		<form:hidden path="rencontre.id"/>
		<br>
		<spring:message code="message.admin.text3" />
		<br>
		<form:select path="rencontre.equipe2.id">
			<form:options items="${liste_equipe2}" itemValue="id" itemLabel="nom"/> 
		</form:select>
		<br>
		<spring:message code="message.admin.text4" />
		<br>
		<form:label path="rencontre.date_debut"/>
		<form:input path="rencontre.date_debut" placeholder="jj/mm/aaaa" />
		<br>
		<spring:message code="message.admin.text5" />
		<br>
		<form:label path="rencontre.date_fin"/>
		<form:input path="rencontre.date_fin" placeholder="jj/mm/aaaa" />
		<br>
		<form:label path="rencontre.cote">Cote</form:label>
		<form:input path="rencontre.cote" />
		<br>
		<form:label path="rencontre.resultat1">resultat1</form:label>
		<form:input path="rencontre.resultat1" />
		<br>
		<form:label path="rencontre.resultat2">resultat2</form:label>
		<form:input path="rencontre.resultat2" />
		<c:if test="${empty rencontre.id}">
			<input type="submit" value="<spring:message code="message.bouton.ajouter" />" />
		</c:if>
		<c:if test="${not empty rencontre.id}">
			<input type="submit" value="<spring:message code="message.bouton.modifier" />" />
		</c:if>
	</form>

<!-- </td>
	</tr>

</table> -->

</div>
</div>

	<!--    <sec:authorize access="hasRole('ROLE_USER')"> -->
		<p><a href="<c:url value="/admincontroller/gomodifdataperso"/>">Mofifier données personnelles</a></p>
		<p><a href="<c:url value="/custommercontroller/golistparis"/>">Consulter mes paris</a></p>
	<!-- 	</sec:authorize> -->
		<p><a href="<c:url value="/logout"/>">Log out</a></p>
	<!-- <p><sec:authentication property="principal.authorities"/></p> -->
	

	 
</body>
</html>

