<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<tr>
								<!-- 상품 정보 -->
								<td class="product-inform" colspan="5"><img
									src="images/cloth_2.jpg" alt="Image" class="product-thumbnail">
									<div class="product-text">
										<div class="name">Top Up T-Shirts</div>
										<div class="price">3,000원</div>
									</div></td>
								<!-- 수량 -->
								<td class="product-quantity">
									<div class="cart-button-group input-group">
										<input type="text" class="form-control text-center" value="1"
											aria-label="Example text with button addon"
											aria-describedby="button-addon1" disabled="disabled">
									</div>
								</td>
								<!-- 금액 -->
								<td class="product-price text-right">30,000원</td>
								<td></td>
							</tr>
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
									<td>서지원</td>
								</tr>
								<tr class="col-md-12">
									<th>Phone</th>
									<td>010-1234-1234</td>
								</tr>
								<tr class="col-md-12">
									<th>E-mail</th>
									<td>g1@gmail.com</td>
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
												<input type="radio" value="현재주소" name="address"> 주문자
												주소와 동일
											</div>
											<div class="address">
												<input type="radio" value="최근주소" name="address">
												최근주소
											</div>
											<div class="address">
												<input type="radio" value="새주소" name="address"> 새주소
											</div>
										</div>
										<div>
											<input type="text" class="form-control" id="address"
												name="address">
										</div>
									</td>
								</tr>
								<tr class="col-md-12">
									<th>수령인 이름</th>
									<td><input type="text" class="form-control col-md-3" id="name"
										name="name"></td>
								</tr>
								<tr class="col-md-12">
									<th>휴대폰</th>
									<td class=" phone"><input type="text" class="form-control col-md-3"
										name="name" maxlength="11"></td>
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
									<th>쿠폰 적용</th>
									<td>
										<div>
											<a href="#" class="btn btn-primary btn-sm">쿠폰 선택</a>
										</div>
									</td>
								</tr>
								<tr class="col-md-12">
									<th>적립금 적용</th>
									<td><div>
											사용가능 적립금 : <span>3,000</span> (원)
										</div>
										<div class="address">
											<span>사용할 적립금 : </span><input type="text"
												class="form-control" id="name" name="name"><span>(원)</span>
										</div></td>
								</tr>
							</thead>
						</table>
						<div class="title">
							<h2>Payment</h2>
						</div>
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>일반결제</th>
									<td>
										<div class="address">
											<input type="radio" value="신용카드" name="generalPay"> <span>신용카드</span>
										</div>
										<div class="address">
											<input type="radio" value="휴대폰" name="generalPay"> <span>휴대폰</span>
										</div>
									</td>
								</tr>
								<tr class="col-md-12">
									<th>Paynow 결제</th>
									<td><div class="address">
											<input type="radio" value="신용카드" name="generalPay"> <img
												src="images/logo_paynow.png">
										</div>
								</tr>
								<tr class="col-md-12">
									<th>PAYCO 결제</th>
									<td><div class="address">
											<input type="radio" value="신용카드" name="generalPay"> <img
												src="images/logo_payco.png">
										</div>
								</tr>
								<tr class="col-md-12">
									<th>에스크로 결제</th>
									<td><div class="address">
											<input type="radio" value="신용카드" name="generalPay"><span>계좌이체</span>
										</div>
								</tr>
							</thead>
						</table>
						<div class="title">
							<h2>개인정보 수집/제공</h2>
						</div>
						<table class="cart-table">
							<thead>
								<tr class="col-md-12">
									<th>일반결제</th>
									<td>
										<div class="address">
											<input type="checkbox" value="신용카드" name="generalPay">
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
										<th><span>3,000</span>원</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>discount</td>
										<td><span>500</span>원</td>
									</tr>
									<tr>
										<td>shipping fee</td>
										<td><span>2,500</span>원</td>
									</tr>
									<tr>
									<tr>
										<td>Coupon</td>
										<td><span>2,500</span>원</td>
									</tr>
									<tr>
										<td>Point</td>
										<td><span>2,500</span>원</td>
									</tr>
									<tr>
										<td class="text-black font-weight-bold"><strong>Order
												Total</strong></td>
										<td class="text-black font-weight-bold"><strong>$350.00</strong></td>
									</tr>
								</tbody>
							</table>
							<div class="form-group">
								<button class="btn btn-primary btn-lg py-3 btn-block"
									id="loading-btn">Place Order</button>
									    <%@ include file="/loading.jsp"%>
							</div>
						</div>
					</div>
				</div>
				<!-- </form> -->
			</div>
		</div>
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
	
</body>
</html>