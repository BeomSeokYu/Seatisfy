<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<table class="table text-nowrap text-table table-rounded shadow-sm">
					<tr class="row">
						<th class="col-sm-3 text-center table-primary text-of">이메일</th>
						<td class="col-sm-9 text-of table-light">${user.username}</td>
					</tr>
					<tr class="row">
						<th class="col-sm-3 text-center table-primary text-of">이름</th>
						<td class="col-sm-9 text-of table-light">${user.name}</td>
					</tr>
					<tr class="row">
						<th class="col-sm-3 text-center table-primary text-of">전화번호</th>
						<td class="col-sm-9 text-of table-light">${user.phone}</td>
					</tr>
					<tr class="row">
						<th class="col-sm-3 text-center table-primary text-of">가입일</th>
						<td class="col-sm-9 text-of table-light">${user.udate}</td>
					</tr>
				</table>
				<hr class="my-4">
				
				<div class="col-lg-12 text-end mt-5">
					<a href="<c:url value="/user/edit"/>"
						class="btn btn-outline-primary btn-sm">내정보수정</a>
					<a href="<c:url value="/user/changepw"/>"
						class="btn btn-outline-success btn-sm">비밀번호 변경</a>
					<button onclick="javascript:removeConfirm('${user.uno}')"
						class="btn btn-outline-danger btn-sm" id="signoutBtn">회원탈퇴</button> 
				</div>
			</div>
				
				
				
				
		</div>
	</div>
</div>



<script>
	var msg = '${param.pwChanged}';
	if(msg) {
		console.log(msg);
		alert(msg);
	}
	
	function removeConfirm(uno) {
	    if (confirm("정말로 회원탈퇴하시겠습니까?")) {
	        removeUser(uno);
	    }
	}

	function removeUser(uno) {
		$.ajax({
			type : "POST",
			url : "/user/signout",
			data : {
				uno : uno
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("회원탈퇴가 완료되었습니다.");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		})

	}

</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>