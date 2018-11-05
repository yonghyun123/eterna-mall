<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function go_board() {
		location.href = 'thankyou.jsp';
	}
	setTimeout('go_board()', 3000);
</script>
<div class="container">
	<div class="modal fade" id="loading-modal" role="dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h2>결제진행중입니다</h2>
				<img src="images/loading.gif">
			</div>
		</div>
	</div>
</div>