<!--작성자 : 권두현  -->
<!--작성일시 : 2023. 4. 5. 13:55  -->
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
<title>공지 등록</title>
<%@include file="../include/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<body>
<%@include file="../include/navbar.jsp"%>
<%-- <form:form modelAttribute="notice" 
			   action="./add?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>

              <div class="form-group">
                <label for="ntitle">제목</label>
                <form:input path="ntitle" name="ntitle" class="form-control"/>
                <form:errors path="ntitle"/>
              </div>
              
              <div class="form-group">
                <label for="ncontent">내용</label>
                <form:textarea path="ncontent" name="ncontent" id="summernote" class="form-control" rows="10"/>
              </div>
              
              <div class="form-group">
                <label for="nwriter">작성자</label>
                <form:input path="nwriter" name="nwriter" value="admin" class="form-control"/>
                
              </div>
                
 		<div class="row">
        <div class="col-12">
          <button type="button" class="btn btn-warning" onclick="history.back()">뒤로가기</button>
          <input type="submit" value="등록" class="btn btn-success float-right">
        </div>
      </div>


	</fieldset>
	</form:form> --%>
<form action="./add?${_csrf.parameterName}=${_csrf.token}" method="post" role="form">
<div class="mb-3">
  <label for="ntitle" class="form-label">제목</label>
  <input type="text" class="form-control" id="ntitle" name="ntitle">
</div>
<div class="mb-3">
  <label for="ncontent" class="form-label">내용</label>
  <textarea class="form-control" id="summernote" name="ncontent" rows="5"></textarea>
</div>
<!-- <div class="mb-3">
  <label for="nwriter" class="form-label">작성자</label>
  <input type="text" class="form-control" id="nwriter" name="nwriter" value="admin">
</div> -->
<input type="hidden" name="nwriter" value="${user.name}">
<button type="button" class="btn btn-warning " onclick="history.back()">뒤로가기</button>
<button type="submit" class="btn btn-info ">등록</button>
</form>




<%@include file="../include/footer.jsp"%>
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