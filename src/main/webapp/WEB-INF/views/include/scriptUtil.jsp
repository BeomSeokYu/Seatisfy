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

function popModal(head, body) {
   $('#msgModalLabel').text(head);
   $('#msgModalBody').html(body);
   $('#modal-footer').empty()
      .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>')
   $('#msgModal').modal('show');
}
 
function popModalMove(head, body, url) {
   $('#msgModalLabel').text(head);
   $('#msgModalBody').html(body);
   $('#modal-footer').empty()
      .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="location.href=\'' + url + '\'">확인</button>')
   $('#msgModal').modal('show');
}

function popModalMove2(head, body, url) {
   $('#msgModalLabel').text(head);
   $('#msgModalBody').html(body);
   $('#modal-footer').empty()
      .append('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'
            + '<a href="'+url+'" class="btn btn-warning">이동</a>')
   $('#msgModal').modal('show');
}


</script>