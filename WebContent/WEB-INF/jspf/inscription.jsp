<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%-- <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet"> --%>
</head>
<body>
	<h2>
		<c:out value="${message}" />
	</h2>
	<sec:authorize access="!isAuthenticated()">
	<form method="POST"
		action="${pageContext.request.contextPath}/logincontroller/createlogin"
		modelAttribute="login">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<form:label path="login.client.civ">Civilité</form:label>
		<form:select path="login.client.civ.id">
			<form:options items="${listecivil}" itemValue="id"
				itemLabel="abbreviation" />
		</form:select>
		<form:hidden path="login.id"/>
		<br>
		<form:label path="login.nom">Nom*</form:label>
		<form:input path="login.nom" class="form-control" />
		<form:errors path="login.nom" cssClass="errors" />
		<br>
		<form:label path="login.prenom">Prenom*</form:label>
		<form:input path="login.prenom" class="form-control" />
		<form:errors path="login.prenom" cssClass="errors" />
		<br>
		<form:label path="login.email">Email*</form:label>
		<form:input path="login.email" class="form-control" />
		<form:errors path="login.email" cssClass="errors" />
		<br>
		<form:label path="login.client.datenaissance">Date de naissance (jj/mm/aaaa)*</form:label> 
		<form:input path="login.client.datenaissance" class="form-control" />
		<form:errors path="login.client.datenaissance" cssClass="errors" />
		<br>
		<input type="checkbox" name="majeur" value="true" onclick="">Je certifie avoir plus de 18 ans<br>
		<br>
		<!-- 		a supprimer après creation comptes admin -->
		<form:label path="login.role">Role*</form:label>
		<form:input type="login.role" path="login.role" />
		<form:errors path="login.role" cssClass="errors" />
		<br>
		<form:label path="login.mdp">Password*</form:label>
		<form:input type="password" path="login.mdp" />
		<form:errors path="password" cssClass="errors" />
		<br>
		<h3>Coordonnées:</h3>
		<form:label path="login.client.numerorue">Numero*</form:label>
		<form:input path="login.client.numerorue" class="form-control" />
		<form:errors path="login.client.numerorue" cssClass="errors" />
		<br>
		<form:label path="login.client.rue">Nom de la rue*</form:label>
		<form:input path="login.client.rue" class="form-control" />
		<form:errors path="login.client.rue" cssClass="errors" />
		<br>
		<form:label path="login.client.codepostal">Code postal*</form:label>
		<form:input path="login.client.codepostal" class="form-control" />
		<form:errors path="login.client.codepostal" cssClass="errors" />
		<br>
		<form:label path="login.client.ville">Ville*</form:label>
		<form:input path="login.client.ville" class="form-control" />
		<form:errors path="login.client.ville" cssClass="errors" />
		<br>
		<form:label path="login.client.mobile">Téléphone mobile*</form:label>
		<form:input path="login.client.mobile" class="form-control" />
		<form:errors path="login.client.mobile" cssClass="errors" />
		<br>
<%-- 		<form:label path="login.client.mysports">Choix de vos sports préférés:</form:label> --%>
<%-- 		<form:select path="login.client.mysports" multiple="true" size="3"> --%>
<%-- 			<form:options items="${listesport}" itemValue="id" itemLabel="nomSport" /> --%>
<%-- 		</form:select> --%>
<!-- 		<br> -->
		<h3>Infos compte:</h3>
		<br>
		<form:label path="login.client.montantmax">Choisir un montant maximum pour un même pari* </form:label>
		<form:input path="login.client.montantmax" class="form-control" />
		<form:errors path="login.client.montantmax" cssClass="errors" />  euros
		<br>
		<blink>Pour vous remercier de votre inscription, WeBet vous offre la somme de 100 euros pour démarrer sur le site!</blink>
		<br>
		<input type="submit" value="Valider" />
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	</form>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
	<form method="POST"
		action="${pageContext.request.contextPath}/logincontroller/modiflogin"
		modelAttribute="login">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<form:label path="login.client.civ">Civilité</form:label>
		<form:select path="login.client.civ.id">
			<form:options items="${listecivil}" itemValue="id"
				itemLabel="abbreviation" />
		</form:select>
		<br>
		<form:label path="login.nom">Nom*</form:label>
		<form:input path="login.nom" class="form-control" />
		<form:errors path="login.nom" cssClass="errors" />
		<br>
		<form:label path="login.prenom">Prenom*</form:label>
		<form:input path="login.prenom" class="form-control" />
		<form:errors path="login.prenom" cssClass="errors" />
		<br>
		<form:label path="login.email">Email*</form:label>
		<form:input path="login.email" class="form-control" />
		<form:errors path="login.email" cssClass="errors" />
		<br>
		<form:label path="login.client.datenaissance">Date de naissance (jj/mm/aaaa)*</form:label> 
		<form:input path="login.client.datenaissance" class="form-control" />
		<form:errors path="login.client.datenaissance" cssClass="errors" />
		<br>
		<input type="checkbox" name="majeur" value="true" onclick="">Je certifie avoir plus de 18 ans<br>
		<br>
		<!-- 		a supprimer après creation comptes admin -->
		<form:label path="login.role">Role*</form:label>
		<form:input type="login.role" path="login.role" />
		<form:errors path="login.role" cssClass="errors" />
		<br>
		<form:label path="login.mdp">Password*</form:label>
		<form:input type="password" path="login.mdp" />
		<form:errors path="password" cssClass="errors" />
		<br>
		<h3>Coordonnées:</h3>
		<form:label path="login.client.numerorue">Numero*</form:label>
		<form:input path="login.client.numerorue" class="form-control" />
		<form:errors path="login.client.numerorue" cssClass="errors" />
		<br>
		<form:label path="login.client.rue">Nom de la rue*</form:label>
		<form:input path="login.client.rue" class="form-control" />
		<form:errors path="login.client.rue" cssClass="errors" />
		<br>
		<form:label path="login.client.codepostal">Code postal*</form:label>
		<form:input path="login.client.codepostal" class="form-control" />
		<form:errors path="login.client.codepostal" cssClass="errors" />
		<br>
		<form:label path="login.client.ville">Ville*</form:label>
		<form:input path="login.client.ville" class="form-control" />
		<form:errors path="login.client.ville" cssClass="errors" />
		<br>
		<form:label path="login.client.mobile">Téléphone mobile*</form:label>
		<form:input path="login.client.mobile" class="form-control" />
		<form:errors path="login.client.mobile" cssClass="errors" />
		<br>
<%-- 		<form:label path="login.client.mysports">Choix de vos sports préférés:</form:label> --%>
<%-- 		<form:select path="login.client.mysports" multiple="true" size="3"> --%>
<%-- 			<form:options items="${listesport}" itemValue="id" itemLabel="nomSport" /> --%>
<%-- 		</form:select> --%>
<!-- 		<br> -->
		<h3>Infos compte:</h3>
		<br>
		<form:label path="login.client.montantmax">Choisir un montant maximum pour un même pari* </form:label>
		<form:input path="login.client.montantmax" class="form-control" />
		<form:errors path="login.client.montantmax" cssClass="errors" />  euros
		<br>
		<blink>Pour vous remercier de votre inscription, WeBet vous offre la somme de 100 euros pour démarrer sur le site!</blink>
		<br>
		<input type="submit" value="Valider" />
		</form>
		</sec:authorize>
</body>
</html>