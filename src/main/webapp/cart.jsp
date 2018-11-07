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
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<jsp:include page="/includes/header.jsp" />

</head>
<body>
	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<!-- QueryString 파싱해서 동적으로 span태그 생성 -->
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Cart</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="col-md-7 text-center pt-4 cart-heading">
				<h2>장바구니</h2>
			</div>
		</div>
		<div class="cart-section">
			<div class="container">
				<div class="row mb-4">
					<form class="col-md-12" method="post">
						<div>
							<table class="cart-table">
								<thead>
									<tr>
										<th class="cart-button"><input type="checkbox"
											name="allCheck"></th>
										<th class="all-select">전체선택</th>
										<th class="product-inform" colspan="5">상품정보</th>
										<th class="product-quantity">수량</th>
										<th class="product-price text-right">상품금액</th>
										<th class="product-remove"></th>
									</tr>
								</thead>

								<tbody>
									<c:choose>
										<c:when test="${not empty list }">
											<c:forEach var="cart" items="${list }" varStatus="status">
												<tr>
													<!-- 체크버튼 -->
													<td class="cart-button text-center"><input
														type="checkbox" value=""></td>
													<!-- 상품 정보 -->
													<td class="product-inform" colspan="6"><img
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
															<div class="input-group-prepend">
																<button class="btn btn-outline-primary js-btn-minus"
																	type="button">&minus;</button>
															</div>
															<input type="text"
																class="form-control text-center cartCount"
																value="${cart.count }"
																aria-label="Example text with button addon"
																aria-describedby="button-addon1">
															<div class="input-group-append">
																<button class="btn btn-outline-primary js-btn-plus"
																	type="button">&plus;</button>
															</div>
														</div>
													</td>
													<!-- 금액 -->
													<td class="product-price text-right"><span
														class="totalCost"></span> 원</td>
													<!-- 삭제 버튼 -->
													<td class="cart-button text-center"><i
														class="fas fa-trash"></i></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="11">장바구니에 담긴 상품이 존재하지 않습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

						</div>
					</form>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-6 mb-3 mb-md-0">
								<button class="btn btn-primary btn-sm">선택 삭제</button>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row justify-content-end">
							<div class="col-md-7">
								<div class="row">
									<div class="col-md-12 text-right border-bottom mb-4">
										<h3 class="text-black h4 text-uppercase">결제예정금액</h3>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-12 text-black">
										<span>상품금액</span> <strong class="price-right"><span
											class="sumPrice"></span>원</strong>
									</div>

								</div>
								<div class="row mb-3">
									<div class="col-md-12 text-black">
										<span>배송비</span> <strong class="price-right"><span
											class="shippingPrice">3000</span>원</strong>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-12 text-black">
										<span>합산금액</span> <strong class="price-right"><span
											class="totalPrice"></span>원</strong>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<button class="btn btn-primary btn-lg py-3 btn-block"
											onclick="window.location='checkout.html'">주문하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<script type="text/javascript">
		function calculator() {
			var cartCount = document.querySelectorAll('.cartCount');
			var cartPrice = document.querySelectorAll('.cartPrice');
			var totalCost = document.querySelectorAll('.totalCost');
			for (key in cartCount) {
				if (cartCount[key].value) {
					totalCost[key].innerText = Number(cartCount[key].value)
							* Number(cartPrice[key].innerText);
				}
			}

			var subTotal = document.querySelectorAll('.totalCost');
			var sumPrice = 0;
			for (key in subTotal) {
				if (subTotal[key].innerText) {
					sumPrice += Number(subTotal[key].innerText);
				}
			}
			$('.sumPrice').text(sumPrice);

			var shippingPrice = 0;
			if ($('.shippingPrice').text()) {
				shippingPrice = $('.shippingPrice').text();
			}

			var totalPrice = Number(shippingPrice) + sumPrice;
			$('.totalPrice').text(totalPrice);
		};

		$(document).on("click", ".btn-outline-primary", function(event) {
			calculator();
		});

		$(function() {
			calculator();
		});
	</script>
</body>
</html>