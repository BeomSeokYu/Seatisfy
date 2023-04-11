/**
	Javascript reply ajax Module
 */


// replyService 는 JSON 타입이다. 
var replyService = (function(){
	
	// a라는 결과로 어떻게 할지 모르기 때문에, 이 함수를 사용한 쪽에서 활용하는 것으로 목적을 둔다.
	// 그리하여 callback 함수를 넣고 리턴한다. 오류가 날 수 있으므로 error를 전달한다.
	// 필요에 따라 사용하되, 순서는 지키면 된다. 
	// 댓글 추가
	function add(reply, callback, error){
		console.log("add reply........."); 
		
		// 자바에서의 메소드는 저장공간이라는 것
		$.ajax({
			type: "post",
			url: "/reply/new",
			data: JSON.stringify(reply), // data는 내가 전달할 데이터이다.
			// 내가 전달할 데이터의 타입이 무엇인가. 안에 내장된 내용의 타입을 보내는 것. 
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	// 댓글 목록
	// 받을 때는 json으로 받는다.
	function getList(param, callback, error){
		console.log("get List........");
		
		var nno = param.nno;
		var page = param.page || 1;
		
//		$.getJSON("", function(){}.fail(function(){}) // 구조
		
		// xml이므로  .json 확장자로 바꾼다.
		// $.ajax({
		// 	type: "get",
		// 	url: "/reply/pages" + nno + "/" + page,
		// 	success: function(result){
		// 		if(callback){callback(data.replyCnt, data.list);}
		// 	},
		// 	error: function(xhr, status, err){
		// 		if(error){error(err);}
		// 	}
		// });

		

		$.getJSON("/reply/pages/"+ nno + "/"+ page +".json",
			function(data){
				if(callback){callback(data.replyCnt, data.list);}
			})
			.fail(function(xhr, status, err){
				if(error){
					error(err);
				}	
			})
		}
	
	// 댓글 삭제
	function remove(rno, callback, error){
		console.log("remove...........");
		$.ajax({
			type: "delete",
			url: "/reply/" + rno,
			success: function(result){
				if(callback){callback(result);}
			},
			error: function(xhr, status, err){
				if(error){error(err);}
			}
		});
	}
	
	// 댓글 수정
	function modify(reply, callback, error){
		console.log("modify : "+reply.rno);
		
		$.ajax({
			type: "PUT",
			url: "/reply/" + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){callback(result);}
			},
			error: function(xhr, status, err){
				if(error){error(err);}
			} 
		});
	}
	
	// 댓글 조회
	function get(rno, callback, error){
		$.get("/reply/"+ rno + ".json", function(result){if(callback){callback(result);}})
		.fail(function(xhr, status, err){if(error){error(err);}
		})
	}
	
		
	return {add: add, getList: getList, remove: remove, modify: modify, get: get};
})();