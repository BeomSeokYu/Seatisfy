<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="msgModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="msgModalLabel"></h1>
      </div>
      <div class="modal-body" id="msgModalBody">
		
      </div>
      <div class="modal-footer" id="modal-footer">
        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- modal script -->
<script type="text/javascript">

//제목 내용 있는 모달
function popModal(head, body) {
   $('#msgModalLabel').text(head);
   $('#msgModalBody').html(body);
   $('#modal-footer').empty()
      .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>')
   $('#msgModal').modal('show');
}
 
//url이동 시킬수 있는 모달 
function popModalMove(head, body, url) {
   $('#msgModalLabel').text(head);
   $('#msgModalBody').html(body);
   $('#modal-footer').empty()
      .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="location.href=\'' + url + '\'">확인</button>')
   $('#msgModal').modal('show');
}

//닫기 버튼 있는 모달 
function popModalMove2(head, body, url) {
   $('#msgModalLabel').text(head);
   $('#msgModalBody').html(body);
   $('#modal-footer').empty()
      .append('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'
            + '<a href="'+url+'" class="btn btn-warning">이동</a>')
   $('#msgModal').modal('show');
}

// 원하는 쿼리 파라미터 제거
function removeParam(paramName) {
	const urlParams = new URLSearchParams(window.location.search); // 현재 URL의 쿼리 문자열 파싱
	urlParams.delete(paramName); // 지우려는 파라미터 이름을 전달하여 제거
	const newUrl = window.location.origin + window.location.pathname + '?' + urlParams.toString(); // 새 URL 생성
	window.history.replaceState(null, null, newUrl);
}
// 쿼리 파라미터 전체 제거
function removeAllParam() {
	const urlParams = new URLSearchParams(window.location.search); // 현재 URL의 쿼리 문자열 파싱
	const newUrl = window.location.origin + window.location.pathname; // 새 URL 생성
	window.history.replaceState(null, null, newUrl);
}

</script>