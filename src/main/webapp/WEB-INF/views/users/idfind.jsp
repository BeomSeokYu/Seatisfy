<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>

	<h1>아이디 찾기</h1>
	<form:form modelAttribute="user" 
			   action="./findid?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method="post">
	<fieldset>
		이름 : <form:input path="name" class="form-control"/>
		<br>
		휴대폰 : <form:input path="phone" class="form-control"/>
		<form:errors path="*" cssClass=""/>
		<br>
		<input type="submit" class="btn btn-primary" value="아이디 찾기" />
		
		<h4 style="color :red">${error }</h4>
		<h4>${idFound }</h4>
	
	</fieldset>
	</form:form>



</body>
</html>