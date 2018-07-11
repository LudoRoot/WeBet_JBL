<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="message.inscription.titre" /></title>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
</head>
<body>

  	<h2>
		<c:out value="${message}" />
	</h2>
	<div class="container">
	
	<sec:authorize access="!isAuthenticated()">
	<form method="POST"
		action="${pageContext.request.contextPath}/logincontroller/createlogin"
		modelAttribute="login">
	<div class="row">
    <div class="col-sm-4" style="background-color:lavender; height: 550px">
    <h3>Vous:</h3>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<form:label path="login.client.civ.id"><spring:message code="message.inscription.text1" /></form:label>
		<form:select path="login.client.civ.id">
			<form:options items="${listecivil}" itemValue="id"
				itemLabel="abbreviation" />
		</form:select>
		<form:hidden path="login.id"/>
		<br>
		<form:label path="login.nom"><spring:message code="message.inscription.text2" />*</form:label>
		<form:input path="login.nom" class="form-control" />
		<form:errors path="login.nom" cssClass="errors" />
		<br>
		<form:label path="login.prenom"><spring:message code="message.inscription.text3" />*</form:label>
		<form:input path="login.prenom" class="form-control" />
		<form:errors path="login.prenom" cssClass="errors" />
		<br>
		<form:label path="login.email"><spring:message code="message.inscription.text4" />*</form:label>
		<form:input path="login.email" class="form-control" />
		<form:errors path="login.email" cssClass="errors" />
		<br>
		<form:label path="login.client.datenaissance"><spring:message code="message.inscription.text5" />*</form:label> 
		<form:input path="login.client.datenaissance" class="form-control" placeholder="xx/xx/xxxx" />
		<form:errors path="login.client.datenaissance" cssClass="errors" />
		<br>
		
		<br>
		<!-- 		a supprimer après creation comptes admin -->
<%-- 		<form:label path="login.role">Role*</form:label>
		<form:input path="login.role" />
		<form:errors path="login.role" cssClass="errors" />
		<br> --%>
		<form:hidden path="login.role" />
		<br>
		<form:label path="login.mdp"><spring:message code="message.inscription.text6" />*</form:label>
		<form:password path="login.mdp" />
		<form:errors path="password" cssClass="errors" />
		<br>
		
 
 </div>
    <div class="col-sm-4" style="background-color:lavender; height: 550px">
				<h3>Vos coordonnées:</h3>
		<form:label path="login.client.numerorue"><spring:message code="message.inscription.text7" />*</form:label>
		<form:input path="login.client.numerorue" class="form-control" />
		<form:errors path="login.client.numerorue" cssClass="errors" />
		<br>
		<form:label path="login.client.rue"><spring:message code="message.inscription.text8" />*</form:label>
		<form:input path="login.client.rue" class="form-control" />
		<form:errors path="login.client.rue" cssClass="errors" />
		<br>
		<form:label path="login.client.codepostal"><spring:message code="message.inscription.text9" />*</form:label>
		<form:input path="login.client.codepostal" class="form-control" />
		<form:errors path="login.client.codepostal" cssClass="errors" />
		<br>
		<form:label path="login.client.ville"><spring:message code="message.inscription.text10" />*</form:label>
		<form:input path="login.client.ville" class="form-control" />
		<form:errors path="login.client.ville" cssClass="errors" />
		<br>
		<form:label path="login.client.mobile"><spring:message code="message.inscription.text11" />*</form:label>
		<form:input path="login.client.mobile" class="form-control" />
		<form:errors path="login.client.mobile" cssClass="errors" />
		<br>
