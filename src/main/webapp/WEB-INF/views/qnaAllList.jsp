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
<title>Qna 전체 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>

<div class="container">
<div class="container">
    <div style="padding-top: 50px">
        <table class="table table-hover">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>날짜</th>
								</tr>
								<c:forEach items="${qnaList}" var="qna">
									<tr>
										<td>${qna.qno}</td>
							<td><a href="/qna/detail?qno=${qna.qno}">${qna.qtitle}</a></td>
										<td>${qna.qcontent}</td>
										<td>${qna.qdate}</td>
									</tr>
								</c:forEach>
						</table>
						</div><hr></div></div>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
						
</body>
</html>