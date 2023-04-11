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

 <form:form modelAttribute="ppp" 
			   action="./add?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post"
	           onsubmit="return checkForm();">
	<fieldset>
              <div class="form-group">
                <label for="qtitle">작성자</label>
                <form:input path="pwriter" name="pwriter" class="form-control" />
              </div>
              
              <div class="form-group">
                <label for="ptitle">제목</label>
                <form:textarea path="ptitle" name="ptitle" class="form-control" rows="10"/>
              </div>
              <div class="form-group">
                <label for="pcontent">내용</label>
                <form:textarea path="pcontent" name="pcontent" class="form-control" rows="10"/>
              </div>
              <div class="form-group">
                <label for="location">위치</label>
                <form:textarea path="location" name="location" class="form-control" rows="10"/>
              </div>
              <div class="form-group">
                <label for="seatinfo">좌석배치도</label>
                <input type="checkbox" id="seatinfo" name="seatinfo" class="form-control" rows="10"/>
              </div>
               <div class="form-group">
                 	<label for="rdate_start">예약시작일</label>
  					<input type="date" id="rdate_start" name="rdate_start" class="form-control">
              </div>
              <div class="form-group">
                 	<label for="rdate_end">예약종료일</label>
  					<input type="date" id="rdate_end" name="rdate_end" class="form-control">
              </div>
             
        
 		<div class="row">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">취소</a>
          <input type="submit" value="등록" class="btn btn-success float-right">
        </div>
      </div>


	</fieldset>
	</form:form> 

    
</body>
</html>