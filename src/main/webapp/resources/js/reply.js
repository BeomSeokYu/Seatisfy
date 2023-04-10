/**	자바스크립트를 하나의 모듈 처럼 구성
 * 
 	모듈 패턴
 	관련 함수들을 하나의 모듈처럼 묶음으로 구성
	자바스크립트의 즉시 실행 함수와 { } 을 이용하여 객체 구성
	- ( ) 안에 함수를 선언하고
		바깥쪽에서 실행
		>> 실행 결과가 선언된 변수에 할당됨.
	
 */
 
 console.log('reply.js.....')
 
 var replyService = (function() { 
	//즉시 실행 함수
	
	//댓글 등록
	function register(reply, callback, error){
		console.log('reply register()');
		$.ajax({
			type : 'post',
			url : '/reply/register',
			data : JSON.stringify(reply),
			contentType : 'application/json; charset=UTF-8',
			success : function(result){
				if(callback){
					callback(result);
					}
				},
				error : function(err){
					if(error){
						error(err);
					}
				}
			}); // END ajax()
	}	//END register()
	
	//전체 댓글 목록
	function list(param, callback, error) {
		console.log('reply list()');
		
		$.getJSON('/replies/list/' + param.bno + '/' + param.pageNum + '.json',
					function(result) {
						if(callback) {
							callback(result.totalReply, result.list);
						}				//전체 댓글 수		  댓글 목록
					}
			).fail(function(err){
				if(error){
					error(err);
				}
			}); //END getJSON
		
	} // END list()
	
	
	//댓글 수정
	function modify(rvo, callback, error){
		console.log('reply modify()');
		$.ajax({
			type : 'put',
			url : '/replies/' + rvo.rno,
			data : JSON.stringify(rvo),
			contentType : 'application/json; charset=UTF-8',
			success : function(result){
				if(callback){
					callback(result);
					}
				},
				error : function(err){
					if(error){
						error(err);
					}
				}
			}); // END ajax()
	}	//END modify()
	
	//댓글 삭제 
	function remove(rno, callback, error){
		console.log('reply remove()');
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(result){
				if(callback){
					callback(result);
					}
				},
				error : function(err){
					if(error){
						error(err);
					}
				}
			}); // END ajax()
	}	//END remove()
	
	//댓글 조회
	function view(rno, callback, error){
		console.log('reply view()');
		
		$.get('/replies/' + rno + '.json',
			function(result) {
				if(callback) {
					callback(result);
				}
			}
		).fail(function(err){
		if(error){
			error(err);
		}
	}); // END get
}	//END view()


	//댓글 작성일시 표시
	//- 당일 작성한 댓글은 '시:분:초' 표시
	//- 이전날 작성한 댓글은 '연/월/일' 표시
	function display(regDate){
		
		
		var rDate = new Date(regDate);
		var yy = rDate.getFullYear();
		var mm = rDate.getMonth();
		var dd = rDate.getDate();
		
		var today = new Date();
		
		if(today.getFullYear() == yy &&
		   today.getMonth() == mm &&
		   today.getDate() == dd) {
		   
		   return rDate.getHours() + ":" +
		   		  rDate.getMinutes() + ":" +
		   		  rDate.getSeconds();
		   } else{
		   		return yy + "/" + (mm+1) + "/" + dd;
		   }		
		   		
		
	}	//END display()
	
	return { display:display, view:view, remove:remove, modify:modify, 
			 register:register, list:list }; 
 
 } ) ();
 
 //외부에서는
 //replyService.register(객체, 콜백함수) 형태로 호출
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 