<%-- 		<form:label path="login.client.mysports">Choix de vos sports préférés:</form:label> --%>
<%-- 		<form:select path="login.client.mysports" multiple="true" size="3"> --%>
<%-- 			<form:options items="${listesport}" itemValue="id" itemLabel="nomSport" /> --%>
<%-- 		</form:select> --%>
<!-- 		<br> -->
    </div>
    <div class="col-sm-4" style="background-color:lavender; height: 550px">
		<h3><spring:message code="message.inscription.text12" />:</h3>
		<br>
		<h5><FONT size="5pt" color="red"><spring:message code="message.inscription.text13" /></FONT></h5>
		<br>
		<form:label path="login.client.montantmax"><spring:message code="message.inscription.text14" />*</form:label>
		<form:input path="login.client.montantmax" class="form-control" />
		<form:errors path="login.client.montantmax" cssClass="errors" />
		<br>
		        <input type="submit" size="" value="Valider votre inscription"/>
		<br>
		<br>
		<p><a href="<c:url value="/logincontroller/gotomenu"/>"><spring:message code="message.inscription.text15" /></a></p>
		</div>
		
		
		</div>
	</form>

	</sec:authorize>
	
	
	<div class="container">
	<sec:authorize access="hasRole('ROLE_USER')">
		<form method="POST"
		action="${pageContext.request.contextPath}/logincontroller/modiflogin"
		modelAttribute="login">
		<div class="row">
    <div class="col-sm-4" style="background-color:lavender; height: 550px">
    <h3>Vous:</h3>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<form:label path="login.client.civ"><spring:message code="message.inscription.text1" /></form:label>
		<form:select path="login.client.civ.id">
			<form:options items="${listecivil}" itemValue="id"
				itemLabel="abbreviation" />
		</form:select>
		<form:hidden path="login.id"/>
		<form:hidden path="login.client.id"/>
		<form:hidden path="login.client.soldecompte"/>
		<br>
		<form:label path="login.nom"><spring:message code="message.inscription.text2" />*</form:label>
		<input type="text" value="${login.nom}" disabled="disabled" class="form-control" />
		<form:hidden path="login.nom" />
		<form:errors path="login.nom" cssClass="errors" />
		<br>
		<form:label path="login.prenom"><spring:message code="message.inscription.text3" />*</form:label>
		<input type="text" value="${login.prenom}" disabled="disabled" class="form-control" />
		<form:hidden path="login.prenom" />
		<form:errors path="login.prenom" cssClass="errors" />
		<br>
		<form:label path="login.email"><spring:message code="message.inscription.text4" />*</form:label>
		<input type="text" value="${login.email}" disabled="disabled" class="form-control" />
		<form:hidden path="login.email" />
		<form:errors path="login.email" cssClass="errors" />
		<br>
		<form:label path="login.client.datenaissance"><spring:message code="message.inscription.text5" />*</form:label> 
		<input type="text" value="${login.client.datenaissance}" disabled="disabled" class="form-control" />
		<form:hidden path="login.client.datenaissance" />
		<form:errors path="login.client.datenaissance" cssClass="errors" />
		<br>
<!-- 		<input type="checkbox" name="majeur" value="true" onclick="">Je certifie avoir plus de 18 ans<br> -->
		<br>
		<!-- 		a supprimer après creation comptes admin -->
<%-- 		<form:label path="login.role">Role*</form:label>
		<input type="text" value="${login.role}" disabled="disabled" class="form-control" />
		<form:hidden path="login.role" />
		<form:errors path="login.role" cssClass="errors" /> --%>
		<form:hidden path="login.role" />
		<br>
		<br>
		<form:label path="login.mdp"><spring:message code="message.inscription.text6" />*</form:label>
		<form:password path="login.mdp" />
		<form:errors path="password" cssClass="errors" />
		<br>
		</div>
    <div class="col-sm-4" style="background-color:lavender; height: 550px">
				<h3><spring:message code="message.inscription.text16" />:</h3>
		<form:label path="login.client.numerorue"><spring:message code="message.inscription.text7" />*</form:label>
		<form:input path="login.client.numerorue" class="form-control" />
		<form:errors path="login.client.numerorue" cssClass="errors" />
		<br>
		<form:label path="login.client.rue"><spring:message code="message.inscription.text8" />*</form:label>
		<form:input path="login.client.rue" class="form-control" />
		<form:errors path="login.client.rue" cssClass="errors" />
		<br>
		<form:label path="login.client.codepostal"><spring:message code="message.inscription.text9" />*</form:label>
		<form:input path="login.client.codepostal" class="form-control" />
		<form:errors path="login.client.codepostal" cssClass="errors" />
		<br>
		<form:label path="login.client.ville"><spring:message code="message.inscription.text10" />*</form:label>
		<form:input path="login.client.ville" class="form-control" />
		<form:errors path="login.client.ville" cssClass="errors" />
		<br>
		<form:label path="login.client.mobile"><spring:message code="message.inscription.text11" />*</form:label>
		<form:input path="login.client.mobile" class="form-control" />
		<form:errors path="login.client.mobile" cssClass="errors" />
		<br>
<%-- 		<form:label path="login.client.mysports">Choix de vos sports préférés:</form:label> --%>
<%-- 		<form:select path="login.client.mysports" multiple="true" size="3"> --%>
<%-- 			<form:options items="${listesport}" itemValue="id" itemLabel="nomSport" /> --%>
<%-- 		</form:select> --%>
<!-- 		<br> -->
		 </div>
    <div class="col-sm-4" style="background-color:lavender; height: 550px">
		<h3><spring:message code="message.inscription.text12" />:</h3>
		<br>
		<form:label path="login.client.montantmax"><spring:message code="message.inscription.text14" />* </form:label>
		<form:input path="login.client.montantmax" class="form-control" />
		<form:errors path="login.client.montantmax" cssClass="errors" />
		<br>
		
		<br>
		<input type="submit" value="Valider les modifications" />
		<br>
		<br>
		<p><a href="<c:url value="/logincontroller/dispatchbyrole"/>"><spring:message code="message.inscription.text15" /></a></p>
		<br>
		<p><a href="<c:url value="/logout"/>"><spring:message code="message.menu.connectionlogout" /></a></p>
		</div>
		
		
		</div>
		</form>
		</sec:authorize>
		</div>
</body>
</html>