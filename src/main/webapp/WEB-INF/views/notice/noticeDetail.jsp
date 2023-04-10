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




<%-- <!-- 댓글 시작 -->

<hr>

<div class="card">
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
						
					<hr>



<div>

<!-- 댓글 등록 -->
	<form method="post" action="/reply/write">
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
			<button id="regBtn" type="button" class="btn btn-info" data-dismiss="modal">Register</button>
		</p>
		</div>
		</div>
	</form>
	
</div>  --%>


<!-- 댓글 끝  -->














<!-- 댓글  -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>Reply
                            
                            <!-- 신규 댓글 작성 버튼  -->
                            <button id="newBtn" class="btn btn-info btn-xs pull-right">
                            	New Reply
                            </button>
                        </div>
                        <div class="panel-body">
                        
                        <!--댓글 목록-->
                        <ul class="chat">
                        	<li data-rno='11'>	
	                        	<div>
		                        	<div class="header">
			                        	<strong>user00</strong>
			                        	<small class="pull-right">
			                        		2022-12-29 11:22
			                        	</small>
		                        	</div>
		                        	<p>Good job!</p>
	                        	</div>
                        	</li>
                        </ul>	
                        <!--END댓글 목록  -->
                        
                        <!-- 댓글 목록paging  -->
                        <div class="pull-right"> 
								<ul class="pagination justify-content-center">
								</ul>
                        </div>	
                        <!-- END paging -->   
                          
                        </div>	<!-- /.panel-body -->	
                    </div>	<!-- /.panel -->
                </div>	<!-- /.col-lg-12 -->
            </div>	<!-- /.row -->


<!-- 댓글 작성 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">NEW REPLY</h4>
            </div>
            <div class="modal-body">
	            <div class="form-group">
	              <label>Reply</label>
	              <input name="reply" id="reply" class="form-control" 
	              value="" >
	         	</div>
	         	<div class="form-group">
	              <label>Replyer</label>
	              <input name="replyer" id="replyer" class="form-control" 
	              value="" >
	         	</div>
	         	<div class="form-group">
	              <label>Reply Date</label>
	              <input name="regDate" id="regDate" class="form-control" 
	              value="" readonly>
	         	</div>
         	</div>
            <div class="modal-footer">
                <button id="remBtn" type="button" class="btn btn-danger" data-dismiss="modal">Remove</button>
                <button id="modBtn" type="button" class="btn btn-warning" data-dismiss="modal">Modify</button>
                <button id="regBtn" type="button" class="btn btn-info" data-dismiss="modal">Register</button>
                <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>	<!-- /.modal-content -->
    </div>	<!-- /.modal-dialog -->
</div>	<!-- /.modal -->  
<!-- END 댓글 작성 Modal -->  


<script src="../resources/js/reply.js"></script> 

<script>

var bnoVal = '${bvo.bno}';
var replyUL = $('.chat');	//댓글 목록

makeList(1);

//댓글 목록 출력
function makeList(pageNum){
	//댓글 목록 테스트
	 replyService.list( {bno : bnoVal, pageNum : pageNum},
		function(totalReply, result){
		//댓글 등록하면 pageNum이 -1
		 if(pageNum == -1){
			      pageNum = Math.ceil(totalReply / 3.0);
			      makeList(pageNum);	//마지막 페이지를 계산해서 이동처리
			      return;
		 }
		 
		 //댓글이 없는 경우 댓글이 안나오게 처리 
		 if(result == null || result.length == 0){
			 replyUL.html('');
			 return;
		 }
		 
		//댓글이 있는 경우 - replies -------------
			var tag = "";
			for( var i=0 ; i<result.length ; i++) {
//				console.log(result[i]);
				tag += "<li data-rno='" + result[i].rno + "'>" + 
				       " 	<div>" +
				       "		<div class='header'>" +
				       "           	<strong>" + result[i].replyer + "</strong>" +
				       "           	<small class='pull-right'>" + 
				                   		replyService.display(result[i].regDate) + "</small></div>" + 
				       "         <p>" + result[i].reply + "</p></div></li>";
			}
			replyUL.html(tag);
			//END replies ------------------------
			
			makePageNum(totalReply, pageNum); //페이지 번호 출력 함수 호출
	} 
	); //END list() 
}	//END makeList


//댓글 목록 페이지  ================
	var pageNum = 1;	//현재 페이지 
	var pageUL = $('.pagination');
	
