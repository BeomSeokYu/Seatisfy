<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

.seat-reserve {
  text-align: center;
  border: 1px solid #444444;
  background-color: #0067a3;
}

.seat-reserved-db {
  text-align: center;
  border: 1px solid #444444;
  background-color: #FF6347;
}

.seat-reserved-mine {
  text-align: center;
  border: 1px solid #444444;
  background-color: #B0FF66;
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
.text-of {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.text-table th,
.text-table td{
	font-size: 80%;
}
</style>
<body>
<%@include file="../include/navbar.jsp"%>
<div class="container">
	<div class="container mb-3">
		<div class="row justify-content-center">
			<h2>예약</h2>
			<%-- <div class="col-lg-3 d-none d-lg-block">
				<%@ include file="/include/sidebar4.jsp"%>
			</div> --%>
			<div>
				<form:form action="/reserve/detail/${ post.pno }" method="post" modelAttribute="reserDTO" id="reserFrm">
					<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
					<form:errors path="seatnum"/>
		   			<form:hidden path="seatnum" id="seatnum"/>
					<form:hidden path="pno" value="${ post.pno }"/>
		   		</form:form>
				<table class="table text-nowrap table-bordered text-table">
					<tr class="row">
						<th class="col-sm-1 text-center table-light text-of">제목</th>
						<td class="col-sm-4 text-of">${ post.ptitle }</td>
						<th class="col-sm-1 text-center table-light text-of">작성자</th>
						<td class="col-sm-2 text-of">${ name }</td>
						<th class="col-sm-1 text-center table-light text-of">등록일</th>
						<td class="col-sm-3 text-of">${ post.regdate }</td>
					</tr>
					<tr class="row">
						<th class="col-sm-1 text-center table-light text-of">장소</th>
						<td class="col-sm-4 text-of">${ post.place }</td>
						<th class="col-sm-1 text-center table-light text-of">주소</th>
						<td class="col-sm-6 text-of" colspan="3">${ post.address }</td>
					</tr>
					<tr class="row">
						<th class="col-sm-2 text-center table-light text-of">예약 가능 시간</th>
						<td class="col-sm-6 text-of" colspan="3">${fn:replace(post.startdate, 'T', ' ')} ~ ${fn:replace(post.enddate, 'T', ' ')}</td>
						<th class="col-sm-2 text-center table-light text-of" colspan="1">진행 상태</th>
						<td class="col-sm-2 text-of" colspan="1" id="status"></td>
					</tr>
				</table>

				<div class="py-3 px-5">
					<div class="text-lg">
						<p class="text-lg" style="width: 100%">${ post.pcontent }</p>
						<!-- <p id="ncontent"></p> -->
					</div>
				</div>
				<!-- 이미지 지도를 표시할 div 입니다 -->
				<div class="row">
					<div class="col-sm-6" id="map" style="width:50%;height:350px;"></div>
					<div class="col-sm-6 table-responsive">
						<table class="table" id="seatMiniTable" style="width:100%;height:100%;">
			      		</table>
		      		</div>
	      		</div>
			</div>
			<!-- <div class="col-lg-9"> -->
			<div class="col-lg-12 text-center mt-5">
			<c:choose>
				<c:when test="${ myreser != null }">
					<button class="btn btn-info btn-lg" type="button" id="showReserveBtn">예약확인</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-danger btn-lg" type="button" id="showReserveBtn">예약하기</button>
				</c:otherwise>
			</c:choose>
				<a class="btn btn-secondary btn-lg" href="/reserve">목록보기</a>
			</div>
			<div class="col-lg-12 text-center mt-5">
			<c:choose>
				<c:when test="${ post.pwriter == username }">
					<button class="btn btn-info btn-lg" type="button" id="editBtn">수정하기</button>
					<button class="btn btn-danger btn-lg" type="button" id="removeBtn">삭제하기</button>
				</c:when>
			</c:choose>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>

<!-- Modal -->
<div class="modal fade" id="postModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5">예약</h1>
      </div>
      <div class="modal-body">
      	<h5 class="modal-title">예약 좌석 선택</h5>
      	<div class="table-responsive">
	      	<table class="table table-fixed" id="seatTable">
	      	</table>
      	</div>
      </div>
      <div class="modal-footer text-center justify-content-center">
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <c:choose>
			<c:when test="${ myreser != null }">
				<button type="button" class="btn btn-warning" id="reserveCancelBtn">예약 취소</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-warning" id="reserveBtn">예약</button>
			</c:otherwise>
		</c:choose>
      </div>
    </div>
  </div>
</div>
<%@include file="../include/scriptUtil.jsp"%>
<script>
onload = function() {
	switch ('${param.result}') {
	  case 'success':
	  	popModal('예약 성공', '예약에 성공했습니다');
	    break;
	  case 'fail':
	  	popModal('예약 실패', '작성자는 예약이 불가능합니다');
	    break;
	  case 'dupli':
	  	popModal('중복 예약 불가', '이미 예약된 회원입니다 <br> 자리 변경을 원하시면 취소 후 다시 이용해 주세요');
	    break;
	  case 'ccsuccess':
	  	popModal('예약 취소 성공', '예약이 취소되었습니다');
	    break;
	  case 'ccfail':
	  	popModal('예약 취소 실패', '예약 취소에 실패하였습니다');
	  case 'nosn':
	  	popModal('좌석 미선택', '예약할 좌석을 선택해 주세요');
	    break;
	}
	$('#status').html(getDateStatus('${post.startdate}', '${post.enddate}'));
}

function getDateStatus(sdate, edate) {
	const now = new Date(); // 현재 시각
	const startDateTime = new Date(sdate); // 시작일시를 Date 객체로 변환
	const endDateTime = new Date(edate); // 종료일시를 Date 객체로 변환

	if (now.getTime() < startDateTime.getTime()) {
		return '시작 전';
	} else if (now.getTime() >= startDateTime.getTime() && now.getTime() <= endDateTime.getTime()) {
		return '진행중';
	} else {
		return '종료';
	}
}

$("#showReserveBtn").on("click", function() {
	fetch("/reser/isReserve", {
		method: "post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
			'X-CSRF-TOKEN': '${ _csrf.token }'
		},
		body: new URLSearchParams({
			pno: ${ post.pno }
		})})
		.then(resp => resp.text())
		.then(data => {
			data.trim()
			console.log(data);
			if (data == 'true') {
				$('#postModal').modal('show');				
			} else {
				alert('예약 가능 기간이 아닙니다')
			}
		})
});

$("#reserveBtn").on("click", function() {
	//action="/reserve/detail/${ post.pno }"
	$('#reserFrm').attr('action', "/reserve/detail/${ post.pno }")
	$('#reserFrm').submit();
});

$("#reserveCancelBtn").on("click", function() {
	$('#reserFrm').attr('action', "/reserve/detail/${ post.pno }/cancel")
	$('#reserFrm').submit();
});

$("#editBtn").on("click", function() {
	location.href = '/reserve/edit/${post.pno}';
});

$("#removeBtn").on("click", function() {
	if(confirm('정말로 삭제하시겠습니까?')) {
		fetch("/reserve/remove", {
			method: "post",
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
				'X-CSRF-TOKEN': '${ _csrf.token }'
			},
			body: new URLSearchParams({
				pno: ${ post.pno }
			})})
			.then(resp => resp.text())
			.then(data => {
				data.trim()
				console.log(data);
				location.href = data;
			})
	}
});

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=앱키&libraries=services"></script>
<script>   
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${ post.address }', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
	
	   var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	   // 결과값으로 받은 위치를 마커로 표시합니다
	   var marker = new kakao.maps.Marker({
	       map: map,
	       position: coords
	   });
	
	   // 인포윈도우로 장소에 대한 설명을 표시합니다
	   var infowindow = new kakao.maps.InfoWindow({
	       content: '<div style="width:200px;text-align:center;padding:6px 0;">${ post.place }</div>'
	   });
	   infowindow.open(map, marker);
	
	   // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	   map.setCenter(coords);
	} else {
		// 인포윈도우로 장소에 대한 설명을 표시합니다
		   var infowindow = new kakao.maps.InfoWindow({
		       content: '<div style="width:200px;text-align:center;padding:6px 0;">해당 주소에 대한 지도 정보가 없습니다</div>'
		   });
		   infowindow.open(map, marker);
	}
});
</script>

