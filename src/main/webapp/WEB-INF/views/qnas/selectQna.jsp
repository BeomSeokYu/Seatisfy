<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>  
	
<!DOCTYPE html>		
<html>
<%@include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<body>
<%@include file="../include/navbar.jsp"%>
<header class="masthead" style="background-image: url('resources/assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>좌석 예약</h1>
                            <span class="subheading">A Blog Theme by Start Bootstrap</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
	<h3 class="com_title2">상세보기</h3>
	<div class="card">
		<h5 class="card-header">제목 : ${qna.qtitle}</h5>
		<div class="card-body">
			<h5 class="card-title">내용 : ${qna.qcontent}</h5>
			

			<div class="d-flex justify-content-end badge bg-light text-dark">작성일자 : ${qna.qdate}</div>
		</div>
	</div>
	<div style="text-align: right;">
	<a href="/qnas/update?qno=${qna.qno}" >수정</a>
	<form method="POST" action="/qnas/delete?qno=${qna.qno}">
	<input type="hidden" name="_csrf" value="${_csrf.token}"/>
		<input type="submit" value="삭제"/>
	</form>
	<a href="/qnas/">이전</a>
	</div>
</body>
					

	
<%@include file="../include/footer.jsp"%>
<script>
function checkForm() {
	  // 폼 유효성 검사를 수행
	  if (bindingResult.hasErrors()) {
	    alert("폼을 제출할 수 없습니다.");
	    return false;
	  }

	  // 폼 유효성 검사를 통과하면 true 반환
	  return true;
	}
</script>
</head>
</html>