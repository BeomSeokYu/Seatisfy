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
<title>Qna 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>


<form action="./update?qno=${qna.qno}" class="form-horizontal"
	  method="post">
		<fieldset>

			<div class="form-group">
				<label for="qtitle">제목</label>
				<input name="qtitle" value="${qna.qtitle }"
					class="form-control" >

			</div>

			<div class="form-group">
				<label for="qcontent">내용</label>
				<textarea name="qcontent" id="summernote"
					class="form-control" rows="10" >
				${qna.qcontent}
				</textarea>
			</div>

			<div class="row">
				<div class="col-12">
					<a href="/qnas/list" class="btn btn-secondary">취소</a> <input type="submit"
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