<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> 
		
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
	
	
<!DOCTYPE html>	
<html>
<%@include file="../include/header.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
<div class="col-lg-8 mx-auto p-4 py-md-5">
<form action="./update?qno=${qna.qno}" class="form-horizontal" method="post">
		
		<fieldset>
		<div class="container">
	<div class="container mt-5">
		<div class="row justify-content-center">
				<div class="postRegister_postContentWrapper__3BXZ6">
						<h2 class="mb-5">Q & A 수정</h2>
				</div>
<div class="col-lg-3 d-none d-lg-block">
	<%@ include file="../include/sidebar_support.jsp"%>
			</div>
			<div class="col-lg-9">
			<div class="pb-3 mb-5">
				<div class="mb-3">
						<label for="qtitle" class="form-label">제목</label>
				<input name="qtitle" value="${qna.qtitle }"
					class="form-control rounded" >
			
			</div>

			<div class="mb-3">
						<label for="qcontent" class="form-label">내용</label>
				<textarea name="qcontent" id="summernote"
					class="form-control" rows="10" >${qna.qcontent}
				</textarea>
			</div>

			<div class="row">
				<div class="col-12 text-end mb-2">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/qnas/select?qno=${qna.qno}" class="btn btn-outline-danger btn-sm mx-1">취소</a> 
					<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					<input type="submit"
						value="수정" class="btn btn-outline-warning btn-sm mx-1">
					</sec:authorize>
				</div>
			</div>
	</div>
</div>
		</fieldset>
	</form>
</div>
</div>
<%@include file="../include/footer.jsp"%>
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