<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<%@include file="../include/header.jsp"%>
<title>공지사항 상세보기</title>

<body>
<%@include file="../include/navbar.jsp"%>
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
 <div>

		<div class="post_reply">
			
			<textarea class="form-control col-sm-5" rows="5" id="rcontent" name="rcontent"></textarea>
			<div class="replyinsert_wrap">
				<input type="hidden" name="nno" id="nno" value="${notice.nno }">
				<button class="btn btn-primary" onclick="replyNewFunction()">답변등록</button>
			</div>
		</div>

	</div>   
 
 
<hr>
<div class="card">
  <b>${cnt }개의 답변이 있습니다.</b>
   <c:forEach items="${replyList}" var="reply">
   
    <div class="card">
      <div class="card-header">작성자 : <b>${reply.rwriter}</b></div>
      <div class="card-body">
        <blockquote class="blockquote mb-0">
          <p id="${reply.rno}">${reply.rcontent}</p>
          <div class="d-flex justify-content-end">
          
            <footer class="blockquote-footer" id="regDate${reply.rno }">${reply.regDate}</footer>
            
            <button type="button" class='btn btn-primary' style='display:none' id="replyUpdateBtn${reply.rno }" onclick="updateReply(${reply.rno})">완료</button>
            <button type="button" class='btn btn-secondary' style='display:none' id="cancelBtn${reply.rno }" onclick="cancel(${reply.rno})">취소</button>
            <button type="button" class="btn btn-warning" id="modifyReplyBtn${reply.rno }"  onclick="modifyReply(${reply.rno})">수정</button>
            <button type="button" class="btn btn-danger" id="deleteReplyBtn${reply.rno }" onclick="deleteReply(${reply.rno})">삭제</button>
          </div>
        </blockquote>
      </div>
    </div>
  </c:forEach> 
  </div>
  
						
					<hr> 
 



<!-- 댓글 끝  -->

 	




<%@include file="../include/footer.jsp"%>

<script>

var csrfToken = getCsrfToken();

function getCsrfToken(){
    return '${_csrf.token}';
}

function replyNewFunction() {
	var nno = document.getElementById('nno').value;
	/* var rwriter = document.getElementById('rwriter').value; */
	var rcontent = document.getElementById('rcontent').value;
	
	$.ajax({
		type:"POST",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
			'X-CSRF-TOKEN': csrfToken
		},
		url:"/notice/addReply",
		data:{
			nno : nno,
			csrfName: csrfToken,
			/* rwriter :rwriter, */
			rcontent : rcontent
		},
		/* beforeSend : function(xhr)
	          {   데이터를 전송하기 전에 헤더에 csrf값을 설정한다 */
	        /*     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         }, */
		success:function(result) {
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
    headers: {
		'Content-Type': 'application/x-www-form-urlencoded',
		'X-CSRF-TOKEN': csrfToken
	},
    url: "/notice/removeReply",
    data: { rno: rno, 
    	csrfName: csrfToken
    },
    success: function (result) {
      // 삭제가 성공하면 댓글 목록을 갱신한다.
      location.reload();
    },
    error: function (request, status, error) {
      alert(request.status + " " + request.responseText);
    },
  });
}

//수정 버튼을 누르면
function modifyReply(rno){
	
		  const replyContent = document.getElementById(rno).innerText; // 해당 댓글의 내용을 가져옴
		  const replyElement = document.getElementById(rno); // 해당 댓글의 p 요소
		  const textarea = document.createElement('textarea'); // 새로운 textarea 요소 생성
		  textarea.classList.add('form-control', 'col-sm-5');
		  textarea.id = rno; // textarea 요소의 id를 댓글의 id와 동일하게 설정
		  textarea.value = replyContent; // textarea 요소 내용을 해당 댓글 내용으로 설정
		  replyElement.replaceWith(textarea); // 해당 댓글의 p 요소를 textarea 요소로 교체 
		 

		  var modifyReplyBtn = document.getElementById("modifyReplyBtn" + rno);
		  var deleteReplyBtn = document.getElementById("deleteReplyBtn" + rno);
		  var replyUpdateBtn = document.getElementById("replyUpdateBtn" + rno);
		  var cancelBtn = document.getElementById("cancelBtn" + rno);
		  var regDate = document.getElementById("regDate" + rno);
		  
		  
		  // 수정, 삭제 버튼을 감추고 완료 버튼을 보이게 함
		  modifyReplyBtn.style.display = "none";
		  deleteReplyBtn.style.display = "none";
		  replyUpdateBtn.style.display = "inline";
		  cancelBtn.style.display = "inline";
		  regDate.style.display = "none";
		    
	}

