<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../include/header.jsp" %>
<body class="text-center">
<%@include file="../include/navbar.jsp" %>

<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">비밀번호 찾기</h1>
							
							<p class="error-msg">${error }</p>
							<form action="/user/pwedit.jsp" method="post" id="findFrm">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">회원 이메일 확인</label>
									<input type="email" id="email" class="form-control" name="username" placeholder="Email" autofocus>
									
								</div>
								<div class="mb-3">
									<button type="submit" class="btn btn-primary ms-auto" id="appSendBtn" type="button">
										임시비밀번호 발급받기
									</button>
								</div>
							  	<input type="hidden" id="check" name="check" value="">
							  	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> 
								
							  </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    
<script>
$('#appSendBtn').on('click', function(){
	email = $('#email').val()
	if (email == '') {
		alert('입력 오류 : 이메일(ID)을 입력해 주세요'); 
	} else {
		if (confirm("해당 이메일로 임시비밀번호를 발급하시겠습니까?")){
		
		fetch('/pwfind', {
			headers: {
		    '${_csrf.headerName}': '${_csrf.token}' // CSRF 토큰 값
			},
			method: "post",
			body: new URLSearchParams({
					username: $('#email').val(),
					type: 'send'
				})
	        })
			.then(resp => resp.text())
			.then(data => {
				console.log(data);
				data = data.trim()
				if (data == 'success') {
					alert('임시 비밀번호가 발급되었습니다. 발송된 이메일 확인 후 로그인해주세요.');
					window.location.href = "/login"
				} else if (data == 'fail') {
					alert('오류가 생겼습니다.');
				}
			})
		}
	}
});

</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>