<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>  
	
<!DOCTYPE html>		
<html>
<%@include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
.text-of {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.text-table th,
.text-table td{
	font-size: 90%;
}
</style>
<body>
<%@include file="../include/navbar.jsp"%>
<div class="container">
	<div class="container mt-5">
		<div class="row justify-content-center">
			<h2 class="mb-5">QnA 보기</h2>
			<div class="col-lg-3 d-none d-lg-block">
				<%@ include file="../include/sidebar_support.jsp"%>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-12 text-end mb-2">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<form class="form-inline" method="POST" action="/qnas/delete?qno=${qna.qno}">
							<input type="hidden" name="_csrf" value="${_csrf.token}"/>
							<a class="btn btn-outline-warning btn-sm mx-1" href="/qnas/update?qno=${qna.qno}" >수정</a>
							<button class="btn btn-outline-danger btn-sm mx-1">삭제</button>
						</form>
						</sec:authorize>
					</div>
				</div>
				<table class="table text-nowrap text-table table-rounded shadow-sm">
					<tr class="row">
						<th class="col-sm-1 text-center table-primary text-of">제목</th>
						<td class="col-sm-4 text-of table-light">${qna.qtitle}</td>
						<th class="col-sm-1 text-center table-primary text-of">작성자</th>
						<td class="col-sm-2 text-of table-light">관리자</td>
						<th class="col-sm-1 text-center table-primary text-of">등록일</th>
						<td class="col-sm-3 text-of table-light">${qna.qdate}</td>
					</tr>
				</table>

				<div class="py-3 px-5">
					<div class="text-lg" style="min-height: 300px;">
						<p class="text-lg" style="width: 100%;">${qna.qcontent}</p>
						<!-- <p id="ncontent"></p> -->
					</div>
				</div>
				<div class="col-lg-12 text-end mt-5">
					<a class="btn btn-outline-secondary btn-sm mx-3" href="/qnas">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
					

	
<%@include file="../include/footer.jsp"%>
<script>
function checkForm() {
	  // 폼 유효성 검사를 수행
	  if (bindingResult.hasErrors()) {
	    alert("폼을 제출할 수 없습니다.");
	    return false;
	  }

	  // 폼 유효성 검사를 통과하면 true 반환
	  return true;
	}
</script>
</head>
</html>