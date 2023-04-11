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
<%-- <div class="card">
		<div class="card-body">댓글 리스트</div>
		
		
		<b>${cnt }개의 답변이 있습니다.</b>
		<c:forEach items="${replyList}" var="reply">
		<div class="card">
				<div class="card-header">
					작성자 : <b>${reply.rwriter}</b>
					</div>
					<div class="card-body">
    <blockquote class="blockquote mb-0">
					<p id="updateReply">${reply.rcontent }</p>
					<div class="d-flex justify-content-end">
      <footer class="blockquote-footer">${reply.regDate}</footer>
      <button id="modBtn" type="button" class="btn btn-warning" data-dismiss="modal" onclick="editReply(${reply.rno}, '${reply.rcontent}')">수정</button>
						<form method="POST" action="/reply/remove">
						<input type="hidden" name="nno" value="${notice.nno }">
						<input type="hidden" name="rno" value="${reply.rno }">
						<button class="btn btn-danger" data-dismiss="modal">삭제</button>
						</form> 
      </div>
    </blockquote>
  </div>
</div>
			
			
			<br>
</c:forEach>
</div>
						
					<hr> --%>
<%-- <div>
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
			<a href="#" class="btn btn-primary" onclick="sendComment()">답변등록</a>
		</p>
		</div>
		</div>
	
</div> --%>  

<ul class="icons">
  <li>
    <span class="icon solid fa-envelope"></span>
    <strong>댓글</strong>
  </li>
</ul>
<a style="width:100%" href="javascript:void(0)" class="button primary small register">댓글 등록</a>
<div class="fields register-form" style="display:none">
  <div class="field">
    <h4>작성자</h4>
    <input type="text" name="rwriter" placeholder="Replyer">
  </div>
  <div class="field">
    <h4>댓글</h4>
    <textarea rows="6" name="rcontent" placeholder="Reply" style="resize:none;"></textarea>
  </div>
  <div class="field regBtn">
    <a href="javascript:void(0)" class="button primary small finish">등록</a>
    <a href="javascript:void(0)" class="button primary small cancel">취소</a>
  </div>
</div>
<ul class="replies">
</ul>
<div class="paging" style="text-align:center;">
</div>

<!-- 댓글 끝  -->


<script>
     $(document).ready(function(){

          $(".register").on("click", function(e){
            e.preventDefault();
            $(".register-form").show();
            $(this).hide();
        });


      $(".cancel").on("click", function(e){
            e.preventDefault();
            $(".register-form").hide();
            $(".register").show();
        });

     });
     
     var nno = "${notice.nno}";

 	// 등록버튼을 눌렀을 때
 	$(".finish").on("click", function(e){
 		e.preventDefault();
 		// 필요한 데이터: 댓글 작성자, 댓글
 		var replyer = $("input[name='rwriter']").val();
 		var reply = $("textarea[name='rcontent']").val();
 		
 		if(replyer == "" || reply == "" ) {return;}
 		
 		replyService.add({nno: nno, rcontent:reply, rwriter:replyer}, function(result){
 			alert(result);
 			$("input[name='rwriter']").val("Replyer");
 			$("textarea[name='rcontent']").val("Reply");
     		$(".register-form").hide();
     		$(".register").show();
 			pageNum = 1;
 			showList(pageNum);
			});
 	});
 	
 	
    var replyUL = $(".replies");
    var pageNum = 1;

    showList(1);
    
function showReplyPage(replyCnt){
	
	var str = "";
	var endNum = Math.ceil(pageNum / 10.0 ) * 10;
	var startNum = endNum - 9;
	var realEnd = Math.ceil(replyCnt / 10.0);
	
	if(endNum > realEnd ){
		endNum = realEnd;
	}
	
	var prev = startNum != 1;
	var next = endNum * 10 < replyCnt;
	
	if(matchMedia("screen and (max-width:918px)").matches){
		if(pageNum != 1 ) {
			str += "<a class='changePage' href='"+ (pageNum - 1) +"'><code>&lt;</code></a>"
		}
			str += "<code>"+ pageNum + "</code>";	
		if(pageNum != realEnd) {
			str += "<a class='changePage' href='"+ (pageNum + 1) +"'><code>&gt;</code></a>"
		}
	} else {
		if(prev){
			str += "<a class='changePage' href='"+ (startNum - 1) +"'><code>&lt;</code>"
		}
		for(let i = startNum; i <= endNum; i++ ){
				if(pageNum == i){
				str += "<code>" + i +"</code>";
				continue;
			}
				str += "<a class='changePage' href='"+ i +"'><code>" + i + "</code></a>"
			}
		if(next){
			str += "<a class='changePage' href='"+ (endNum + 1) +"'><code>&gt;</code></a>"
		}
	}
	replyPaging.html(str); // DOM
}

// 위임 
$(".paging").on("click", "a.changePage", function(e){
	e.preventDefault();
	pageNum = parseInt($(this).attr("href"));
	console.log(pageNum)
	showList(pageNum);
});  	

// 현재 페이지가 무엇인지 알아야하므로 페이지 번호를 받아와야 한다.
function showList(page){
	replyService.getList({nno:nno, page: page||1}, function(replyCnt, list){
		console.log("replyCnt : " + replyCnt);
		console.log("list : " + list);
		     			
		var str = "";
		if(list == null || list.length == 0 ){
			if(pageNum > 1 ) { // 2페이지에서 하나 남은 댓글을 삭제하면 1페이지로 가야되는데 2페이지로 유지되면서 등록된 댓글이 없다고 나온다.
				pageNum -= 1; // 내 페이지를 1개 감소 시키고 
				showList(pageNum); // 다시 그리기.
			}
			replyUL.html("등록된 댓글이 없습니다.");
			return;
		}
		
		for(let i = 0, len = list.length || 0; i < len; i++){
			str += "<li data-rno='"+ list[i].rno +"'>";
			// data-rno 라는 옵션을 통해서 파일첨부 때 이용할 수 있다.
			str += "<strong>" + list[i].rwriter + "</strong>";
			str += "<p class='reply"+ list[i].rno +"'>" + list[i].rcontent + "</p>";
			// 모든 p태그의 reply라는 클래스 반복문을 돌리기 번거로우니, RNO를 붙여 연결을 시킨다.
			str += "<div style='text-align:right;'>";
			str += "<a class='modify' href='"+ list[i].rno +"'>수정</a>";
			str += "<a class='finish' href='"+ list[i].rno +"' style='display:none;'>수정완료</a>";
			str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			str += "<a class='remove' href='"+ list[i].rno +"'>삭제</a>";
			str += "</div><div class='line'></div></li>";
		}
		replyUL.html(str);
		showReplyPage(replyCnt);
		
	});
}
 	
</script>













<script src="/resources/js/reply.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>