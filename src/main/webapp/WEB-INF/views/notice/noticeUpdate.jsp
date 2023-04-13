<!--작성자 : 권두현  -->
<!--작성일시 : 2023. 4. 5. 16:25  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
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

	 <%-- <form:form modelAttribute="updateNotice"
		action="./update?nno=${notice.nno}" class="form-horizontal"
		method="post">
		<fieldset>

			<div class="form-group">
				<label for="ntitle">제목</label>
				<form:input path="ntitle" name="ntitle" value="${notice.ntitle }"
					class="form-control" />

			</div>

			<div class="form-group">
				<label for="ncontent">내용</label>
				<form:textarea path="ncontent" name="ncontent" id="summernote"
					class="form-control" rows="10" />
				${notice.ncontent}
			</div>

			<div class="form-group">
				<label for="nwriter">작성자</label>
				<form:input path="nwriter" name="nwriter" value="${notice.nwriter }"
					class="form-control" readonly="true" />

			</div>

			<div class="row">
				<div class="col-12">
					<a href="#" class="btn btn-secondary">취소</a> <input type="submit"
						value="수정" class="btn btn-success float-right">
				</div>
			</div>


		</fieldset>
	</form:form>  --%>
<%@include file="../include/navbar.jsp"%>
<header class="mt-5 mb-5 pt-5 pb-5" style="background-image: url('/resources/assets/img/portfolio/fullsize/5.jpg'); background-size: cover;">
	<div class="container">
		<h1 class="mt-5 mb-5 pt-5 pb-5 text-white"><span class="text-shadow">공지사항 수정</span></h1>
	</div>
</header>

	<%-- <form action="./update?nno=${notice.nno}" class="form-horizontal"
		method="post">
		<input type="hidden" name="_csrf" value="${_csrf.token}" />
		<fieldset>
			<div class="container">
				<div class="container">
					<div class="row justify-content-center">
						<div class="postRegister_postContentWrapper__3BXZ6"></div>
						<div class="col-lg-3 d-none d-lg-block">
							<%@ include file="../include/sidebar_support.jsp"%>
						</div>
						<div class="col-lg-9">
							<div class="pb-3 mb-5">
								<div class="form-group">
									<label for="nwriter">작성자</label> <input name="nwriter"
										value="${notice.nwriter }" class="form-control" readonly />

								</div>

								<div class="mb-3">
									<label for="ntitle" class="form-label">제목</label> <input
										name="ntitle" value="${notice.ntitle }"
										class="form-control rounded">

								</div>

								<div class="mb-3">
									<label for="ncontent" class="form-label">내용</label>
									<textarea name="ncontent" id="summernote" class="form-control"
										rows="10">
				${notice.ncontent}
				</textarea>
								</div>



								<div class="row">
									<div class="col-lg-12 text-end mt-5">
										<a href="/notice/detail?nno=${notice.nno }"
											class="btn btn-outline-danger btn-sm mx-1">취소</a> <input
											type="hidden" name="_csrf" value="${_csrf.token}" /> <input
											type="submit" value="수정"
											class="btn btn-outline-warning btn-sm mx-1">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</form> --%>
<div class="container mt-5">
	<div class="container">
		<div class="row justify-content-center">
		<div class="col-lg-3 d-none d-lg-block">
				<%@ include file="../include/sidebar_support.jsp"%>
			</div>
<div class="col-lg-8 mx-auto p-4 py-md-5">
		<form:form modelAttribute="notice" action="./add" method="post">
			<fieldset>
			<main>
				<div class="pb-3 mb-5">
					<div class="postRegister_postContentWrapper__3BXZ6">
						<span class="postRegister_sequence__nC1Px">1</span>
						<h2 class="postRegister_text__17jg3">공지사항 수정</h2>
					</div>
					<div>

					<div class="mb-3">
						<label for="ntitle" class="form-label">제목</label> 
						<form:input type="text" class="form-control" path="ntitle" />
							<form:errors path="ntitle" cssStyle="color:red;"/>
					</div>
					<div class="mb-3">
						<label for="ncontent" class="form-label">내용</label>
						<form:textarea class="form-control" id="summernote" path="ncontent"	rows="5" />
						<form:errors path="ncontent" cssStyle="color:red;"/>
					</div>
					<form:input type="hidden" path="nwriter" value="${user.username}" />
				</div>
				<div style="text-align: right;">
							<!-- 토큰 전송 -->
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<a href="/notice/detail?nno=${notice.nno }"
											class="btn btn-outline-danger btn-sm mx-1">취소</a> <input
											type="hidden" name="_csrf" value="${_csrf.token}" /> <input
											type="submit" value="수정"
											class="btn btn-outline-warning btn-sm mx-1">
					</div>
				</div>
			</main>
			</fieldset>
		</form:form>
	</div>
</div></div></div>




	<script>
	$('#summernote').summernote(
			{
				placeholder : '내용을 입력하세요',
				tabsize : 2,
				height : 400,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>	
</body>
</html>