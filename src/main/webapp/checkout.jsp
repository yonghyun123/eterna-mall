<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
	integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/checkout.css">
<link rel="stylesheet" href="css/header.css">
<jsp:include page="/includes/header.jsp"></jsp:include>
</head>
<body>
	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <a
							href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Checkout</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-7 text-center pt-4 cart-heading">
				<h2>Payment</h2>
			</div>
		</div>
	</div>
	<div class="cart-section">
		<div class="container">
			<div class="row mb-4">
				<div class="col-md-12">
					<div class="title">
						<h2>Product Information</h2>
					</div>
					<table class="cart-table">
						<thead>
							<tr>
								<th class="product-inform" colspan="5">Product Information</th>
								<th class="product-quantity">Amount</th>
								<th class="product-price text-right">Total Price</th>
								<th class="product-remove"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty cartList }">
									<c:forEach var="cart" items="${cartList }" varStatus="status">
										<tr>
											<!-- 상품 정보 -->
											<td class="product-inform" colspan="5"><img
												src="images/${cart.fileName }" alt="Image"
												class="product-thumbnail">
												<div class="product-text">
													<div class="name">${cart.productDescription }</div>
													<div class="price">
														<span class="cartPrice">${cart.price }</span>원
													</div>
												</div></td>
											<!-- 수량 -->
											<td class="product-quantity">
												<div class="cart-button-group input-group">
													<input type="text"
														class="form-control text-center cartCount"
														value="${cart.count }"
														aria-label="Example text with button addon"
														aria-describedby="button-addon1" disabled="disabled">
												</div>
											</td>
											<!-- 금액 -->
											<td class="product-price text-right"><span
												class="totalCost"></span>원</td>
											<td></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="payment-section">
			<div class="container">
				<div class="row mb-4">
					<div class="col-md-12">
						<div class="title">
							<h2>Buyer Information</h2>
						</div>
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>Name</th>
									<td>${user.userId }</td>
								</tr>
								<tr class="col-md-12">
									<th>Phone</th>
									<td>${user.userTel }</td>
								</tr>
								<tr class="col-md-12">
									<th>E-mail</th>
									<td>${user.userEmail }</td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="col-md-12">
						<div class="title">
							<h2>Shipping Information</h2>
						</div>
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>주소</th>
									<td>
										<div>
											<div class="address">
												<label><input type="radio" value="equealAdr" name="address"
													id="equealAdr"> 주문자 주소와 동일
												</label><label><input type="radio" value="RecentAdr" name="address" id="ChoiceRecentAdr">
												최근주소
												</label><label><input type="radio" value="newAdr" name="address" id="newAdr"> 새주소</label>
											</div>
										</div>
										<div>
											<input type="text" class="form-control" id="receiverAddress">
										</div>
									</td>
								</tr>
								<tr class="col-md-12">
									<th>수령인 이름</th>
									<td><input type="text" class="form-control col-md-3"
										id="receiver" name="name"></td>
								</tr>
								<tr class="col-md-12">
									<th>휴대폰</th>
									<td class=" phone"><input type="text"
										class="form-control col-md-3" id="receiverPhone" name="phone"
										maxlength="11"></td>
								</tr>
								<tr class="col-md-12">
									<th>배송요청사항</th>
									<td><textarea name="request" cols="30" rows="5"
											class="form-control" maxlength="50"></textarea>
										<div class="chk_bytes">
											<span>0</span>자 / 50자
										</div></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="title">
							<h2>Coupon / Point</h2>
						</div>
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>쿠폰 적용 </th>
									<td>
										<div class="find">
											선택 쿠폰 : <span class="selectedCoupon"></span> <a id="coupon"
												class="btn btn-primary btn-sm">쿠폰 선택</a> <input
												type="hidden"  class="couponId">
											<input type="hidden" class="couponRate">
                      <a id="cancleCoupon" class="btn btn-primary btn-sm">적용 취소</a>
										</div>
									</td>
								</tr>
								<tr class="col-md-12">
									<th>적립금 적용</th>
									<td><div>
											사용가능 적립금 : <span class="availablePoint">${user.userPoint }</span>
											(원) <a id="pointBtn" class="btn btn-primary btn-sm">사용</a>
                                                  <a id="canclePointBtn" class="btn btn-primary btn-sm">적용 취소</a>
										</div>
										<div class="toUsePoint">
											<span>사용할 적립금 : </span><input type="text"
												class="form-control" id="toUsePoint" name="name"><span>(원)</span>
										</div></td>
								</tr>
							</thead>
						</table>
						<div class="title">
							<h2>Payment<input type="hidden" id="pay"></h2>
						</div>
                          <div class="generalPay">
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>일반결제</th>
									<td><div>
										<label>
											<input type="radio" value="creditCard" name="generalPay"> <span>신용카드</span></label>
										</div>
										<div><label>
											<input type="radio" value="tele" name="generalPay"> <span>휴대폰</span></label>
										</div>
									</td>
								</tr>
								<tr class="col-md-12">
									<th>Paynow 결제</th>
									<td><label><input type="radio" value="paynow" name="generalPay"> <img src="images/logo_paynow.png"></label></td>
								</tr>
								<tr class="col-md-12">
									<th>PAYCO 결제</th>
									<td><label><input type="radio" value="payco" name="generalPay"> <img src="images/logo_payco.png"></label></td>
								</tr>
								<tr class="col-md-12">
									<th>에스크로 결제</th>
									<td><label>
											<input type="radio" value="escro" name="generalPay"><span>계좌이체</span></label></td>
								</tr>
							</thead>
						</table>
                          </div>
						<div class="title">
							<h2>개인정보 수집/제공</h2>
						</div>
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>일반결제</th>
									<td>
										<div class="checkInfo">
											<input type="checkbox" value="info" name="info">
											<span>[필수] 개인정보 수집 및 이용 동의</span>
										</div>
									</td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="col-md-4">
						<h2 class="h3 mb-3 text-black">Your Order</h2>
						<div class="p-3 p-lg-5 border-order">
							<table class="table site-block-order-table">
								<thead>
									<tr>
										<th>Product Price</th>
										<th><span class="productPrice"></span>원</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>(+) shipping fee</td>
										<td><span class="shippingFee">3000</span>원</td>
									</tr>
									<tr>
									<tr>
										<td>(-) Coupon</td>
										<td><span class="applyCoupon">0</span>원</td>
									</tr>
									<tr>
										<td>(-) Point</td>
										<td><span class="applyPoint">0</span>원</td>
									</tr>
									<tr>
										<td class="text-black font-weight-bold"><strong>Order
												Total</strong></td>
										<th class="text-black font-weight-bold"><span
											class="orderTotal"></span>원</th>
									</tr>
								</tbody>
							</table>
							<div class="form-group">
								<button class="btn btn-primary btn-lg py-3 btn-block"
									id="loading-btn">Place Order</button>
								<%-- 									    <%@ include file="/loading.jsp"%> --%>
							</div>
						</div>
					</div>
				</div>
				<!-- </form> -->
			</div>
		</div>
		
		<%@ include file="recentAddress.jsp"%>
		<jsp:include page="/includes/footer.jsp"></jsp:include>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
		$(function() {
			/* totalPrice뿌려주기 */
			var cartCount = document.querySelectorAll('.cartCount');
			var cartPrice = document.querySelectorAll('.cartPrice');
			var totalCost = document.querySelectorAll('.totalCost');
			for (key in cartCount) {
				if (cartCount[key].value) {
					totalCost[key].innerText = Number(cartCount[key].value)
							* Number(cartPrice[key].innerText);
				}
			}
			/* total product Price */
			var productPrice = 0;
			for (key in totalCost) {
				if (totalCost[key].innerText) {
					productPrice += Number(totalCost[key].innerText);
				}
			}
			$('.productPrice').text(productPrice);
				/* 물건금액 30000원 이상일때 shippingFee 0원*/
				var shippingFee = $('.shippingFee').text();
				if (productPrice > 30000) {
					shippingFee = 0;
					$('.shippingFee').text(0);
				}
			var applyCoupon = $('.applyCoupon').text();
			var applyPoint = $('.applyPoint').text();
			var orderTotal = Number(productPrice) + Number(shippingFee)
					- Number(applyCoupon) - Number(applyPoint);
			$('.orderTotal').text(orderTotal);

		/* 적립금 사용버튼 클릭할 때마다 yourOrder 변화 */
		var pointBtn = document.getElementById("pointBtn");
		pointBtn.addEventListener('click', function() {
			var availablePoint = Number($('.availablePoint').text());
			var applyPoint = $('.applyPoint').text();
			var toUsePoint = Number($('#toUsePoint').val());
			if (availablePoint == 0) {
				alert("적립금이 0점이면 못씀");
			} else if ((availablePoint - toUsePoint) < 0) {
				alert("보유한 적립금보다 적게 입력해주세요");
			} else {
				applyPoint = availablePoint - toUsePoint;
				applyCoupon = $('.applyCoupon').text();
				$('.applyPoint').text(toUsePoint);
				var orderTotal = Number(productPrice)  + Number(shippingFee) 
						- Number(applyCoupon) - Number(toUsePoint);
				$('.orderTotal').text(orderTotal);
			}
		});
		/* 주소 라디오 버튼 */
		$('.address').change(function(){
			var check = document.getElementsByName('address');
			for (var i = 0; i < check.length; i++) {
				if(check[i].checked){
					switch(check[i].value){
					case "equealAdr": 
						document.getElementById('receiverAddress').value= '${user.userAddress}';
						document.getElementById('receiver').value= '${user.userId}';
						document.getElementById('receiverPhone').value= '${user.userTel}';
						break;
					case "tele":
						break;
					case "newAdr":
						document.getElementById('receiverAddress').value= '';
						document.getElementById('receiver').value= '';
						document.getElementById('receiverPhone').value= '';
						break;
					}
				}
			}
		});	
		/* 결제 라디오 버튼 */
		$('.generalPay').change(function(){
			var check = document.getElementsByName('generalPay');
			for (var i = 0; i < check.length; i++) {
				if(check[i].checked){
					$('#pay').val(check[i].value);
				}
			}
		});	
		
		/* 쿠폰 적용 취소 눌렀을 때 */
		$('#cancleCoupon').click(function(){
			$('.applyCoupon').text(0);
			var applyPoint2 = $('.applyPoint').text();
			var orderTotal = Number(productPrice)  + Number(shippingFee)  - Number(applyPoint2);
			$('.selectedCoupon').text('');
			$('.orderTotal').text(orderTotal);
		});
		/* 적립금 적용 취소 눌렀을 때 */
		$('#canclePointBtn').click(function(){
			$('.applyPoint').text(0);
			var applyCoupon2 = $('.applyCoupon').text();
			var orderTotal = Number(productPrice)  + Number(shippingFee)  - Number(applyCoupon2);
			$('#toUsePoint').val('');
			$('.orderTotal').text(orderTotal);
		});
		});
		</script>
	
	</body>
</html>
<%@ include file="coupon.jsp"%>