<%-- 

작성자 : 유범석
작성일 : 2023.02.16
버전 정보 : V1.0

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<style>
html,
body {
  height: 100%;
}

body {
  align-items: center;
  padding-bottom: 40px;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[data-type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[data-type="name"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
</style>
</head>
<body>
<div class="container">
	<div class="form-signin text-center">
	  <form action="/user/pwedit.jsp" method="post" id="findFrm">
	    <h1 class="h3 py-5 fw-normal">회원 이메일 확인</h1>
	    <div class="form-floating">
	      <input type="email" class="form-control" id="email" name="email" placeholder="이메일" data-type="email">
	      <label for="floatingInput">이메일</label>
	    </div>
	  	<input type="hidden" id="check" name="check" value="">
	  	<hr class="my-4">
        <button class="w-100 btn btn-secondary btn-md" id="appSendBtn" type="button">임시비밀번호 발급받기</button>
	  </form>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

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
</body>
</html>