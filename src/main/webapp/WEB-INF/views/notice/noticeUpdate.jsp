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
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
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
	</form:form> --%>

<form action="./update?nno=${notice.nno}" class="form-horizontal"
	  method="post">
	   <input type="hidden" name="_csrf" value="${_csrf.token}"/>
		<fieldset>

			<div class="form-group">
				<label for="ntitle">제목</label>
				<input name="ntitle" value="${notice.ntitle }"
					class="form-control" >

			</div>

			<div class="form-group">
				<label for="ncontent">내용</label>
				<textarea name="ncontent" id="summernote"
					class="form-control" rows="10" >
				${notice.ncontent}
				</textarea>
			</div>

			<div class="form-group">
				<label for="nwriter">작성자</label>
				<input name="nwriter" value="${notice.nwriter }"
					class="form-control" readonly="true" />

			</div>

			<div class="row">
				<div class="col-12">
					<a href="#" class="btn btn-secondary">취소</a> <input type="submit"
						value="수정" class="btn btn-success float-right">
				</div>
			</div>


		</fieldset>
	</form>



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