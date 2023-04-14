<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html>
<%@include file="../include/header.jsp" %>
<body>
<%@include file="../include/navbar.jsp" %>
<header class="mt-5 mb-5 pt-5 pb-5" style="background-image: url('/resources/assets/img/portfolio/fullsize/1.jpg'); background-size: cover;">
	<div class="container">
		<h1 class="mt-5 mb-5 pt-5 pb-5 text-white"><span class="text-shadow">마이 페이지</span></h1>
	</div>
</header>
<div class="container mt-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-3 d-none d-lg-block">
				<%@ include file="../include/sidebar_user.jsp"%>
			</div>
			<div class="col-lg-9">
				<hr class="my-4">
				<form:form modelAttribute="user" 
						   action="/user/changepw"
				           class="form-horizontal"
				           method="post">
				<fieldset>
					<table class="table text-nowrap text-table table-rounded shadow-sm">
						<tr class="row">
							<th class="col-sm-3 text-center table-primary text-of">새 비밀번호</th>
							<td class="col-sm-9 text-of table-light">
								<form:input path="password" type="password" class="form-control"/>
								<form:errors path="password" />
							</td>
						</tr>
						<tr class="row">
							<th class="col-sm-3 text-center table-primary text-of">비밀번호 확인</th>
							<td class="col-sm-9 text-of table-light">
								<form:input path="passwordConfirm" type="password" class="form-control"/>
								<form:errors path="passwordConfirm" cssClass="error" />
							</td>
						</tr>
					</table>
					
					<hr class="my-4">
					<div class="col-lg-12 text-end mt-5">
						<input type="submit" class="btn btn-primary btn-sm" value="비밀번호 변경 " />
						<a onclick="javascript:history.back()"
							class="btn btn-outline-secondary btn-sm">취소</a>
					</div>
	
				</fieldset>
				</form:form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>	

</body>
</html>