//완료 버튼을 누르면
function updateReply(rno) {
	  // 댓글 수정 완료 후 처리 로직
	  // 수정된 댓글 내용 가져오기
  var modifiedContent = document.getElementById(rno).value;
  // AJAX 요청 보내기
  $.ajax({
    type: "POST",
    headers: {
		'Content-Type': 'application/x-www-form-urlencoded',
		'X-CSRF-TOKEN': csrfToken
	},
    url: "/notice/updateReply",
    data: {
      rno : rno,
      csrfName: csrfToken,
      rcontent: modifiedContent
    },
    success: function(result) {
      // 댓글 수정 성공 시, 수정한 내용을 화면에 업데이트
      var replyContent = document.getElementById(rno);
      replyContent.innerText = modifiedContent;

	  const replyElement = document.getElementById(rno); // 해당 댓글의 p 요소
	  const p = document.createElement('p'); // 새로운 textarea 요소 생성
	  p.id = rno; // textarea 요소의 id를 댓글의 id와 동일하게 설정
	  p.value = replyContent; // textarea 요소 내용을 해당 댓글 내용으로 설정
	  replyElement.replaceWith(p); // 해당 댓글의 p 요소를 textarea 요소로 교체 
      
      // 수정 완료 후, 수정, 삭제 버튼을 보이게 함
      var modifyReplyBtn = document.getElementById("modifyReplyBtn" + rno);
      var deleteReplyBtn = document.getElementById("deleteReplyBtn" + rno);
      var replyUpdateBtn = document.getElementById("replyUpdateBtn" + rno);
      var cancelBtn = document.getElementById("cancelBtn" + rno);
      
      modifyReplyBtn.style.display = "inline";
      deleteReplyBtn.style.display = "inline";
      replyUpdateBtn.style.display = "none";
      cancelBtn.style.display = "none";
      
      location.reload();
    },
    error: function(xhr, status, error) {
      // 에러 처리 로직
      console.error(error);
    }
  });

	  // 수정 완료 후, 수정 버튼과 삭제 버튼을 보이게 함
	 /*  var modifyReplyBtn = document.getElementById("modifyReplyBtn" + rno);
	  var deleteReplyBtn = document.getElementById("deleteReplyBtn" + rno);
	  var replyUpdateBtn = document.getElementById("replyUpdateBtn" + rno);
	  

	  modifyReplyBtn.style.display = "inline";
	  deleteReplyBtn.style.display = "inline";
	  replyUpdateBtn.style.display = "none"; */
	  
	}

function cancel(rno){
	  
	// 수정 취소 시, 댓글 내용 초기화
	  var originalContent = document.getElementById(rno).innerText;
	  document.getElementById(rno).value = originalContent;

	  // 수정 취소 후, 수정, 삭제 버튼을 보이게 함
	  var modifyReplyBtn = document.getElementById("modifyReplyBtn" + rno);
	  var deleteReplyBtn = document.getElementById("deleteReplyBtn" + rno);
	  var replyUpdateBtn = document.getElementById("replyUpdateBtn" + rno);
	  var cancelBtn = document.getElementById("cancelBtn" + rno);

	  modifyReplyBtn.style.display = "inline";
	  deleteReplyBtn.style.display = "inline";
	  replyUpdateBtn.style.display = "none";
	  cancelBtn.style.display = "none";
	  location.reload();
}



</script>






</body>
</html>