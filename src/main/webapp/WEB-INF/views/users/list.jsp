<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>

	<div class="container">
		<div class="photo-gallery container mb-3">
			<div class="row justify-content-center">
				<h2>회원</h2>

				<div class="col-lg-12">
					<div class="row">
						<div class="col-3 text-muted">
							<select class="form-select form-select-sm w-50 d-inline"
								id="selectAmount">
								<option value="10" selected>10</option>
								<option value="20">20</option>
								<option value="40">40</option>
							</select> <span class="d-inline">개씩 보기</span>
						</div>
						<div class="col-9 text-end"></div>
					</div>
					<hr class="my-4">

					<table class="table table-hover shadow bg-body rounded">
						<thead>
							<tr style="background-color: #999999; color: white;">
								<th scope="col" class="col-2">번호</th>
								<th scope="col" class="col-6">이메일</th>
								<th scope="col" class="col-6">이름</th>
								<th scope="col" class="col-2">전화번호</th>
								<th scope="col" class="col-2">가입일</th>
							</tr>
						</thead>
						<tbody id="imgList">
								
						</tbody>
					</table>
					<button id="regBtn" type="button"
						class="btn btn-xs pull-right btn-info">등록</button>
					<div class="row text-center" id="none"></div>

					<hr class="my-4">
					<div class="row">
						<div class="col-8">
							<ul class="pagination justify-content-center" id="pagination">

							</ul>
						</div>
						<div class="col-4">
							<div class="d-flex text-end">
								<select class="form-select" id="selectType">
									<option value="E" selected>이메일</option>
									<option value="N">이름</option>
									<option value="EN">이메일/이름</option>
								</select> <input class="form-control form-control-sm" type="search"
									placeholder="검색어" id="keyword">
								<button class="btn btn-sm btn-outline-success" type="button"
									id="searchBtn">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	
						
					
	<script src="/resources/js/page.js"></script>
<script>				
/*
       [form id 이걸로 하셈]

       검색 버튼 : searchBtn
       검색 입력 인풋 : keyword
       검색 선택 셀렉트 : selectType
       게시글 표시 갯수 셀렉트 : selectAmount
       */

      /* 전체 게시물 수 가져오기 위해 처리한 jsp URL 입력해주세요 */
      function getTotalCountUrl() {
         return '/user/total'
      }
      /* 게시물 가져오기 위해 처리한 jsp URL 입력해주세요 */
      function getListUrl() {
         return '/user/listAjax'
      }
	
      function getCsrfToken(){
    	  return '${_csrf.token}';
      }
      
      function printList(data) {
         //TODO: 리스트 출력 처리 하세요
         if (data.length < 1) {
            var noneStr = '';
            noneStr ='<div>가입된 회원이 없습니다.<div>'
            $("#none").html(noneStr);
         }
         var imgHTML = '';
         for (var i = 0; i < data.length; i++) {
        	// var regDate = new Date(data[i].udate); // Date 객체 생성
            // var formatRegDate = udate.getFullYear() + '-' + ('0' + (udate.getMonth() + 1)).slice(-2) + '-' + ('0' + udate.getDate()).slice(-2); // yyyy-MM-dd 형식으로 변환
            
              imgHTML += ''
                  + "<tr>"
            	  +"<td>" + data[i].uno + "</td>"
                  + "<td><a href=\"detail?uno="
                  + data[i].uno	+"'\">"	+ data[i].username + "</a></td>" 
                  +'<td>' + data[i].name+ "</td>"
                  + '<td>' + data[i].phone  + "</td>"
                  +"<td>" + data[i].udate + "</td></tr>" 
         }
         $('#imgList').html(imgHTML); 
      }	
      
    //등록 버튼 클릭 이벤트 처리
  	$('#regBtn').on('click', function(){
  		self.location = "/user/join";
  	});
  
</script>      
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>