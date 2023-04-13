<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<%@include file="../include/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
/* 맵 설정, 검색 리스트  */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:300px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

/* 지도에 현재 중앙 위치 정보 표기 */
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;right:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

/* 좌석 번호 설정 */
.seat {
  text-align: center;
  border: 1px solid #444444;
}

.seat-disable {
  text-align: center;
  border: 1px solid #444444;
  background-color: #808080;
}

.table-fixed {
  width: 100%;
  min-width: 700px;
  /* 테이블 전체의 너비를 100%로 설정합니다. */
  table-layout: fixed;
  /* 테이블 레이아웃을 고정된(fixed) 모드로 설정합니다. */
}

.table-fixed th,
.table-fixed td {
  /* 각 셀의 높이를 50px로 설정합니다. */
  height: 50px;
  /* 각 셀의 너비를 33.33%로 설정합니다. */
  width: 33.33%;
  /* 셀의 내용이 너비보다 길 경우, 너비를 넘치는 부분을 생략하고 ...으로 표시합니다. */
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

</style>
<body>
<%@include file="../include/navbar.jsp"%>



<%-- <div class="container">
	<div class="container mb-3">
		<div class="row justify-content-center">
			<h2>예약</h2>
			<div class="col-lg-3 d-none d-lg-block">
				<%@ include file="/include/sidebar4.jsp"%>
			</div>

			<!-- <div class="col-lg-9"> -->
			<div class="col-lg-12">
				<form:form action="/reserve/add" method="post" modelAttribute="postDTO" id="postFrm">
					<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
					제목 : <form:input path="ptitle" /><br>
					<form:errors path="ptitle"/><br>
					장소 : <form:input path="place" id="place" /><br>
					<form:errors path="place"/><br>
					주소 : <form:input path="address" id="address" /><br>
					<form:errors path="address"/><br>
					<div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					     	 장소 검색 : 
					                <input type="text" id="keyword" size="15">
					                <button type="button" onclick="searchPlaces()">검색</button><br>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					    <div class="hAddr">
					        <span class="title">지도중심기준 행정동 주소정보</span>
					        <span id="centerAddr"></span>
					    </div>
					</div>
					자리 배치 정보 (등록 후 수정 불가) : <input id="seatX" type="number" min="1" max="20" value="10"/>
					X <input id="seatY" type="number" min="1" max="20" value="10"/>
					<button id="seatTableBtn" type="button">만들기</button><br>
					<form:hidden path="seatinfo"/><br>
					<div class="table-responsive">
						<table class="table table-fixed table-responsive" id="seatTable">
						</table>
					</div>
					<form:errors path="seatinfo"/><br>
					시작일 : <form:input id="sdate" path="startdate" type="datetime-local" /><br>
					<form:errors path="startdate"/><br>
					종료일 : <form:input id="edate" path="enddate" type="datetime-local" /><br>
					<form:errors path="enddate"/><br>
					내용 : <form:textarea path="pcontent" id="summernote"/><br>
					<form:errors path="pcontent"/><br>
					<form:hidden path="pwriter" value="작성자"/>
					<button type="button" id="submitBtn">전송</button>
				</form:form>
			</div>
		</div>
	</div>
</div> --%>

<div class="container">
	<div class="container mb-3">
		<div class="row justify-content-center">
			<h2>예약</h2>
			<%-- <div class="col-lg-3 d-none d-lg-block">
				<%@ include file="/include/sidebar4.jsp"%>
			</div> --%>

			<!-- <div class="col-lg-9"> -->
			<div class="col-lg-12">
				<form:form action="/reserve/add" method="post" modelAttribute="postDTO" id="postFrm">
					<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
					제목 : <form:input path="ptitle" /><br>
					<form:errors path="ptitle"/><br>
					장소 : <form:input path="place" id="place" /><br>
					<form:errors path="place"/><br>
					주소 : <form:input path="address" id="address" /><br>
					<form:errors path="address"/><br>
					<div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					     	 장소 검색 : 
					                <input type="text" id="keyword" size="15">
					                <button type="button" onclick="searchPlaces()">검색</button><br>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					    <div class="hAddr">
					        <span class="title">지도중심기준 행정동 주소정보</span>
					        <span id="centerAddr"></span>
					    </div>
					</div>
					자리 배치 정보 (등록 후 수정 불가) : <input id="seatX" type="number" min="1" max="20" value="10"/>
					X <input id="seatY" type="number" min="1" max="20" value="10"/>
					<button id="seatTableBtn" type="button">만들기</button><br>
					<form:hidden path="seatinfo"/><br>
					<div class="table-responsive">
						<table class="table table-fixed table-responsive" id="seatTable">
						</table>
					</div>
					<form:errors path="seatinfo"/><br>
					시작일 : <form:input id="sdate" path="startdate" type="datetime-local" /><br>
					<form:errors path="startdate"/><br>
					종료일 : <form:input id="edate" path="enddate" type="datetime-local" /><br>
					<form:errors path="enddate"/><br>
					내용 : <form:textarea path="pcontent" id="summernote"/><br>
					<form:errors path="pcontent"/><br>
					<form:hidden path="pwriter" value="작성자"/>
					<button type="button" id="submitBtn">전송</button>
				</form:form>
			</div>
		</div>
	</div>
</div>



<%-- <div class="col-lg-8 mx-auto p-4 py-md-5">
	<form action="/study/studyAddProc.jsp" method="post" name="form">
		<main>
			<div class="pb-3 mb-5">	
			    <h4 class="pb-3 mb-3 border-bottom">스터디 기본 정보를 입력해주세요.</h4>	     
				<div class="row g-3">
			         <div class="col-sm-6">
				          <label for="process" class="form-label">진행방식</label>
			              <select class="form-select" name="process" id="process" onchange="changeValue()" required="">
			                <option value="" selected="" disabled="">온라인/오프라인</option>
			                <option value="온라인">온라인</option>
			                <option value="오프라인">오프라인</option>
			              </select>
		          	  </div>
			          <div class="col-sm-6">
			           	 <label for="recruitCnt" class="form-label">총인원</label>
			             <select class="form-select" name="recruitCnt" id="recruitCnt" required="">
		              	   <option value="" selected="" disabled="">1명~10명</option>
			               <option value="1">1명</option>
			               <option value="2">2명</option>
			               <option value="3">3명</option>
			               <option value="4">4명</option>
			               <option value="5">5명</option>
			               <option value="6">6명</option>
			               <option value="7">7명</option>
			               <option value="8">8명</option>
			               <option value="9">9명</option>
			               <option value="10">10명</option>
			             </select>
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="startDate" class="form-label">시작예정</label>
			             <input class="form-select" type="date" name="startDate" id="startDate" required="">				            
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="expDate" class="form-label">예상기간</label>
			             <select class="form-select" name="expDate" id="expDate" required="">
			               <option value="" selected="" disabled="">1개월~6개월</option>
			               <option value="1">1개월</option>
			               <option value="2">2개월</option>
			               <option value="3">3개월</option>
			               <option value="4">4개월</option>
			               <option value="5">5개월</option>
			               <option value="6">6개월</option>
			             </select>
			            
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="category1" class="form-label">카테고리1</label>
			             <select class="form-select" name="category1" id="category1" required="">
			               <option value="" selected="" disabled="">선택1</option>
			               
			           				<option value="영어">영어</option>
			           			
			           				<option value="일본어">일본어</option>
			           			
			           				<option value="중국어">중국어</option>
			           			
			           				<option value="운동/스포츠">운동/스포츠</option>
			           			
			           				<option value="IT">IT</option>
			           			
			             </select>
			            
		         	 </div>
		         	 <div class="col-sm-6">
			           	 <label for="category2" class="form-label">카테고리2</label>
			             <select class="form-select" name="cNo" id="category2" required="">
			               <option value="" selected="" disabled="">선택2</option>
			                
			           				<option value="1">TOEIC</option>
			           			
			           				<option value="2">TOEFL</option>
			           			
			           				<option value="3">OPIc</option>
			           			
			           				<option value="4">영어회화</option>
			           			
			           				<option value="5">JLPT</option>
			           			
			           				<option value="6">JPT</option>
			           			
			           				<option value="7">일본어회화</option>
			           			
			           				<option value="8">HSK</option>
			           			
			           				<option value="9">HSKK</option>
			           			
			           				<option value="10">TSC</option>
			           			
			           				<option value="11">중국어회화</option>
			           			
			           				<option value="12">헬스</option>
			           			
			           				<option value="13">러닝</option>
			           			
			           				<option value="14">필라테스</option>
			           			
			           				<option value="15">요가</option>
			           			
			           				<option value="16">클라이밍</option>
			           			
			           				<option value="17">코딩</option>
			           			
			           				<option value="18">컴활1급</option>
			           			
			           				<option value="19">컴활2급</option>
			           			
			           				<option value="20">정보처리기사</option>
			           			
			           				<option value="21">SQLD</option>
			           			
			           				<option value="22">SQLP</option>
			           			
			           			
			           			
			             </select>
		         	 </div>
		         	
		         	 <div class="col-sm-6" id="addressDiv" style="display: none;">
						<label for="addr1" class="form-label">도로명 주소</label>
							<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소 검색을 눌러주세요.">
							<input type="button" class="form-control btn btn-outline-secondary" value="주소 검색" onclick="goPopup()"> 
					</div>
					<div class="col-sm-6" id="addressDiv2" style="display: none;">
						<label for="addr2" class="form-label">상세 주소</label>
							<input type="text" class="form-control" id="addr3" name="addr3" placeholder="주소 검색을 눌러주세요.">
							<input type="text" class="form-control" id="addr2" name="addr2">
							<input type="hidden" name="address" id="address">
					</div>
	         		 
					
			</div>
					
					
				
			</div>
		    <div>
			    <h4 class="pb-3 mb-3 border-bottom">스터디를 소개해주세요.</h4>
			   	<div>
				   	<div class="col-sm-6">
					           	 <label for="sTitle" class="form-label">제목</label>
					             <input type="text" class="form-control" name="sTitle" id="sTitle" required="">						            
		         	</div>
	         		<div class="col-sm-6">
				           	 <label for="sContent" class="form-label">내용</label>
							<textarea id="summernote" name="sContent" class="form-control" style="display: none;"></textarea><div class="note-editor note-frame" style="width: 483px;"><div class="note-dropzone"><div class="note-dropzone-message"></div></div><div class="note-toolbar" role="toolbar"><div class="note-btn-group note-fontname"><div class="note-btn-group"><button type="button" class="note-btn dropdown-toggle" tabindex="-1" data-toggle="dropdown" aria-label="Font Family"><span class="note-current-fontname" style="font-family: sans-serif;">sans-serif</span> <span class="note-icon-caret"></span></button><div class="note-dropdown-menu note-check dropdown-fontname" role="list" aria-label="Font Family"><a class="note-dropdown-item" href="#" data-value="Arial" role="listitem" aria-label="Arial"><i class="note-icon-menu-check"></i> <span style="font-family: 'Arial'">Arial</span></a><a class="note-dropdown-item" href="#" data-value="Arial Black" role="listitem" aria-label="Arial Black"><i class="note-icon-menu-check"></i> <span style="font-family: 'Arial Black'">Arial Black</span></a><a class="note-dropdown-item" href="#" data-value="Comic Sans MS" role="listitem" aria-label="Comic Sans MS"><i class="note-icon-menu-check"></i> <span style="font-family: 'Comic Sans MS'">Comic Sans MS</span></a><a class="note-dropdown-item" href="#" data-value="Courier New" role="listitem" aria-label="Courier New"><i class="note-icon-menu-check"></i> <span style="font-family: 'Courier New'">Courier New</span></a><a class="note-dropdown-item" href="#" data-value="맑은 고딕" role="listitem" aria-label="맑은 고딕"><i class="note-icon-menu-check"></i> <span style="font-family: '맑은 고딕'">맑은 고딕</span></a><a class="note-dropdown-item" href="#" data-value="궁서" role="listitem" aria-label="궁서"><i class="note-icon-menu-check"></i> <span style="font-family: '궁서'">궁서</span></a><a class="note-dropdown-item" href="#" data-value="굴림체" role="listitem" aria-label="굴림체"><i class="note-icon-menu-check"></i> <span style="font-family: '굴림체'">굴림체</span></a><a class="note-dropdown-item" href="#" data-value="굴림" role="listitem" aria-label="굴림"><i class="note-icon-menu-check"></i> <span style="font-family: '굴림'">굴림</span></a><a class="note-dropdown-item" href="#" data-value="바탕체" role="listitem" aria-label="바탕체"><i class="note-icon-menu-check"></i> <span style="font-family: '바탕체'">바탕체</span></a></div></div></div><div class="note-btn-group note-fontsize"><div class="note-btn-group"><button type="button" class="note-btn dropdown-toggle" tabindex="-1" data-toggle="dropdown" aria-label="Font Size"><span class="note-current-fontsize">15</span> <span class="note-icon-caret"></span></button><div class="note-dropdown-menu note-check dropdown-fontsize" role="list" aria-label="Font Size"><a class="note-dropdown-item" href="#" data-value="8" role="listitem" aria-label="8"><i class="note-icon-menu-check"></i> 8</a><a class="note-dropdown-item" href="#" data-value="9" role="listitem" aria-label="9"><i class="note-icon-menu-check"></i> 9</a><a class="note-dropdown-item" href="#" data-value="10" role="listitem" aria-label="10"><i class="note-icon-menu-check"></i> 10</a><a class="note-dropdown-item" href="#" data-value="11" role="listitem" aria-label="11"><i class="note-icon-menu-check"></i> 11</a><a class="note-dropdown-item" href="#" data-value="12" role="listitem" aria-label="12"><i class="note-icon-menu-check"></i> 12</a><a class="note-dropdown-item" href="#" data-value="14" role="listitem" aria-label="14"><i class="note-icon-menu-check"></i> 14</a><a class="note-dropdown-item" href="#" data-value="16" role="listitem" aria-label="16"><i class="note-icon-menu-check"></i> 16</a><a class="note-dropdown-item" href="#" data-value="18" role="listitem" aria-label="18"><i class="note-icon-menu-check"></i> 18</a><a class="note-dropdown-item" href="#" data-value="20" role="listitem" aria-label="20"><i class="note-icon-menu-check"></i> 20</a><a class="note-dropdown-item" href="#" data-value="22" role="listitem" aria-label="22"><i class="note-icon-menu-check"></i> 22</a><a class="note-dropdown-item" href="#" data-value="24" role="listitem" aria-label="24"><i class="note-icon-menu-check"></i> 24</a><a class="note-dropdown-item" href="#" data-value="28" role="listitem" aria-label="28"><i class="note-icon-menu-check"></i> 28</a><a class="note-dropdown-item" href="#" data-value="30" role="listitem" aria-label="30"><i class="note-icon-menu-check"></i> 30</a><a class="note-dropdown-item" href="#" data-value="36" role="listitem" aria-label="36"><i class="note-icon-menu-check"></i> 36</a><a class="note-dropdown-item" href="#" data-value="50" role="listitem" aria-label="50"><i class="note-icon-menu-check"></i> 50</a><a class="note-dropdown-item" href="#" data-value="72" role="listitem" aria-label="72"><i class="note-icon-menu-check"></i> 72</a></div></div></div><div class="note-btn-group note-style"><button type="button" class="note-btn note-btn-bold" tabindex="-1" aria-label="Bold (CTRL+B)"><i class="note-icon-bold"></i></button><button type="button" class="note-btn note-btn-italic" tabindex="-1" aria-label="Italic (CTRL+I)"><i class="note-icon-italic"></i></button><button type="button" class="note-btn note-btn-underline" tabindex="-1" aria-label="Underline (CTRL+U)"><i class="note-icon-underline"></i></button><button type="button" class="note-btn note-btn-strikethrough" tabindex="-1" aria-label="Strikethrough (CTRL+SHIFT+S)"><i class="note-icon-strikethrough"></i></button><button type="button" class="note-btn" tabindex="-1" aria-label="Remove Font Style (CTRL+\)"><i class="note-icon-eraser"></i></button></div><div class="note-btn-group note-color"><div class="note-btn-group note-color note-color-fore"><button type="button" class="note-btn note-current-color-button" tabindex="-1" aria-label="Text Color" data-forecolor="#000000"><i class="note-icon-font note-recent-color" style="color: rgb(0, 0, 0);"></i></button><button type="button" class="note-btn dropdown-toggle" tabindex="-1" data-toggle="dropdown" aria-label="More Color"> <span class="note-icon-caret"></span></button><div class="note-dropdown-menu" role="list"><div class="note-palette"><div class="note-palette-title">Text Color</div><div><button type="button" class="note-color-reset btn btn-light btn-default" data-event="removeFormat" data-value="foreColor">Reset to default</button></div><div class="note-holder" data-event="foreColor"><!-- fore colors --><div class="note-color-palette"><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#000000" data-event="foreColor" data-value="#000000" data-title="Black" aria-label="Black" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#424242" data-event="foreColor" data-value="#424242" data-title="Tundora" aria-label="Tundora" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#636363" data-event="foreColor" data-value="#636363" data-title="Dove Gray" aria-label="Dove Gray" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9C9C94" data-event="foreColor" data-value="#9C9C94" data-title="Star Dust" aria-label="Star Dust" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEC6CE" data-event="foreColor" data-value="#CEC6CE" data-title="Pale Slate" aria-label="Pale Slate" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#EFEFEF" data-event="foreColor" data-value="#EFEFEF" data-title="Gallery" aria-label="Gallery" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#F7F7F7" data-event="foreColor" data-value="#F7F7F7" data-title="Alabaster" aria-label="Alabaster" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="White" aria-label="White" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#FF0000" data-event="foreColor" data-value="#FF0000" data-title="Red" aria-label="Red" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FF9C00" data-event="foreColor" data-value="#FF9C00" data-title="Orange Peel" aria-label="Orange Peel" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFF00" data-event="foreColor" data-value="#FFFF00" data-title="Yellow" aria-label="Yellow" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#00FF00" data-event="foreColor" data-value="#00FF00" data-title="Green" aria-label="Green" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#00FFFF" data-event="foreColor" data-value="#00FFFF" data-title="Cyan" aria-label="Cyan" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#0000FF" data-event="foreColor" data-value="#0000FF" data-title="Blue" aria-label="Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9C00FF" data-event="foreColor" data-value="#9C00FF" data-title="Electric Violet" aria-label="Electric Violet" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FF00FF" data-event="foreColor" data-value="#FF00FF" data-title="Magenta" aria-label="Magenta" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#F7C6CE" data-event="foreColor" data-value="#F7C6CE" data-title="Azalea" aria-label="Azalea" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFE7CE" data-event="foreColor" data-value="#FFE7CE" data-title="Karry" aria-label="Karry" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFEFC6" data-event="foreColor" data-value="#FFEFC6" data-title="Egg White" aria-label="Egg White" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6EFD6" data-event="foreColor" data-value="#D6EFD6" data-title="Zanah" aria-label="Zanah" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEDEE7" data-event="foreColor" data-value="#CEDEE7" data-title="Botticelli" aria-label="Botticelli" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEE7F7" data-event="foreColor" data-value="#CEE7F7" data-title="Tropical Blue" aria-label="Tropical Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6D6E7" data-event="foreColor" data-value="#D6D6E7" data-title="Mischka" aria-label="Mischka" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#E7D6DE" data-event="foreColor" data-value="#E7D6DE" data-title="Twilight" aria-label="Twilight" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#E79C9C" data-event="foreColor" data-value="#E79C9C" data-title="Tonys Pink" aria-label="Tonys Pink" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFC69C" data-event="foreColor" data-value="#FFC69C" data-title="Peach Orange" aria-label="Peach Orange" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFE79C" data-event="foreColor" data-value="#FFE79C" data-title="Cream Brulee" aria-label="Cream Brulee" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B5D6A5" data-event="foreColor" data-value="#B5D6A5" data-title="Sprout" aria-label="Sprout" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#A5C6CE" data-event="foreColor" data-value="#A5C6CE" data-title="Casper" aria-label="Casper" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9CC6EF" data-event="foreColor" data-value="#9CC6EF" data-title="Perano" aria-label="Perano" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B5A5D6" data-event="foreColor" data-value="#B5A5D6" data-title="Cold Purple" aria-label="Cold Purple" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6A5BD" data-event="foreColor" data-value="#D6A5BD" data-title="Careys Pink" aria-label="Careys Pink" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#E76363" data-event="foreColor" data-value="#E76363" data-title="Mandy" aria-label="Mandy" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#F7AD6B" data-event="foreColor" data-value="#F7AD6B" data-title="Rajah" aria-label="Rajah" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFD663" data-event="foreColor" data-value="#FFD663" data-title="Dandelion" aria-label="Dandelion" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#94BD7B" data-event="foreColor" data-value="#94BD7B" data-title="Olivine" aria-label="Olivine" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#73A5AD" data-event="foreColor" data-value="#73A5AD" data-title="Gulf Stream" aria-label="Gulf Stream" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#6BADDE" data-event="foreColor" data-value="#6BADDE" data-title="Viking" aria-label="Viking" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#8C7BC6" data-event="foreColor" data-value="#8C7BC6" data-title="Blue Marguerite" aria-label="Blue Marguerite" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#C67BA5" data-event="foreColor" data-value="#C67BA5" data-title="Puce" aria-label="Puce" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#CE0000" data-event="foreColor" data-value="#CE0000" data-title="Guardsman Red" aria-label="Guardsman Red" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#E79439" data-event="foreColor" data-value="#E79439" data-title="Fire Bush" aria-label="Fire Bush" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#EFC631" data-event="foreColor" data-value="#EFC631" data-title="Golden Dream" aria-label="Golden Dream" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#6BA54A" data-event="foreColor" data-value="#6BA54A" data-title="Chelsea Cucumber" aria-label="Chelsea Cucumber" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#4A7B8C" data-event="foreColor" data-value="#4A7B8C" data-title="Smalt Blue" aria-label="Smalt Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#3984C6" data-event="foreColor" data-value="#3984C6" data-title="Boston Blue" aria-label="Boston Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#634AA5" data-event="foreColor" data-value="#634AA5" data-title="Butterfly Bush" aria-label="Butterfly Bush" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#A54A7B" data-event="foreColor" data-value="#A54A7B" data-title="Cadillac" aria-label="Cadillac" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#9C0000" data-event="foreColor" data-value="#9C0000" data-title="Sangria" aria-label="Sangria" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B56308" data-event="foreColor" data-value="#B56308" data-title="Mai Tai" aria-label="Mai Tai" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#BD9400" data-event="foreColor" data-value="#BD9400" data-title="Buddha Gold" aria-label="Buddha Gold" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#397B21" data-event="foreColor" data-value="#397B21" data-title="Forest Green" aria-label="Forest Green" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#104A5A" data-event="foreColor" data-value="#104A5A" data-title="Eden" aria-label="Eden" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#085294" data-event="foreColor" data-value="#085294" data-title="Venice Blue" aria-label="Venice Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#311873" data-event="foreColor" data-value="#311873" data-title="Meteorite" aria-label="Meteorite" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#731842" data-event="foreColor" data-value="#731842" data-title="Claret" aria-label="Claret" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#630000" data-event="foreColor" data-value="#630000" data-title="Rosewood" aria-label="Rosewood" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#7B3900" data-event="foreColor" data-value="#7B3900" data-title="Cinnamon" aria-label="Cinnamon" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#846300" data-event="foreColor" data-value="#846300" data-title="Olive" aria-label="Olive" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#295218" data-event="foreColor" data-value="#295218" data-title="Parsley" aria-label="Parsley" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#083139" data-event="foreColor" data-value="#083139" data-title="Tiber" aria-label="Tiber" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#003163" data-event="foreColor" data-value="#003163" data-title="Midnight Blue" aria-label="Midnight Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#21104A" data-event="foreColor" data-value="#21104A" data-title="Valentino" aria-label="Valentino" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#4A1031" data-event="foreColor" data-value="#4A1031" data-title="Loulou" aria-label="Loulou" data-toggle="button" tabindex="-1"></button></div></div></div><div><button type="button" class="note-color-select btn btn-light btn-default" data-event="openPalette" data-value="foreColorPicker">Select</button><input type="color" id="foreColorPicker" class="note-btn note-color-select-btn" value="#000000" data-event="foreColorPalette"></div><div class="note-holder-custom" id="foreColorPalette" data-event="foreColor"><div class="note-color-palette"><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button></div></div></div></div></div></div><div class="note-btn-group note-color note-color-all"><button type="button" class="note-btn note-current-color-button" tabindex="-1" aria-label="Recent Color" data-backcolor="#FFFF00" data-forecolor="#000000"><i class="note-icon-font note-recent-color" style="background-color: rgb(255, 255, 0); color: rgb(0, 0, 0);"></i></button><button type="button" class="note-btn dropdown-toggle" tabindex="-1" data-toggle="dropdown" aria-label="More Color"> <span class="note-icon-caret"></span></button><div class="note-dropdown-menu" role="list"><div class="note-palette"><div class="note-palette-title">Background Color</div><div><button type="button" class="note-color-reset btn btn-light btn-default" data-event="backColor" data-value="transparent">Transparent</button></div><div class="note-holder" data-event="backColor"><!-- back colors --><div class="note-color-palette"><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#000000" data-event="backColor" data-value="#000000" data-title="Black" aria-label="Black" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#424242" data-event="backColor" data-value="#424242" data-title="Tundora" aria-label="Tundora" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#636363" data-event="backColor" data-value="#636363" data-title="Dove Gray" aria-label="Dove Gray" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9C9C94" data-event="backColor" data-value="#9C9C94" data-title="Star Dust" aria-label="Star Dust" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEC6CE" data-event="backColor" data-value="#CEC6CE" data-title="Pale Slate" aria-label="Pale Slate" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#EFEFEF" data-event="backColor" data-value="#EFEFEF" data-title="Gallery" aria-label="Gallery" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#F7F7F7" data-event="backColor" data-value="#F7F7F7" data-title="Alabaster" aria-label="Alabaster" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="White" aria-label="White" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#FF0000" data-event="backColor" data-value="#FF0000" data-title="Red" aria-label="Red" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FF9C00" data-event="backColor" data-value="#FF9C00" data-title="Orange Peel" aria-label="Orange Peel" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFF00" data-event="backColor" data-value="#FFFF00" data-title="Yellow" aria-label="Yellow" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#00FF00" data-event="backColor" data-value="#00FF00" data-title="Green" aria-label="Green" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#00FFFF" data-event="backColor" data-value="#00FFFF" data-title="Cyan" aria-label="Cyan" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#0000FF" data-event="backColor" data-value="#0000FF" data-title="Blue" aria-label="Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9C00FF" data-event="backColor" data-value="#9C00FF" data-title="Electric Violet" aria-label="Electric Violet" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FF00FF" data-event="backColor" data-value="#FF00FF" data-title="Magenta" aria-label="Magenta" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#F7C6CE" data-event="backColor" data-value="#F7C6CE" data-title="Azalea" aria-label="Azalea" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFE7CE" data-event="backColor" data-value="#FFE7CE" data-title="Karry" aria-label="Karry" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFEFC6" data-event="backColor" data-value="#FFEFC6" data-title="Egg White" aria-label="Egg White" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6EFD6" data-event="backColor" data-value="#D6EFD6" data-title="Zanah" aria-label="Zanah" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEDEE7" data-event="backColor" data-value="#CEDEE7" data-title="Botticelli" aria-label="Botticelli" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEE7F7" data-event="backColor" data-value="#CEE7F7" data-title="Tropical Blue" aria-label="Tropical Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6D6E7" data-event="backColor" data-value="#D6D6E7" data-title="Mischka" aria-label="Mischka" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#E7D6DE" data-event="backColor" data-value="#E7D6DE" data-title="Twilight" aria-label="Twilight" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#E79C9C" data-event="backColor" data-value="#E79C9C" data-title="Tonys Pink" aria-label="Tonys Pink" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFC69C" data-event="backColor" data-value="#FFC69C" data-title="Peach Orange" aria-label="Peach Orange" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFE79C" data-event="backColor" data-value="#FFE79C" data-title="Cream Brulee" aria-label="Cream Brulee" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B5D6A5" data-event="backColor" data-value="#B5D6A5" data-title="Sprout" aria-label="Sprout" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#A5C6CE" data-event="backColor" data-value="#A5C6CE" data-title="Casper" aria-label="Casper" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9CC6EF" data-event="backColor" data-value="#9CC6EF" data-title="Perano" aria-label="Perano" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B5A5D6" data-event="backColor" data-value="#B5A5D6" data-title="Cold Purple" aria-label="Cold Purple" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6A5BD" data-event="backColor" data-value="#D6A5BD" data-title="Careys Pink" aria-label="Careys Pink" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#E76363" data-event="backColor" data-value="#E76363" data-title="Mandy" aria-label="Mandy" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#F7AD6B" data-event="backColor" data-value="#F7AD6B" data-title="Rajah" aria-label="Rajah" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFD663" data-event="backColor" data-value="#FFD663" data-title="Dandelion" aria-label="Dandelion" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#94BD7B" data-event="backColor" data-value="#94BD7B" data-title="Olivine" aria-label="Olivine" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#73A5AD" data-event="backColor" data-value="#73A5AD" data-title="Gulf Stream" aria-label="Gulf Stream" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#6BADDE" data-event="backColor" data-value="#6BADDE" data-title="Viking" aria-label="Viking" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#8C7BC6" data-event="backColor" data-value="#8C7BC6" data-title="Blue Marguerite" aria-label="Blue Marguerite" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#C67BA5" data-event="backColor" data-value="#C67BA5" data-title="Puce" aria-label="Puce" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#CE0000" data-event="backColor" data-value="#CE0000" data-title="Guardsman Red" aria-label="Guardsman Red" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#E79439" data-event="backColor" data-value="#E79439" data-title="Fire Bush" aria-label="Fire Bush" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#EFC631" data-event="backColor" data-value="#EFC631" data-title="Golden Dream" aria-label="Golden Dream" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#6BA54A" data-event="backColor" data-value="#6BA54A" data-title="Chelsea Cucumber" aria-label="Chelsea Cucumber" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#4A7B8C" data-event="backColor" data-value="#4A7B8C" data-title="Smalt Blue" aria-label="Smalt Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#3984C6" data-event="backColor" data-value="#3984C6" data-title="Boston Blue" aria-label="Boston Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#634AA5" data-event="backColor" data-value="#634AA5" data-title="Butterfly Bush" aria-label="Butterfly Bush" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#A54A7B" data-event="backColor" data-value="#A54A7B" data-title="Cadillac" aria-label="Cadillac" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#9C0000" data-event="backColor" data-value="#9C0000" data-title="Sangria" aria-label="Sangria" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B56308" data-event="backColor" data-value="#B56308" data-title="Mai Tai" aria-label="Mai Tai" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#BD9400" data-event="backColor" data-value="#BD9400" data-title="Buddha Gold" aria-label="Buddha Gold" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#397B21" data-event="backColor" data-value="#397B21" data-title="Forest Green" aria-label="Forest Green" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#104A5A" data-event="backColor" data-value="#104A5A" data-title="Eden" aria-label="Eden" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#085294" data-event="backColor" data-value="#085294" data-title="Venice Blue" aria-label="Venice Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#311873" data-event="backColor" data-value="#311873" data-title="Meteorite" aria-label="Meteorite" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#731842" data-event="backColor" data-value="#731842" data-title="Claret" aria-label="Claret" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#630000" data-event="backColor" data-value="#630000" data-title="Rosewood" aria-label="Rosewood" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#7B3900" data-event="backColor" data-value="#7B3900" data-title="Cinnamon" aria-label="Cinnamon" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#846300" data-event="backColor" data-value="#846300" data-title="Olive" aria-label="Olive" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#295218" data-event="backColor" data-value="#295218" data-title="Parsley" aria-label="Parsley" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#083139" data-event="backColor" data-value="#083139" data-title="Tiber" aria-label="Tiber" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#003163" data-event="backColor" data-value="#003163" data-title="Midnight Blue" aria-label="Midnight Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#21104A" data-event="backColor" data-value="#21104A" data-title="Valentino" aria-label="Valentino" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#4A1031" data-event="backColor" data-value="#4A1031" data-title="Loulou" aria-label="Loulou" data-toggle="button" tabindex="-1"></button></div></div></div><div><button type="button" class="note-color-select btn btn-light btn-default" data-event="openPalette" data-value="backColorPicker">Select</button><input type="color" id="backColorPicker" class="note-btn note-color-select-btn" value="#FFFF00" data-event="backColorPalette"></div><div class="note-holder-custom" id="backColorPalette" data-event="backColor"><div class="note-color-palette"><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="backColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button></div></div></div></div><div class="note-palette"><div class="note-palette-title">Text Color</div><div><button type="button" class="note-color-reset btn btn-light btn-default" data-event="removeFormat" data-value="foreColor">Reset to default</button></div><div class="note-holder" data-event="foreColor"><!-- fore colors --><div class="note-color-palette"><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#000000" data-event="foreColor" data-value="#000000" data-title="Black" aria-label="Black" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#424242" data-event="foreColor" data-value="#424242" data-title="Tundora" aria-label="Tundora" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#636363" data-event="foreColor" data-value="#636363" data-title="Dove Gray" aria-label="Dove Gray" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9C9C94" data-event="foreColor" data-value="#9C9C94" data-title="Star Dust" aria-label="Star Dust" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEC6CE" data-event="foreColor" data-value="#CEC6CE" data-title="Pale Slate" aria-label="Pale Slate" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#EFEFEF" data-event="foreColor" data-value="#EFEFEF" data-title="Gallery" aria-label="Gallery" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#F7F7F7" data-event="foreColor" data-value="#F7F7F7" data-title="Alabaster" aria-label="Alabaster" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="White" aria-label="White" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#FF0000" data-event="foreColor" data-value="#FF0000" data-title="Red" aria-label="Red" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FF9C00" data-event="foreColor" data-value="#FF9C00" data-title="Orange Peel" aria-label="Orange Peel" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFF00" data-event="foreColor" data-value="#FFFF00" data-title="Yellow" aria-label="Yellow" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#00FF00" data-event="foreColor" data-value="#00FF00" data-title="Green" aria-label="Green" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#00FFFF" data-event="foreColor" data-value="#00FFFF" data-title="Cyan" aria-label="Cyan" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#0000FF" data-event="foreColor" data-value="#0000FF" data-title="Blue" aria-label="Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9C00FF" data-event="foreColor" data-value="#9C00FF" data-title="Electric Violet" aria-label="Electric Violet" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FF00FF" data-event="foreColor" data-value="#FF00FF" data-title="Magenta" aria-label="Magenta" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#F7C6CE" data-event="foreColor" data-value="#F7C6CE" data-title="Azalea" aria-label="Azalea" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFE7CE" data-event="foreColor" data-value="#FFE7CE" data-title="Karry" aria-label="Karry" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFEFC6" data-event="foreColor" data-value="#FFEFC6" data-title="Egg White" aria-label="Egg White" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6EFD6" data-event="foreColor" data-value="#D6EFD6" data-title="Zanah" aria-label="Zanah" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEDEE7" data-event="foreColor" data-value="#CEDEE7" data-title="Botticelli" aria-label="Botticelli" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#CEE7F7" data-event="foreColor" data-value="#CEE7F7" data-title="Tropical Blue" aria-label="Tropical Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6D6E7" data-event="foreColor" data-value="#D6D6E7" data-title="Mischka" aria-label="Mischka" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#E7D6DE" data-event="foreColor" data-value="#E7D6DE" data-title="Twilight" aria-label="Twilight" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#E79C9C" data-event="foreColor" data-value="#E79C9C" data-title="Tonys Pink" aria-label="Tonys Pink" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFC69C" data-event="foreColor" data-value="#FFC69C" data-title="Peach Orange" aria-label="Peach Orange" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFE79C" data-event="foreColor" data-value="#FFE79C" data-title="Cream Brulee" aria-label="Cream Brulee" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B5D6A5" data-event="foreColor" data-value="#B5D6A5" data-title="Sprout" aria-label="Sprout" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#A5C6CE" data-event="foreColor" data-value="#A5C6CE" data-title="Casper" aria-label="Casper" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#9CC6EF" data-event="foreColor" data-value="#9CC6EF" data-title="Perano" aria-label="Perano" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B5A5D6" data-event="foreColor" data-value="#B5A5D6" data-title="Cold Purple" aria-label="Cold Purple" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#D6A5BD" data-event="foreColor" data-value="#D6A5BD" data-title="Careys Pink" aria-label="Careys Pink" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#E76363" data-event="foreColor" data-value="#E76363" data-title="Mandy" aria-label="Mandy" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#F7AD6B" data-event="foreColor" data-value="#F7AD6B" data-title="Rajah" aria-label="Rajah" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFD663" data-event="foreColor" data-value="#FFD663" data-title="Dandelion" aria-label="Dandelion" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#94BD7B" data-event="foreColor" data-value="#94BD7B" data-title="Olivine" aria-label="Olivine" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#73A5AD" data-event="foreColor" data-value="#73A5AD" data-title="Gulf Stream" aria-label="Gulf Stream" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#6BADDE" data-event="foreColor" data-value="#6BADDE" data-title="Viking" aria-label="Viking" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#8C7BC6" data-event="foreColor" data-value="#8C7BC6" data-title="Blue Marguerite" aria-label="Blue Marguerite" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#C67BA5" data-event="foreColor" data-value="#C67BA5" data-title="Puce" aria-label="Puce" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#CE0000" data-event="foreColor" data-value="#CE0000" data-title="Guardsman Red" aria-label="Guardsman Red" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#E79439" data-event="foreColor" data-value="#E79439" data-title="Fire Bush" aria-label="Fire Bush" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#EFC631" data-event="foreColor" data-value="#EFC631" data-title="Golden Dream" aria-label="Golden Dream" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#6BA54A" data-event="foreColor" data-value="#6BA54A" data-title="Chelsea Cucumber" aria-label="Chelsea Cucumber" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#4A7B8C" data-event="foreColor" data-value="#4A7B8C" data-title="Smalt Blue" aria-label="Smalt Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#3984C6" data-event="foreColor" data-value="#3984C6" data-title="Boston Blue" aria-label="Boston Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#634AA5" data-event="foreColor" data-value="#634AA5" data-title="Butterfly Bush" aria-label="Butterfly Bush" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#A54A7B" data-event="foreColor" data-value="#A54A7B" data-title="Cadillac" aria-label="Cadillac" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#9C0000" data-event="foreColor" data-value="#9C0000" data-title="Sangria" aria-label="Sangria" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#B56308" data-event="foreColor" data-value="#B56308" data-title="Mai Tai" aria-label="Mai Tai" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#BD9400" data-event="foreColor" data-value="#BD9400" data-title="Buddha Gold" aria-label="Buddha Gold" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#397B21" data-event="foreColor" data-value="#397B21" data-title="Forest Green" aria-label="Forest Green" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#104A5A" data-event="foreColor" data-value="#104A5A" data-title="Eden" aria-label="Eden" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#085294" data-event="foreColor" data-value="#085294" data-title="Venice Blue" aria-label="Venice Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#311873" data-event="foreColor" data-value="#311873" data-title="Meteorite" aria-label="Meteorite" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#731842" data-event="foreColor" data-value="#731842" data-title="Claret" aria-label="Claret" data-toggle="button" tabindex="-1"></button></div><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#630000" data-event="foreColor" data-value="#630000" data-title="Rosewood" aria-label="Rosewood" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#7B3900" data-event="foreColor" data-value="#7B3900" data-title="Cinnamon" aria-label="Cinnamon" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#846300" data-event="foreColor" data-value="#846300" data-title="Olive" aria-label="Olive" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#295218" data-event="foreColor" data-value="#295218" data-title="Parsley" aria-label="Parsley" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#083139" data-event="foreColor" data-value="#083139" data-title="Tiber" aria-label="Tiber" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#003163" data-event="foreColor" data-value="#003163" data-title="Midnight Blue" aria-label="Midnight Blue" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#21104A" data-event="foreColor" data-value="#21104A" data-title="Valentino" aria-label="Valentino" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#4A1031" data-event="foreColor" data-value="#4A1031" data-title="Loulou" aria-label="Loulou" data-toggle="button" tabindex="-1"></button></div></div></div><div><button type="button" class="note-color-select btn btn-light btn-default" data-event="openPalette" data-value="foreColorPicker">Select</button><input type="color" id="foreColorPicker" class="note-btn note-color-select-btn" value="#000000" data-event="foreColorPalette"></div><div class="note-holder-custom" id="foreColorPalette" data-event="foreColor"><div class="note-color-palette"><div class="note-color-row"><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button><button type="button" class="note-btn note-color-btn" style="background-color:#FFFFFF" data-event="foreColor" data-value="#FFFFFF" data-title="#FFFFFF" aria-label="#FFFFFF" data-toggle="button" tabindex="-1"></button></div></div></div></div></div></div></div><div class="note-btn-group note-insert"><button type="button" class="note-btn" tabindex="-1" aria-label="Picture"><i class="note-icon-picture"></i></button></div></div><div class="note-editing-area"><div class="note-handle"><div class="note-control-selection" style="display: none;"><div class="note-control-selection-bg"></div><div class="note-control-holder note-control-nw"></div><div class="note-control-holder note-control-ne"></div><div class="note-control-holder note-control-sw"></div><div class="note-control-sizing note-control-se"></div><div class="note-control-selection-info"></div></div></div><textarea class="note-codable" aria-multiline="true"></textarea><div class="note-editable" contenteditable="true" role="textbox" aria-multiline="true" spellcheck="true" autocorrect="true" style="height: 300px;"><p><br></p></div></div><output class="note-status-output" role="status" aria-live="polite"></output><div class="note-statusbar" role="status"><div class="note-resizebar" aria-label="resize"><div class="note-icon-bar"></div><div class="note-icon-bar"></div><div class="note-icon-bar"></div></div></div><div class="note-modal link-dialog" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Insert Link"><div class="note-modal-content"><div class="note-modal-header"><button type="button" class="close" aria-label="Close" aria-hidden="true"><i class="note-icon-close"></i></button><h4 class="note-modal-title">Insert Link</h4></div><div class="note-modal-body"><div class="form-group note-form-group"><label for="note-dialog-link-txt-16813613637081" class="note-form-label">Text to display</label><input id="note-dialog-link-txt-16813613637081" class="note-link-text form-control note-form-control note-input" type="text"></div><div class="form-group note-form-group"><label for="note-dialog-link-url-16813613637081" class="note-form-label">To what URL should this link go?</label><input id="note-dialog-link-url-16813613637081" class="note-link-url form-control note-form-control note-input" type="text" value="http://"></div><div class="checkbox sn-checkbox-open-in-new-window"><label><input role="checkbox" type="checkbox" checked="" aria-checked="true">Open in new window</label></div><div class="checkbox sn-checkbox-use-protocol"><label><input role="checkbox" type="checkbox" checked="" aria-checked="true">Use default protocol</label></div></div><div class="note-modal-footer"><input type="button" href="#" class="btn btn-primary note-btn note-btn-primary note-link-btn" value="Insert Link" disabled=""></div></div></div><div class="note-popover bottom note-link-popover" style="display: none;"><div class="note-popover-arrow"></div><div class="popover-content note-children-container"><span><a target="_blank"></a>&nbsp;</span><div class="note-btn-group note-link"><button type="button" class="note-btn" tabindex="-1" aria-label="Edit"><i class="note-icon-link"></i></button><button type="button" class="note-btn" tabindex="-1" aria-label="Unlink"><i class="note-icon-chain-broken"></i></button></div></div></div><div class="note-modal" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Insert Image"><div class="note-modal-content"><div class="note-modal-header"><button type="button" class="close" aria-label="Close" aria-hidden="true"><i class="note-icon-close"></i></button><h4 class="note-modal-title">Insert Image</h4></div><div class="note-modal-body"><div class="form-group note-form-group note-group-select-from-files"><label for="note-dialog-image-file-16813613637081" class="note-form-label">Select from files</label><input id="note-dialog-image-file-16813613637081" class="note-image-input form-control-file note-form-control note-input" type="file" name="files" accept="image/*" multiple="multiple"></div><div class="form-group note-group-image-url"><label for="note-dialog-image-url-16813613637081" class="note-form-label">Image URL</label><input id="note-dialog-image-url-16813613637081" class="note-image-url form-control note-form-control note-input" type="text"></div></div><div class="note-modal-footer"><input type="button" href="#" class="btn btn-primary note-btn note-btn-primary note-image-btn" value="Insert Image" disabled=""></div></div></div><div class="note-popover bottom note-image-popover" style="display: none;"><div class="note-popover-arrow"></div><div class="popover-content note-children-container"><div class="note-btn-group note-resize"><button type="button" class="note-btn" tabindex="-1" aria-label="Resize full"><span class="note-fontsize-10">100%</span></button><button type="button" class="note-btn" tabindex="-1" aria-label="Resize half"><span class="note-fontsize-10">50%</span></button><button type="button" class="note-btn" tabindex="-1" aria-label="Resize quarter"><span class="note-fontsize-10">25%</span></button><button type="button" class="note-btn" tabindex="-1" aria-label="Original size"><i class="note-icon-rollback"></i></button></div><div class="note-btn-group note-float"><button type="button" class="note-btn" tabindex="-1" aria-label="Float Left"><i class="note-icon-float-left"></i></button><button type="button" class="note-btn" tabindex="-1" aria-label="Float Right"><i class="note-icon-float-right"></i></button><button type="button" class="note-btn" tabindex="-1" aria-label="Remove float"><i class="note-icon-rollback"></i></button></div><div class="note-btn-group note-remove"><button type="button" class="note-btn" tabindex="-1" aria-label="Remove Image"><i class="note-icon-trash"></i></button></div></div></div><div class="note-popover bottom note-table-popover" style="display: none;"><div class="note-popover-arrow"></div><div class="popover-content note-children-container"><div class="note-btn-group note-add"><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Add row below"><i class="note-icon-row-below"></i></button><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Add row above"><i class="note-icon-row-above"></i></button><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Add column left"><i class="note-icon-col-before"></i></button><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Add column right"><i class="note-icon-col-after"></i></button></div><div class="note-btn-group note-delete"><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Delete row"><i class="note-icon-row-remove"></i></button><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Delete column"><i class="note-icon-col-remove"></i></button><button type="button" class="note-btn btn-md" tabindex="-1" aria-label="Delete table"><i class="note-icon-trash"></i></button></div></div></div><div class="note-modal" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Insert Video"><div class="note-modal-content"><div class="note-modal-header"><button type="button" class="close" aria-label="Close" aria-hidden="true"><i class="note-icon-close"></i></button><h4 class="note-modal-title">Insert Video</h4></div><div class="note-modal-body"><div class="form-group note-form-group row-fluid"><label for="note-dialog-video-url-16813613637081" class="note-form-label">Video URL <small class="text-muted">(YouTube, Vimeo, Vine, Instagram, DailyMotion or Youku)</small></label><input id="note-dialog-video-url-16813613637081" class="note-video-url form-control note-form-control note-input" type="text"></div></div><div class="note-modal-footer"><input type="button" href="#" class="btn btn-primary note-btn note-btn-primary note-video-btn" value="Insert Video" disabled=""></div></div></div><div class="note-modal" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Help"><div class="note-modal-content"><div class="note-modal-header"><button type="button" class="close" aria-label="Close" aria-hidden="true"><i class="note-icon-close"></i></button><h4 class="note-modal-title">Help</h4></div><div class="note-modal-body" style="max-height: 300px; overflow: scroll;"><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>ESC</kbd></label><span>Escape</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>ENTER</kbd></label><span>Insert Paragraph</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+Z</kbd></label><span>Undo the last command</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+Y</kbd></label><span>Redo the last command</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>TAB</kbd></label><span>Tab</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>SHIFT+TAB</kbd></label><span>Untab</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+B</kbd></label><span>Set a bold style</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+I</kbd></label><span>Set a italic style</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+U</kbd></label><span>Set a underline style</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+S</kbd></label><span>Set a strikethrough style</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+BACKSLASH</kbd></label><span>Clean a style</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+L</kbd></label><span>Set left align</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+E</kbd></label><span>Set center align</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+R</kbd></label><span>Set right align</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+J</kbd></label><span>Set full align</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+NUM7</kbd></label><span>Toggle unordered list</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+SHIFT+NUM8</kbd></label><span>Toggle ordered list</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+LEFTBRACKET</kbd></label><span>Outdent on current paragraph</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+RIGHTBRACKET</kbd></label><span>Indent on current paragraph</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM0</kbd></label><span>Change current block's format as a paragraph(P tag)</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM1</kbd></label><span>Change current block's format as H1</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM2</kbd></label><span>Change current block's format as H2</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM3</kbd></label><span>Change current block's format as H3</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM4</kbd></label><span>Change current block's format as H4</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM5</kbd></label><span>Change current block's format as H5</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+NUM6</kbd></label><span>Change current block's format as H6</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+ENTER</kbd></label><span>Insert horizontal rule</span><div class="help-list-item"></div><label style="width: 180px; margin-right: 10px;"><kbd>CTRL+K</kbd></label><span>Show Link Dialog</span></div><div class="note-modal-footer"><p class="text-center"><a href="http://summernote.org/" target="_blank">Summernote 0.8.18</a> · <a href="https://github.com/summernote/summernote" target="_blank">Project</a> · <a href="https://github.com/summernote/summernote/issues" target="_blank">Issues</a></p></div></div></div></div>         
	         		</div>
		         	 
			   	</div> 
		    </div>	
		</main>
			<footer class="pt-5 my-5 text-muted border-top">
		  		<div class="mb-5">
			      <a href="javascript:void(0);" onclick="confirmBack();" class="btn btn-warning btn-lg px-4 text text-white">취소</a>
			      <button class="btn btn-primary btn-lg px-4 text text-white addBtn" type="submit">글 등록</button>
		  		</div>
			</footer>
		</form>  	
	</div> --%>





<%@include file="../include/footer.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b383d5cd72a2f6c17df1bc2be653f54&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 엔터로 장소를 검색합니다
$('#keyword').on("keypress", function(){
	if(event.keyCode == 13) {
		searchPlaces();
	}
})

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span onclick="addPlace(\''+places.road_address_name+'\',\''+places.place_name+'\')">' + places.road_address_name + '</span>' +
                    '   <span onclick="addPlace(\''+places.address_name+'\',\''+places.place_name+'\')" class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span onclick="addPlace(\''+places.address_name+'\',\''+places.place_name+'\')">' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
// 장소 클릭 시 주소 폼에 삽입
function addPlace(address, place) {   
    $("#place").val(place)
    $("#address").val(address)
}
</script>

<script>
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">주소 정보</span>' + 
                            detailAddr + 
                        '</div>';
		
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
            // 폼에 입력 함
            var address = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name
    		$("#address").val(address);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>

<script>
  $('#summernote').summernote({
    placeholder: '',
    tabsize: 2,
    height: 120,
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
  });
</script>

<script>
var SeatInfoList = null;
var seatInfoformData = '';

Array.matrix = function (m, n, initial) {
    var a, i, j, mat = [];
    for (i = 0; i < m; i += 1) {
        a = [];
        for (j = 0; j < n; j += 1) {
            a[j] = initial;
        }
        mat[i] = a;
    }
    return mat;
};

function addSeatInfoForm(x, y) {
	seatInfoformData = ''
	for (var i = 0; i < y; i++) {
		seatInfoformData += (i == 0)
		? ''
		: ' '
		for (var j = 0; j < x; j++) {
			seatInfoformData += (j == 0)
			? '' + SeatInfoList[i][j]
			: ',' + SeatInfoList[i][j]
		}
	}
	console.log(seatInfoformData)
	//$("#seatinfo").val(formData);
}

function errorsSeatTable() {
	console.log('validation');
	var seatinfo = '['+$("#seatinfo").val()+']';
	var seatNum = 1;
	
	var y = seatinfo.split(" ").length;
	var row = seatinfo.split(" ");
	var x = row[0].split(",").length;
	SeatInfoList = Array.matrix(y, x, 1);
	$("#seatX").val(x)
	$("#seatY").val(y)
	
	for (var i = 0; i < y; i++) {
		var col = row[i].split(",");
		for (var j = 0; j < x; j++) {
			SeatInfoList[i][j] = col[j] == 1 ? 1 : 0;
		}
	}
}

createSeatTable();
function createSeatTable() {
	var seatNum = 1
	var x = $("#seatX").val()
	var y = $("#seatY").val()
	
	console.log($("#seatinfo").val());
	if ($("#seatinfo").val() != '') {
		errorsSeatTable();
		x = $("#seatX").val()
		y = $("#seatY").val()
	} else {
		SeatInfoList = Array.matrix(y, x, 1);
		addSeatInfoForm(x, y)
		console.log(SeatInfoList)		
	}
	
	
	var seatTable = ""
	if (!isNaN(x) && !isNaN(y)) {
		for (var i = 0; i < y; i++) {
			seatTable += '<tr>' 
			for (var j = 0; j < x; j++) {
				if (SeatInfoList[i][j] != 0) {
					seatTable += '<td class="seat" onclick="changeSeatState(this)" data-x="'+j+'" data-y="'+i+'">'+seatNum+'</td>';
					seatNum++;
				} else {
					seatTable += '<td class="seat-disable" onclick="changeSeatState(this)" data-x="'+j+'" data-y="'+i+'"></td>';
				}
			}
			seatTable += '</tr>'
		}
		$("#seatTable").html(seatTable)
	}
}
function changeSeatState(seat) {
	$(seat).hasClass("seat")
		? disableSeat(seat)
		: enableSeat(seat)
}
function disableSeat(seat) {
	$(seat).removeClass("seat")
		.addClass("seat-disable")
		.html('');
	
	SeatInfoList[$(seat).data('y')][$(seat).data('x')] = 0
	addSeatInfoForm($("#seatX").val(), $("#seatY").val())
	
	console.log(SeatInfoList)
	var seatNum = 1;
	var seatList = document.querySelectorAll('.seat');
	seatList.forEach(function(s) {
		$(s).html(seatNum++);
	});
}
function enableSeat(seat) {
	$(seat).removeClass("seat-disable")
		.addClass("seat");
	
	SeatInfoList[$(seat).data('y')][$(seat).data('x')] = 1
	addSeatInfoForm($("#seatX").val(), $("#seatY").val())
	
	console.log(SeatInfoList)
	var seatNum = 1;
	var seatList = document.querySelectorAll('.seat');
	seatList.forEach(function(s) {
		$(s).html(seatNum++);
	});
}

$("#seatX").on("blur", function() {
	checkMinMaxRange("#seatX")
	
});
$("#seatY").on("blur", function() {
	checkMinMaxRange("#seatY")
});

function checkMinMaxRange(TagNameById) {
	var tag = $(TagNameById)
	var min = Number(tag.attr('min'));
	var max = Number(tag.attr('max'));
	if (!isNaN(tag.val())) {
		if (Number(tag.val()) < min) {
			tag.val(min)
		} else if (Number(tag.val()) > max) {
			tag.val(max)
		}
	}
}

$("#submitBtn").on('click', function() {
	if (seatInfoformData != '') {
		$("#seatinfo").val(seatInfoformData);
		console.log($("#seatinfo").val());
	}
	$("#postFrm").submit();
});

$("#seatTableBtn").on('click', function() {
	$("#seatinfo").val('');
	createSeatTable();
});

</script>
<script>
//현재 날짜와 시간을 가져옵니다.
$(function() {
	var date = new Date().toISOString().slice(0, -8);

	// 입력 필드의 min 속성을 설정합니다.
	$("#sdate").val(date)
	$("#sdate").attr('min', date);
	$("#edate").val(date)
	$("#edate").attr('min', date);
});

$("#sdate").on('change', function() {
	$("#edate").attr('min', $("#sdate").val());
	$("#edate").val($("#sdate").val())
});
</script>
</body>
</html>
