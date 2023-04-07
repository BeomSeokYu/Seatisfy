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
<title>공지사항 상세보기</title>
</head>
<body>

	<div class="card">
		<h5 class="card-header">제목 : ${notice.ntitle}</h5>
		<div class="card-body">
			<h5 class="card-title">내용 : ${notice.ncontent}</h5>
			

			<div class="d-flex justify-content-end badge bg-light text-dark">작성일자 : ${notice.ndate}</div>
		</div>
	</div>
	
	<a href="/notice/update?nno=${notice.nno}">수정</a>
	<form method="POST" action="/notice/remove?nno=${notice.nno }">
		<input type="submit" value="삭제" />
	</form>




<!-- 댓글 시작 -->

<hr>

<ul>
	<!-- <li>
		<div>
			<p>첫번째 댓글 작성자</p>
			<p>첫번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>두번째 댓글 작성자</p>
			<p>두번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>세번째 댓글 작성자</p>
			<p>세번째 댓글</p>
		</div>
	</li> -->

		<c:forEach items="${replyList}" var="reply">
			<li>
				<div>
					<p>${reply.rwriter}/ ${reply.regDate}</p>
					<p>${reply.rcontent }</p>
						<a href="">수정</a>
						<form method="POST" action="/reply/remove?rno=${reply.rno }">
						<input type="submit" value="삭제" />
						</form> 
					<hr>


				</div>
			</li>
		</c:forEach>
	</ul>

<div>

	<form method="post" action="/reply/write">
	
		<p>
			<label>댓글 작성자</label> <input type="text" name="rwriter">
		</p>
		<p>
			<textarea rows="5" cols="50" name="rcontent"></textarea>
		</p>
		<p>
			<input type="hidden" name="nno" value="${notice.nno }">
			<button type="submit">댓글 작성</button>
		</p>
	</form>
	
</div>


<!-- 댓글 끝  -->















</body>
</html>