<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>

<html>
<%@include file="../include/header.jsp"%>
<body>
<%@include file="../include/navbar.jsp"%>
<header class="mt-5 mb-5 pt-5 pb-5" style="background-image: url('/resources/assets/img/portfolio/fullsize/6.jpg'); background-size: cover;">
	<div class="container">
		<h1 class="mt-5 mb-5 pt-5 pb-5 text-white"><span class="text-shadow">이용 안내</span></h1>
	</div>
</header>
<main class="py-5">
  <div class="container">
    <div class="row">
<div class="col-lg-3 d-none d-lg-block">
      <%@ include file="../include/sidebar_intro.jsp"%>
    </div>
<div class="col-lg-9">
	<div class="row featurette">
	      <div class="col-md-7">
	        <h2 class="featurette-heading text-primary">예약장소 등록 하는법 </h2>
	        <p class="lead">좌석의 개수를 지정 후 좌석 배치를 직접 설정해야 한다.</p>
	      </div>
	     <div class="col-md-5">
			  <img src="/resources/assets/img/portfolio/rs.PNG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" height="700" alt="Image description">
			  <hr class="featurette-divider">
		</div>
		</div>
          <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading text-primary">예약 장소 검색 <span class="text-muted"></span></h2>
        <p class="lead">장소 검색을 이용하거나 지도에 장소를 클릭 시 선택 가능</p>
      </div>
       <div class="col-md-5">
			  <img src="/resources/assets/img/portfolio/rm.JPG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" height="700" alt="Image description">
			  <hr class="featurette-divider">
      </div>
   </div>
   <div class="row featurette">
	      <div class="col-md-7">
	        <h2 class="featurette-heading text-primary">좌석 예약 하는 법 </h2>
	        <p class="lead">원하는 빈 좌석을 선택 후 예약 할 수 있다. </p>
	      </div>
	     <div class="col-md-5">
			  <img src="/resources/assets/img/portfolio/seat.JPG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" height="700" alt="Image description">
			  <hr class="featurette-divider">
		</div>
    </div>
    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading text-danger">유의사항</h2>
        <p class="lead"> 좌석 변경을 원할 시 예약을 취소 후  다시 예약해야 한다.</p>
        <p class="lead"> 장소 선택을 지도에서 클릭 시 장소는 직접 입력 해야 한다.</p>
        <p class="lead"> 장소 예약 시 없는 좌석은 장소 등록 할 때 선택해 없애야 한다.</p>
      </div>
	</div>
</div>
</div>
</main>
<%@include file="../include/footer.jsp"%>
</body>
</html>