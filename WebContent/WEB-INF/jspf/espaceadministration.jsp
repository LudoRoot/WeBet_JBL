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
 <title>Espace Administration</title>
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
<!--   <p>texte à modifier</p>  -->
</div>

 <div class="row">
 <div class="col-sm-1" style=text-align: "center";">
 
 <p>&nbsp;&nbsp;<a href="<c:url value="/logout"/>">Déconnexion</a></p>
 <br>
	<p>&nbsp;&nbsp;<a href="#Ajouter rencontre" >Ajouter rencontre</a></p>
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
	
	 </div>
    <div class="col-sm-6" style="background-color:lavender;">
	
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
	

	</div>
	</div>
	<div class="row">
	 <div class="col-sm-1" style=text-align: "center";">
 </div>
	<div class="col-sm-8" style=text-align: "center";">
<!-------------------------- Gestion des rencontres ------------------------->
	<h3><spring:message code="message.admin.gestionrencontre" /></h3>
	<h4><spring:message code="message.admin.listerencontre" /></h4>
	
	<table class="table table-striped">
	 <thead>
      <tr>
        <th align=center>Equipe 1</th>
        <th align=center>Cote 1</th>
        <th align=center>Cote nul</th>
        <th align=center>Cote 2</th>
        <th align=center>Equipe 2</th>
        <th align=center>Date début</th>
        <th align=center>Date fin</th>
<!--         <th>Resultat 1</th> -->
<!--         <th>Resultat 2</th> -->
      </tr>
    </thead>
    <tbody>
		<c:forEach items="${liste_rencontre}" var="i">
		
    
		<tr>
			<td width="210" align=center>${i.equipe1.nom}</td>
			<td width="210" align=center>${i.cote1}</td>
			<td width="210" align=center>${i.cotenull}</td>			
			<td width="210" align=center>${i.cote2}</td>
			<td width="210" align=center>${i.equipe2.nom}</td>
			<td width="210" align=center>${i.date_debut}</td>
			<td width="210" align=center>${i.date_fin}</td>
<%-- 			<td>${i.resultat1}</td> --%>
<%-- 			<td>${i.resultat2}</td> --%>
			<td><a href="<c:url value="/admincontroller/gotomodifierrencontre/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			<td><a href="<c:url value="/admincontroller/supprimerrencontre/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a></td>
		</tr>
		
		</c:forEach>
		</tbody>
	</table>
	<div id="Ajouter rencontre">
	<h4><spring:message code="message.admin.ajoutrencontre" /></h4>
	</div>
	<h5><spring:message code="message.admin.categrencontre" /></h5>
	
	<c:forEach items="${liste_sport}" var="choix">
		<a href="<c:url value="/admincontroller/chargerequipeparsport/${choix.id}" />">${choix.nomSport}&nbsp;</a>
	</c:forEach>
	<br>
	<br>
	<form method="POST" action="<c:url value="/admincontroller/modifierrencontre"/>" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<c:if test="${empty equipe.nom}">
<%-- 			<h4><spring:message code="message.admin.ajoutrencontre" /></h4> --%>
		</c:if>
		<c:if test="${not empty equipe.nom}">
			<h4><spring:message code="message.admin.modifrencontre" /></h4>
		</c:if>		
		<spring:message code="message.admin.text2" />&nbsp;
		<form:select path="rencontre.equipe1.id">
			<form:options items="${liste_equipe2}" itemValue="id" itemLabel="nom"/> 
		</form:select>
		<br>
		<form:hidden path="rencontre.id"/>
		<br>
		<spring:message code="message.admin.text3" />&nbsp;
		<form:select path="rencontre.equipe2.id">
			<form:options items="${liste_equipe2}" itemValue="id" itemLabel="nom"/> 
		</form:select>
		<br><br>
		<spring:message code="message.admin.text4" />&nbsp;		
		<form:label path="rencontre.date_debut"/>
		<form:input path="rencontre.date_debut" placeholder="jj/mm/aaaa" />
		&nbsp;
		<spring:message code="message.admin.text5" />&nbsp;
		<form:label path="rencontre.date_fin"/>
		<form:input path="rencontre.date_fin" placeholder="jj/mm/aaaa" />
		<br><br>
		<form:label path="rencontre.cote1">Cote1</form:label>
		<form:input path="rencontre.cote1" />
		&nbsp;&nbsp;
		<form:label path="rencontre.cotenull">Cote nul</form:label>
		<form:input path="rencontre.cotenull" />
		&nbsp;&nbsp;
		<form:label path="rencontre.cote2">Cote2</form:label>
		<form:input path="rencontre.cote2" />
		<br>
		<br>
		<c:if test="${empty rencontre.id}">
			<input type="submit" value="<spring:message code="message.bouton.ajouter" />" />
		</c:if>
		<c:if test="${not empty rencontre.id}">
			<input type="submit" value="<spring:message code="message.bouton.modifier" />" />
		</c:if>
	</form>
	<br>
	<p><a href="<c:url value="/logout"/>">Déconnexion</a></p>
</div>
</div>	
<br>
		<%-- <p><a href="<c:url value="/admincontroller/gomodifdataperso"/>">Mofifier données personnelles</a></p> --%>
		
	
	

	 
</body>
</html>

