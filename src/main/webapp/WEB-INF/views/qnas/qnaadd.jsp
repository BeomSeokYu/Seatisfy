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
<title>Qna 등록</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
 <form:form modelAttribute="eee" 
			   action="./add?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
              <div class="form-group">
                <label for="qtitle">제목</label>
                <form:input path="qtitle" name="qtitle" class="form-control"/>
                
              </div>
              
              <div class="form-group">
                <label for="qcontent">내용</label>
                <form:textarea path="qcontent" name="qcontent" id="summernote" class="form-control" rows="10"/>
              </div>
        
 		<div class="row">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">취소</a>
          <input type="submit" value="등록" class="btn btn-success float-right">
        </div>
      </div>


	</fieldset>
	</form:form> 

 <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
    
</body>
</html>