<script>
var SeatInfoList = null;
var reservationSeat = -1;
var reservedSeatList = ${ seats };

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
	var formData = '';
	for (var i = 0; i < y; i++) {
		formData += (i == 0)
		? ''
		: ' '
		for (var j = 0; j < x; j++) {
			formData += (j == 0)
			? '' + SeatInfoList[i][j]
			: ',' + SeatInfoList[i][j]
		}
	}
	console.log(formData)
	$("#seatinfo").val(formData);
}

createSeatTable();
function createSeatTable() {
	var seatinfo = '${seatinfo}';
	var mySeatNum = ${myreser.seatnum == null ? -1 : myreser.seatnum}-1;
	var cnt = 0;
	
	var y = seatinfo.split(" ").length;
	var row = seatinfo.split(" ");
	var x = row[0].split(",").length;
	SeatInfoList = Array.matrix(y, x, -1);
	for (var i = 0; i < y; i++) {
		var col = row[i].split(",");
		for (var j = 0; j < x; j++) {
			console.log(col[j]);
			if (col[j] == 1) {
				if (cnt == mySeatNum) {
					SeatInfoList[i][j] = -3;
				} else if (reservedSeatList[cnt] == 1) {
					SeatInfoList[i][j] = -2;
				} else {
					SeatInfoList[i][j] = 0;					
				}
				cnt++
			}
		}
	}
	console.log(SeatInfoList)
	
	var seatNum = 1;
	var seatTable = "";
	var seatMiniTable = ""
	for (var i = 0; i < y; i++) {
		seatTable += '<tr>' 
		seatMiniTable += '<tr>' 
		for (var j = 0; j < x; j++) {
			if (SeatInfoList[i][j] == -3) {
				SeatInfoList[i][j] = seatNum;
				seatTable += '<td class="seat-reserved-mine" data-x="'+j+'" data-y="'+i+'">'+SeatInfoList[i][j]+'</td>';
				seatMiniTable += '<td class="seat-reserved-mine" data-x="'+j+'" data-y="'+i+'"> </td>';
				seatNum++;
			} else if (SeatInfoList[i][j] == -2) {
				SeatInfoList[i][j] = seatNum;
				seatTable += '<td class="seat-reserved-db" data-x="'+j+'" data-y="'+i+'">'+SeatInfoList[i][j]+'</td>';
				seatMiniTable += '<td class="seat-reserved-db" data-x="'+j+'" data-y="'+i+'"> </td>';
				seatNum++;
			} else if (SeatInfoList[i][j] == -1) {
				seatTable += '<td class="seat-disable" data-x="'+j+'" data-y="'+i+'">X</td>';
				seatMiniTable += '<td class="seat-disable" data-x="'+j+'" data-y="'+i+'"> </td>';
			} else {
				SeatInfoList[i][j] = seatNum;
				seatTable += '<td class="seat" onclick="changeSeatState(this)" data-x="'+j+'" data-y="'+i+'">'+SeatInfoList[i][j]+'</td>';
				seatMiniTable += '<td class="seat" data-x="'+j+'" data-y="'+i+'"> </td>';
				seatNum++;
			}
		}
		seatTable += '</tr>'
		seatMiniTable += '</tr>'
	}
	
	
	$("#seatTable").html(seatTable)
	$("#seatMiniTable").html(seatMiniTable)
}
function changeSeatState(seat) {
	
	var seatList = document.querySelectorAll('.seat-reserve');
	seatList.forEach(function(s) {
		discardSeat($(s))
	});
	
	reserveSeat(seat)
}
function reserveSeat(seat) {
	if (reservationSeat != -1 || reservationSeat != 0) {
		$(seat).removeClass()
			.addClass("seat-reserve")
		$('#seatnum').val(SeatInfoList[$(seat).data('y')][$(seat).data('x')]);
	}
}
function discardSeat(seat) {
	$(seat).removeClass()
		.addClass("seat")
		.html(SeatInfoList[$(seat).data('y')][$(seat).data('x')]);
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

removeAllParam();
</script>

</body>
</html>
