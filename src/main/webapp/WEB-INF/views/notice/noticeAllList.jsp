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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="notice">
									<tr>
										<td>${notice.nno}</td>
							<td><a href="/notice/detail?nno=${notice.nno}">${notice.ntitle}</a></td>
										<td>${notice.ncontent}</td>
										<td>${notice.nwriter}</td>
										<td>${notice.ndate}</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>분류</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
							</tfoot>
						</table>
						
</body>
</html>