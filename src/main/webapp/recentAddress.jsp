<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="modal fade" id="recentAddress-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form role="form" class="text-left">
						<div class="form-group">
							<h2>${user.userId }님의 최근 배송지 목록입니다</h2>
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>수령인 이름</th>
										<th>휴대폰</th>
										<th>주소</th>
										<th>선택</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty recentAddressList }">
											<c:forEach var="recentAddress" items="${recentAddressList }"
												varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td class="receiverName">${recentAddress.receiverName}</td>
													<td class="receiverTel">${recentAddress.receiverTel }</td>
													<td class="receiverAddress">${recentAddress.receiverAddress }</td>
													<td><input type="button" class="btn btn-success selectedReceiver" data-dismiss="modal" value="선택">
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>
							<button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var receiverList = document.querySelectorAll(".selectedReceiver");
receiverList.forEach(function(v,i){
	v.addEventListener('click',function(){
	     var receiverName = $(this).closest("tr").find(".receiverName").text();
	     var receiverTel = $(this).closest("tr").find(".receiverTel").text();
	     var receiverAddress = $(this).closest("tr").find(".receiverAddress").text();
	     var receiverAddressArray = receiverAddress.split('/');
         $("#new-zipcod-address").val(receiverAddressArray[0]);
         $("#new-detail-address").val(receiverAddressArray[2]);
         $("#new-street-address").val(receiverAddressArray[1]);
	     $("#receiver").val(receiverName);
	     $("#receiverPhone").val(receiverTel);
	});
}); 

</script>
