<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="message.addmoney.title" /></title>
</head>
<body>

	
		<form action="<c:url value="/custommercontroller/doaddmoney"/>">
			<h2><spring:message code="message.addmoney.message" /></h2>
			<input type="number" name="credit" min="-${activelogin.client.soldecompte}" max=200	> 
			<input type="submit">
		</form>
	

</body>
</html>