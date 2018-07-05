<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%-- <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet"> --%>
</head>
<body>
<h2><c:out value="${message}" /></h2>
	<form method="POST" action="${pageContext.request.contextPath}/logincontroller/createlogin" modelAttribute="login">
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
		<br>
		<form:label path="login.nom">Nom*</form:label>
		<form:input path="login.nom" />
		<br>
		<form:label path="login.prenom">Prenom*</form:label>
		<form:input path="login.prenom"  class="form-control" /><form:errors path="login.prenom" cssClass="errors" />
		<br>
		<form:label path="login.email">Email*</form:label>
		<form:input path="login.email"  class="form-control" /><form:errors path="login.email" cssClass="errors" />
		<br>
		<form:label path="login.role">Role*</form:label>
		<form:input type="login.role" path="login.role" /><form:errors path="login.role" cssClass="errors" />
		<br>
		<form:label path="login.mdp">Password*</form:label>
		<form:input type="password" path="login.mdp" /><form:errors path="password" cssClass="errors" />
		<br>
		<h3>Adresse:</h3>
		<form:label path="login.client.numerorue">Numero</form:label>
		<form:input path="login.client.numerorue"  class="form-control" />
		<br>
		<form:label path="login.client.rue">Nom de la rue</form:label>
		<form:input path="login.client.rue"  class="form-control" />
		<br>		
		<form:label path="login.client.codepostal">Code postal*</form:label>
		<form:input path="login.client.codepostal"  class="form-control" /><form:errors path="login.client.codepostal" cssClass="errors" />
		<br>		
		<form:label path="login.client.ville">Ville*</form:label>
		<form:input path="login.client.ville"  class="form-control" /><form:errors path="login.client.ville" cssClass="errors" />
		<br>
		<input type="submit" value="Sauvegarde" />

	</form>
</body>
</html>