
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
<title>Qna 상세보기</title>
</head>
<body>

	<div class="card">
		<h5 class="card-header">제목 : ${qna.qtitle}</h5>
		<div class="card-body">
			<h5 class="card-title">내용 : ${qna.qcontent}</h5>
			<br> <br> <br>

			<div class="d-flex justify-content-end badge bg-light text-dark">작성일자 : ${qna.qdate}</div>
		</div>
	</div>
	
	<a href="/qnas/update?qno=${qna.qno}">수정</a>
	<form method="POST" action="/qnas/delete?qno=${qna.qno }">
		<input type="submit" value="삭제" />
	</form>
</body>
</html>