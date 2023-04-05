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
	function removeUser(username) {
		$.ajax({
			type : "POST",
			url : "/users/remove",
			data : {
				username : username
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("고객 정보가 삭제되었습니다.")
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		})

		window.location.reload();
	}

	function updateAuth(username, e) {
		$.ajax({
			type : "POST",
			url : "/users/list",
			data : {
				username : username,
				authority : e.value
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("권한 정보 변경이 완료되었습니다.")
				window.location.assign('/users/list');
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		})

		/* window.location.reload(); */
		window.location.assign('/users/list');
	}
</script>
</head>
<body>

	<div class="container">
		<div class="container">
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>권한</th>
						<th>상태</th>
						<th>이름</th>
						<th>메일</th>
						<th>관리</th>
					</tr>
					<form:form name="removeForm" method="put">
						<c:forEach items="${userList}" var="user">
							<tr>
								<td>${user.uno}</td>
								<td>${user.username}</td>
								<td><select onchange="updateAuth('${user.username}', this)"
									class="form-select form-select-sm"
									aria-label=".form-select-sm example">
										<option selected>${user.authority}</option>
										<option value="ROLE_USER">ROLE_USER</option>
										<option value="ROLE_MANAGER">ROLE_MANAGER</option>
										<option value="ROLE_ADMIN">ROLE_ADMIN</option>
								</select></td>
								<td>${user.enabled}</td>
								<td>${user.uname}</td>
								<td>${user.uemail}</td>
								<td>
									<p>
										<a href="javascript:removeUser('${user.username}')"
											class="btn btn-danger btn-sm">삭제</a> <a
											href="<c:url value="/users/update?id=${user.username}"/>"
											class="btn btn-success btn-sm">수정</a>
								</td>
							</tr>
						</c:forEach>
					</form:form>
				</table>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>