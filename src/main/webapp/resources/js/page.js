/**
 * 페이지네이션 스크립트
 */

/* Criteria 객체 */
var cri = {
		amount : $('#selectAmount').val(),							// 한 페이지에 표시 할 목록 갯수
		pageNum : 1,
		type : null,
		keyword : null
}
/* Pagination 정보 객체 */
var pageObj = {
		NUM_PER_PAGE : 5.0,					// 한 페이지에 표시 할 페이지 번호 수
		start : 1,							// 시작 페이지 번호
		end : this.NUM_PER_PAGE,			// 끝 페이지 번호
		isPrevious : false,					// 이전
		isNext : false,						// 다음
		
		pageCal : function(cri){
			var total = 0;
			var csrfToken = getCsrfToken();
			fetch(getTotalCountUrl(), {	
				method: "post",
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
					'X-CSRF-TOKEN': csrfToken
				},
				body: new URLSearchParams({
						amount: cri.amount,
						pageNum: cri.pageNum,
						offset: cri.amount * (cri.pageNum - 1),
						keyword: cri.keyword,
						type: cri.type,
						csrfName: csrfToken // CSRF 토큰 값
					})
		        })
				.then(resp => resp.text())
				.then(data => {
					data.trim()
					console.log(data);
					total = data*1
					setPage(total, cri, this);
				})
		}
}

// 페이지네이션 설정 함수
function setPage(total, cri, pageObj) {
	var pages = Math.ceil(total / cri.amount);
	pageObj.end = (Math.ceil(cri.pageNum / pageObj.NUM_PER_PAGE) * pageObj.NUM_PER_PAGE);
	pageObj.start = (pageObj.end - (pageObj.NUM_PER_PAGE - 1));
	pageObj.end = pageObj.end >= pages ? pages : pageObj.end;	// 실제 끝 페이지 번호 확인
	pageObj.isPrevious = pageObj.start > 1;
	pageObj.isNext = pageObj.end < pages;
	
	
	var pageHTML = '';
	//<!-- previous -->
	if (pageObj.isPrevious) {
		pageHTML += ''
		+'<li class="page-item">'
			+'<button type="button" class="page-link" onclick="previous()" aria-label="Previous">'
				+'<span aria-hidden="true">&laquo;</span>'
				+'<span class="sr-only">이전</span>'
			+'</button>'
		+'</li>'
	}
	//<!-- page -->
	for (var i = pageObj.start; i <= pageObj.end; i++) {
		pageHTML += ''
		+'<li class="page-item ' + (cri.pageNum == i ? 'active disabled' : '') +'">'
			+'<button class="page-link" onclick="pageBtn('+i+')">'+i+'</button>'
		+'</li>'
	}
	//!-- next -->
	if (pageObj.isNext) {
		pageHTML += ''
		+'<li class="page-item">'
			+'<button type="button" class="page-link" onclick="next()" aria-label="Next">'
				+'<span class="sr-only">다음</span>'
				+'<span aria-hidden="true">&raquo;</span>'
			+'</button>'
		+'</li>'
	}
	console.log(pageHTML)
	$('#pagination').html(pageHTML);
	getList();
}

/* 현재 버튼 클릭 시 실행 함수 */
function pageBtn(pageNum) {
	cri.pageNum = pageNum;
	pageObj.pageCal(cri);
}
/* 이전 버튼 클릭 시 실행 함수 */
function previous() {
	pageObj.start -= 1;
	cri.pageNum = pageObj.start
	pageObj.pageCal(cri);
}
/* 다음 버튼 클릭 시 실행 함수 */
function next() {
	pageObj.end += 1;
	cri.pageNum = pageObj.end
	pageObj.pageCal(cri);
}

//-------------- 게시글 표시 갯수 변경 ---------------
$('#selectAmount').on('change', function(){
	cri.amount = $(this).val();
	cri.pageNum = 1;
	pageObj.start = 1;
	pageObj.end = pageObj.NUM_PER_PAGE
	pageObj.pageCal(cri);
});


// -------------- 검색 관련 ---------------
$('#searchBtn').on('click', function(){
	searchExe();
});
$('#keyword').on("keypress", function(){
	if(event.keyCode == 13) {
		searchExe();
	}
})

function searchExe() {

	cri.pageNum = 1
	cri.keyword = $('#keyword').val()
	cri.type = $('#selectType').val()
	pageObj.pageCal(cri);
}

onload = function() {
	pageObj.pageCal(cri);
}

function getList() {
	var csrfToken = getCsrfToken();
	fetch(getListUrl(), {	
		method: "post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
			'X-CSRF-TOKEN': csrfToken
		},
		body: new URLSearchParams({
				amount: cri.amount,
				pageNum: cri.pageNum,
				offset: cri.amount * (cri.pageNum - 1),
				keyword: cri.keyword,
				type: cri.type,
				csrfName: csrfToken // CSRF 토큰 값
			})
        })
		.then(resp => resp.json())
		.then(data => {
			console.log(data);
			printList(data);
		})
}