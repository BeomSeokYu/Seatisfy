<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Car Detail</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

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

		window.location.reload();
	}

</script>
</head>
<body>

	<div class="container">
		<div class="container">
			<div style="padding-top: 50px">
			내 정보 보기
			<hr>
			이메일: ${user.username} <br>
			이름: ${user.name} <br>
			전화번호: ${user.phone} <br>
			가입일: ${user.udate } <br>
				
			<a href="javascript:removeUser('${user.uno}')"
				class="btn btn-danger btn-sm">회원탈퇴</a> 
			<a href="<c:url value="/user/edit"/>"
				class="btn btn-success btn-sm">내정보수정</a>
			<a href="<c:url value="/user/changepw"/>"
				class="btn btn-success btn-sm">비밀번호 변경</a>
				
			</div>
		</div>
	</div>
</body>
</html>