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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
function replyNewFunction() {
	var nno = document.getElementById('nno').value;
	var rwriter = document.getElementById('rwriter').value;
	var rcontent = document.getElementById('rcontent').value;
	
	$.ajax({
		type:"POST",
		url:"/notice/addReply",
		data:{
			nno : nno,
			rwriter :rwriter,
			rcontent : rcontent
		},
		/* beforeSend : function(xhr)
	          {   데이터를 전송하기 전에 헤더에 csrf값을 설정한다 */
	        /*     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         }, */
		success:function(result) {
			alert('등록 성공');
			window.location.reload();
		},
		error:function(request, status, error) {
			alert(request.status + " " +request.responseText);
		}
	});
	 
}

function deleteReply(rno) {
  $.ajax({
    type: "POST",
    url: "/notice/removeReply",
    data: { rno: rno },
    success: function (result) {
      alert("삭제 성공");
      // 삭제가 성공하면 댓글 목록을 갱신한다.
      location.reload();
    },
    error: function (request, status, error) {
      alert(request.status + " " + request.responseText);
    },
  });
}
	
	

</script>
</head>
<body>

	 <div class="card">
		<h5 class="card-header">제목 : ${notice.ntitle}</h5>
		<div class="card-body">
			<h5 class="card-title">내용 : ${notice.ncontent}</h5>
			
 
			<div class="d-flex justify-content-end badge bg-light text-dark">작성일자 : ${notice.regDate}</div>
		</div>
	</div>
	
	<form action="/notice/list">
		<input type="submit" value="목록으로" />
	</form>
	<a href="/notice/update?nno=${notice.nno}">수정</a>
	<form method="POST" action="/notice/remove?nno=${notice.nno }">
		<input type="submit" value="삭제" />
	</form>

 <!-- 댓글 시작 -->
<hr>
<div class="card">
  <div class="card-body">댓글 리스트</div>
  <b>${cnt }개의 답변이 있습니다.</b>
  <c:forEach items="${replyList}" var="reply">
    <div class="card">
      <div class="card-header">작성자 : <b>${reply.rwriter}</b></div>
      <div class="card-body">
        <blockquote class="blockquote mb-0">
          <p>${reply.rcontent}</p>
          <div class="d-flex justify-content-end">
            <footer class="blockquote-footer">${reply.regDate}</footer>
            <button type="button" class="btn btn-warning" onclick="editReply(${reply.rno}, '${reply.rcontent}')">수정</button>
            <button class="btn btn-danger" onclick="deleteReply(${reply.rno})">삭제</button>
          </div>
        </blockquote>
      </div>
    </div>
    <br>
  </c:forEach>
</div>
						
					<hr> 
 <div>
 댓글 등록
	<div class="card text-center">
  <div class="card-header">
		<p>
			<label>댓글 작성자</label> <input type="text" id="rwriter" name="rwriter">
		</p>
		</div>
		<div class="card-body">
    <h5 class="card-title">답변 등록</h5>
    <p class="card-text">
			<textarea rows="5" cols="50" id="rcontent" name="rcontent"></textarea>
		</p>
		<p>
			<input type="hidden" name="nno" id="nno" value="${notice.nno }">
			<!-- <button type="submit">댓글 작성</button> -->
			<button class="btn btn-primary" onclick="replyNewFunction()">답변등록</button>
		</p>
		</div>
		</div>
	
</div>   



<!-- 댓글 끝  -->

 	













<script src="/resources/js/reply.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>