function makePageNum(totalReply, pageNum){
	var numPerPage = 5.0;		//한 페이지에 표시할 페이지 번호 수
	var amount = 3.0;			//한 페이지에 표시할 댓글 수
	var pages = Math.ceil(totalReply / amount);		//전체 페이지 번호 수
	var end = Math.ceil(pageNum / numPerPage) * numPerPage; //끝 페이지 번호
	var start = end - (numPerPage - 1);				//시작 페이지 번호
		end = end >= pages ? pages : end;	//실제 끝 페이지 번호 확인 
	var previous = start > 1;		//이전
	var next = end < pages;			//다음
	
	var tag = "";
	if(previous == true){
		tag += "<li class='paginate_button'>" +
			   "<a href='" + (start - 1) + "'>&laquo; Previous</a></li>";
	}
	for(var i =start; i<=end; i++){	<!-- 페이지 번호 start부터 end까지-->  
	tag += "<li class='paginate_button " + (i == pageNum ? 'active' : '') + "'>" +
		   "<a href='" + i + "'>" + i + "</a></li>";
	}
	
	if(next == true){
		tag += "<li class='paginate_button'>" +
			   "<a href='" + (end + 1) + "'>Next &raquo;</a></li>";
	}
	  	pageUL.html(tag);
	  	
} 	//END makePageNum
//END 댓글 목록 페이지 번호 출력 ================


//페이지 번호 클릭 이벤트 처리
pageUL.on('click', 'li a',function(evnet){
	event.preventDefault();
	
	pageNum = $(this).attr('href');
	//console.log(pageNum);
	//pageNum = $('.pagination li a').val($(this).attr('href'));
	makeList(pageNum);	//클릭된 번호의 댓글 목록 표시
	 
});
	
//END페이지 번호 클릭 이벤트 처리  
	
	
//댓글 모달 창 처리---------------------
var modal = $('#myModal')
var replyTxt = $('#reply');
var replyerTxt = $('#replyer');
var regDateTxt = $('#regDate');

var modBtn= $('#modBtn');
var remBtn= $('#remBtn');
var regBtn= $('#regBtn');


//New Reply 버튼 클릭 이벤트 처리
$('#newBtn').on('click', function(event){
	modal.find('input').val('');	//입력값 지우기
	regDateTxt.closest('div').hide();	//regDate에 가까운 div 숨기기
	modal.find("button[id != 'closeBtn']").hide(); //close가 아닌 버튼 숨기기
	regBtn.show();	//등록 버튼은 보이게
	
	modal.modal('show');
});

regBtn.on('click', function(event){
	replyService.register(
			 { "nno" : $('#nno').val(),
			   "rwriter" : $('#rwriter').val(),
			   "rcontent" : $('#rcontent').val()
			 },
			 function(result){
				 alert('댓글 등록이 완료되었습니다');
			 }
	);
});	//END Register 버튼 클릭 이벤트 처리

//댓글 클릭 이벤트 처리
replyUL.on('click', 'li', function(event){
	var rno = $(this).data('rno');
	//댓글 번호를 매개변수로 replyService의 view함수 호출
	//반환값을 모달창에 표시
	//수정, 삭제, 버튼 표시
	replyService.view(
	rno,
	function(result){
		replyTxt.val(result.reply);
		replyerTxt.val(result.replyer);
		regDateTxt.val(replyService.display(result.regDate));
		
		regDateTxt.closest('div').show();	//regDate에 가까운 div 숨기기
		modal.find("button[id != 'closeBtn']").hide();
		modBtn.show();
		remBtn.show();
		
		modal.data('rno', result.rno);		
		modal.modal('show');
	}
);
}); //END 댓글 클릭 이벤트 처리



//Moidfy 버튼 클릭 이벤트 처리
modBtn.on('click', function(event){
	replyService.modify(
			 { rno : modal.data('rno'),
			   "reply" : replyTxt.val()
			 },
			 function(result){
				 alert('댓글 수정이 완료되었습니다');
				
				 modal.find('input').val('');	//입력 값 지우기
				 modal.modal('hide');	//모달 창 숨기기
				// makeList(1);	//댓글 목록 새로 표시
				 console.log("pageNum : " + pageNum);
				 makeList(pageNum);
			 }
	);
}); //END Moidfy 버튼 클릭 이벤트 처리


//Remove 버튼 클릭 이벤트 처리
remBtn.on('click', function(event){
	replyService.remove(
			modal.data('rno'),
			function(result){
				alert('댓글 삭제가 완료되었습니다');
				
				modal.find('input').val('');	//입력 값 지우기
				modal.modal('hide');	//모달 창 숨기기
				makeList(1);	//댓글 목록 새로 표시
				
			},
			function(err){
				alert('댓글을 삭제하지 못했습니다.');
			}
	);
}); //END Remove 버튼 클릭 이벤트 처리
</script>











<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>