<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="modal fade" id="coupon-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form role="form" class="text-left">
						<div class="form-group">
							<h2>${user.userId }님이보유한쿠폰목록입니다</h2>
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>보유한 쿠폰</th>
										<th>사용기한</th>
										<th>예상 할인 가격</th>
										<th>선택</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty couponList }">
											<c:forEach var="coupon" items="${couponList }"
												varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td class="content">${coupon.couponName}</td>
													<td>~${coupon.couponEndDate } 까지</td>
													<td class="discountAmount"></td>
													<td><input type="button"
														class="btn btn-success selectedCoupon"
														data-dismiss="modal" value="선택"> <input
														type="text" value="${coupon.couponId }" class="couponId">
														<input type="text" value="${coupon.couponRate }"
														class="couponRate"></td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>
							<button type="submit"
								class="btn btn-danger btn-default btn-cancel"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> Cancel
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var couponList = document.querySelectorAll(".selectedCoupon");
	couponList.forEach(function(v, i) {
		v.addEventListener('click', function() {
			var context = $(this).closest("tr").find(".content").text();
			var couponId = $(this).closest("tr").find(".couponId").val();
			var couponRate = $(this).closest("tr").find(".couponRate").val();
			console.log(couponId);
			console.log(couponRate);
// 			$(".selectedCoupon").text(context);
// 			$(".couponId").val(couponId);
// 			$(".couponRate").val(couponRate);
// 			var productPrice = $(".productPrice").text();
		});
	});
	var productPrice2 = 0;
	setTimeout(function() {
		 productPrice2 = $(".productPrice").text();
	console.log(productPrice2);
	}, 300);
</script>
