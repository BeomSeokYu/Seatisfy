<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%@include file="../include/header.jsp" %>
<body class="text-center">
<%@include file="../include/navbar.jsp" %>

<body>

<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">내 정보 보기</h1>
							
								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="mb-2 text-muted" for="email">이메일</label>
									</div>
									<input name="username" class="form-control" value="${user.username }" readonly/>
								</div>
	
								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="text-muted" for="name">이름</label>
									</div>
									<input name="name" class="form-control" placeholder="Name" value="${user.name }" readonly/>
								</div>
								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="mb-2 text-muted" for="phone">전화번호</label>
									</div>
									<input name="phone" class="form-control" placeholder="Phone" value="${user.phone }" readonly/>
								</div>
								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="mb-2 text-muted" for="udate">가입일</label>
									</div>
									<input name="udate" class="form-control" placeholder="Phone" value="${user.udate }" readonly/>
								</div>

								<div class="mb-3">
									<a href="javascript:removeUser('${user.uno}')"
										class="btn btn-danger btn-sm">회원탈퇴</a> 
									<a href="<c:url value="/user/edit"/>"
										class="btn btn-success btn-sm">내정보수정</a>
									<a href="<c:url value="/user/changepw"/>"
										class="btn btn-success btn-sm">비밀번호 변경</a>
								</div>
								
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<script>
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