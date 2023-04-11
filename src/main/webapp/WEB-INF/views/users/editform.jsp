<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>

	
	<form:form modelAttribute="user" 
			   action="./edit?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method="post">
	<fieldset>
		아이디 : <form:input path="username" value="${user.username }" class="form-control" readonly="${true }"/>
		<br>
		이름 : <form:input path="name" value="${user.name }" class="form-control"/>
		<form:errors path="name"/>
		<br>
		휴대폰 : <form:input path="phone" value="${user.phone}" class="form-control" />
		<form:errors path="phone"/>
		<br>
		가입일: <form:input path="udate" value="${user.udate }" class="form-control" readonly="${true}"/>
		<br>
		<input type="submit" class="btn btn-primary" value="수정" />
	
	</fieldset>
	</form:form>



</body>
</html>