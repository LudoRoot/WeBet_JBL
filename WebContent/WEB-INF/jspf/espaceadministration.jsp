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
 <title><spring:message code="message.admin.titre" /></title>
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
 
 <p>&nbsp;&nbsp;<a href="<c:url value="/logout"/>"><spring:message code="message.menu.connectionlogout" /></a></p>
 <br>
	<p>&nbsp;&nbsp;<a href="#Ajouter rencontre" ><spring:message code="message.admin.ajoutrencontre" /></a></p>
 </div>
    <div class="col-sm-4" style="background-color:lavender;">

<!-------------------------- Gestion des sports ------------------------->
	<h3><spring:message code="message.admin.gestionsport" /></h3>
	<h4><spring:message code="message.admin.listesport" /></h4>
	<!-- Affichage de  la liste des sports -->
	<table class="table table-striped">
		<c:forEach items="${liste_sport}" var="i">
		<tr>
			<td>${i.nomSport}</td>
			
			<!-- Bouton "modifier" uniquement si le sport n'est associé à aucune équipe -->
			<td><a href="<c:url value="/admincontroller/gotomodifiersport/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			<c:set var="equipee" value="false"></c:set>
			<c:forEach items="${liste_equipe}" var="j">
				<c:if test="${j.sport.id eq i.id}">
					<c:set var="equipee" value="true"></c:set>
				</c:if>
			</c:forEach>
			
			<!-- Bouton "supprimer" uniquement si le sport n'est associé à aucune équipe -->
			<td class="">
			<c:if test="${ equipee ne true }">
				<a href="<c:url value="/admincontroller/supprimersport/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>

	<!-- Ajout d'un nouveau sport -->
	<form method="POST"	action="<c:url value="/admincontroller/modifiersport"/>" modelAttribute="sport">
		
		<!-- Texte -->
		<c:if test="${empty sport.nomSport}">
			<h4><spring:message code="message.admin.ajoutsport" /></h4>
		</c:if>
		<c:if test="${not empty sport.nomSport}">
			<h4><spring:message code="message.admin.modifsport" /></h4>
		</c:if>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<form:hidden path="sport.id" />
		<form:input path="sport.nomSport" />
		<form:errors path="sport.nomSport" cssClass="errors" />
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

	<!-- Affichage des équipes -->
	
	<table class="table table-striped">
		<c:forEach items="${liste_equipe}" var="i">
		<tr>
			<td>${i.nom}</td>
			
			<td>${i.sport.nomSport}</td>
			
			<!-- Bouton "modifier" uniquement si l'équipe n'est associé à aucune rencontre -->
			<td><a href="<c:url value="/admincontroller/gotomodifierequipe/${i.id}" />"><spring:message code="message.bouton.modifier" /></a></td>
			<c:set var="rencontree" value="false"></c:set>
			<c:forEach items="${liste_rencontre}" var="j">
				<c:if test="${j.equipe1.id eq i.id}">
					<c:set var="rencontree" value="true"></c:set>
				</c:if>
				<c:if test="${j.equipe2.id eq i.id}">
					<c:set var="rencontree" value="true"></c:set>
				</c:if>
			</c:forEach>
			
			<!-- Bouton "supprimer" uniquement si l'équipe n'est associé à aucune rencontre -->
			<td>
				<c:if test="${ rencontree ne true }">
					<a href="<c:url value="/admincontroller/supprimerequipe/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<!-- Ajout/modif d'une équipe -->
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
		<form:errors path="equipe.nom" cssClass="errors" />
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
	
	<!-- Liste des rencontres -->
	<table class="table table-striped">
	 <thead>
      <tr>
        <th align=center><spring:message code="message.admin.text6" /></th>
        <th align=center><spring:message code="message.admin.text7" /></th>
        <th align=center><spring:message code="message.admin.text8" /></th>
        <th align=center><spring:message code="message.admin.text9" /></th>
        <th align=center><spring:message code="message.admin.text10" /></th>
        <th align=center><spring:message code="message.admin.text11" /></th>
        <th align=center><spring:message code="message.admin.text12" /></th>
        <th align=center><spring:message code="message.admin.text13" /></th>
        <th align=center><spring:message code="message.admin.text14" /></th>
        <th align=center><spring:message code="message.admin.text15" /></th>
        <th align=center><spring:message code="message.admin.text16" /></th>
        <th align=center><spring:message code="message.admin.text17" /></th>
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
			<td>${i.resultat1}</td>
			<td>${i.resultat2}</td>
			<c:set var="pariee" value="false"></c:set>
			<c:set var="nbpari" value="0"></c:set>
			<c:forEach items="${liste_pari}" var="j">
				<c:if test="${j.rencontre.id eq i.id}">
					<c:set var="nbpari" value="${nbpari+1}"></c:set>
					<c:set var="pariee" value="true"></c:set>
				</c:if>
			</c:forEach>
			<td><c:out value="${nbpari}"></c:out></td>
			<td>
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<c:if test="${((today.time lt i.date_debut.time) and (pariee eq false)) and (i.terminee eq false)}">
					<a href="<c:url value="/admincontroller/gotomodifierrencontre/${i.id}" />"><spring:message code="message.bouton.modifier" /></a>
				</c:if>
				<c:if test="${(today.time gt i.date_fin.time) and (i.terminee eq false)}">
					<a href="<c:url value="/admincontroller/gotomodifierrencontre/${i.id}" />"><spring:message code="message.bouton.clore" /></a>
				</c:if>
			</td>
			<td>
			<c:if test="${(pariee eq false) and (i.terminee eq false)}">
			<a href="<c:url value="/admincontroller/supprimerrencontre/${i.id}" />"><spring:message code="message.bouton.supprimer" /></a>
			</c:if>
		</tr>
		
		</c:forEach>
		</tbody>
	</table>
	<div id="Ajouter rencontre">
		<h4><spring:message code="message.admin.ajoutrencontre" /></h4>
	</div>
	<h4><spring:message code="message.admin.categrencontre" /></h4>
	
	<!-- Choix du sport de la rencontre à créer -->
	<c:forEach items="${liste_sport}" var="choix">
		<a href="<c:url value="/admincontroller/chargerequipeparsport/${choix.id}" />">${choix.nomSport}&nbsp;</a>
	</c:forEach>
	<br>
	<br>
	
	<!-- Ajout/Modif d'une rencontre -->
	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:if test="${(today.time lt rencontre.date_debut.time) or (empty rencontre.id)}">
	<form method="POST" action="<c:url value="/admincontroller/modifierrencontre"/>" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<c:if test="${empty equipe.nom}">
			<h4><spring:message code="message.admin.ajoutrencontre" /></h4>
		</c:if>
		<c:if test="${not empty equipe.nom}">
			<h4><spring:message code="message.admin.modifrencontre" /></h4>
		</c:if>		
		<spring:message code="message.admin.text2" />&nbsp;
		<form:hidden path="rencontre.equipe1.nom"/>
		<form:select path="rencontre.equipe1.id">
			<form:options items="${liste_equipe2}" itemValue="id" itemLabel="nom"/> 
		</form:select>
		<br>
		<form:hidden path="rencontre.id"/>
		<form:hidden path="rencontre.terminee"/>
		<br>
		<spring:message code="message.admin.text3" />&nbsp;
		<form:hidden path="rencontre.equipe2.nom"/>
		<form:select path="rencontre.equipe2.id">
			<form:options items="${liste_equipe2}" itemValue="id" itemLabel="nom"/> 
		</form:select>
		<br><br>
		<spring:message code="message.admin.text4" />&nbsp;		
		<form:label path="rencontre.date_debut"/>
		<form:input path="rencontre.date_debut" placeholder="dd/MM/yyyy HH:mm"/>
		&nbsp;
		<spring:message code="message.admin.text5" />&nbsp;
		<form:label path="rencontre.date_fin"/>
		<form:input path="rencontre.date_fin" placeholder="dd/MM/yyyy HH:mm" />
		<br><br>
		<form:label path="rencontre.cote1"><spring:message code="message.admin.text7" /></form:label>
		<form:input path="rencontre.cote1" />
		&nbsp;&nbsp;
		<form:label path="rencontre.cotenull"><spring:message code="message.admin.text8" /></form:label>
		<form:input path="rencontre.cotenull" />
		&nbsp;&nbsp;
		<form:label path="rencontre.cote2"><spring:message code="message.admin.text9" /></form:label>
		<form:input path="rencontre.cote2" />
		<br>
		<form:hidden path="rencontre.resultat1" />
		<form:hidden path="rencontre.resultat2" />
		<br>
		<br>
		<c:if test="${empty rencontre.id}">
			<input type="submit" value="<spring:message code="message.bouton.ajouter" />" />
		</c:if>
		<c:if test="${not empty rencontre.id}">
			<input type="submit" value="<spring:message code="message.bouton.modifier" />" />
		</c:if>
		
	</form>
	</c:if>
	<c:if test="${rencontre.date_fin.time lt today.time}">
	<form method="POST" action="<c:url value="/admincontroller/clorerencontre"/>" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<c:if test="${empty equipe.nom}">
			<h4><spring:message code="message.admin.ajoutrencontre" /></h4>
		</c:if>
		<c:if test="${not empty equipe.nom}">
			<h4><spring:message code="message.admin.modifrencontre" /></h4>
		</c:if>		
		<form:hidden path="rencontre.terminee"/>
		<form:hidden path="rencontre.equipe1.nom"/>
		<form:hidden path="rencontre.equipe1.id"/>
		<form:hidden path="rencontre.id"/>
		<form:hidden path="rencontre.equipe2.nom"/>
		<form:hidden path="rencontre.equipe2.id"/>
		<form:hidden path="rencontre.date_debut"/>
		<form:hidden path="rencontre.date_fin"/>
		<form:hidden path="rencontre.cote1" />
		<form:hidden path="rencontre.cotenull" />
		<form:hidden path="rencontre.cote2" />
		<form:label path="rencontre.resultat1" ><spring:message code="message.admin.text18" /> ${rencontre.equipe1.nom}</form:label>
		<form:input path="rencontre.resultat1" />
		<br>
		<form:label path="rencontre.resultat2" ><spring:message code="message.admin.text18" /> ${rencontre.equipe2.nom}</form:label>
		<form:input path="rencontre.resultat2" />
		<br>
		<br>
		<input type="submit" value="<spring:message code="message.bouton.clore" />" />
		</form>
	</c:if>

	<br>
	<p><a href="<c:url value="/logout"/>"><spring:message code="message.menu.connectionlogout" /></a></p>
</div>
</div>	
<br>


</body>
</html>

