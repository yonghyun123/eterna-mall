<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Eterna &mdash; Most Valuable Cosmetic</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/fonts/icomoon/style.css">

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
	integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/shop_single.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<jsp:include page="/includes/header.jsp"></jsp:include>

</head>
<body>
	<div class="site-wrap">
		<div class="container" data-aos="fade">
			<div class="col-lg-10 video-cover">
				<video autoplay muted loop id="myVideo">
					 <source src="videos/background.mp4" type="video/mp4">
				</video>
			</div>
		</div>

		<div class="site-section site-blocks-2">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>New Products</h2>
					</div>
				</div>

				<div class="row">
					<c:choose>
						<c:when test="${not empty BrandNewZeroList}">
							<c:forEach var="product" items="${BrandNewZeroList}"
								varStatus="status">
								<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
									<a class="block-2-item" href="/detail.mall?productId=${product.productId }">
										<figure class="image">
											<img src="/images/${product.thumnail}" alt="" class="img-fluid">
										</figure>
										<div class="text">
											<span class="text-uppercase">${product.productBrand}</span>
											<h3>${product.productDescription }</h3>
										</div>
									</a>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
								data-aos="fade" data-aos-delay="">
								<a class="block-2-item" href="#">
									<figure class="image">
										<img src="images/women.jpg" alt="" class="img-fluid">
									</figure>
									<div class="text">
										<span class="text-uppercase">입생로랑</span>
										<h3>베르니 아 뢰브르 팝 워터</h3>
									</div>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>Best Products</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel">
							<c:choose>
								<c:when test="${not empty HotItemList}">
									<c:forEach var="Hproduct" items="${HotItemList}"
										varStatus="status">
										<div class="item">
											<div class="block-4 text-center">
												<figure class="block-4-image">
													<img src="/images/${Hproduct.thumnail }" alt="Image placeholder"
														class="img-fluid">
												</figure>
												<div class="block-4-text p-4">
													<h3>
														<a href="/detail.mall?productId=${Hproduct.productId }">${Hproduct.productBrand }</a>
													</h3>
													<p class="mb-0">${Hproduct.productDescription }</p>
													<p class="text-primary font-weight-bold">${Hproduct.price }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section block-8">
			<div class="container">
				<div class="row justify-content-center  mb-5">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>크리스마스 세일!</h2>
					</div>
				</div>
				<div class="row align-items-center">
					<div class="col-md-12 col-lg-7 mb-5">
						<a href="#"><img src="images/christmasIndex.jpg"
							alt="Image placeholder" class="img-fluid rounded"></a>
					</div>
					<div class="col-md-12 col-lg-5 text-center pl-md-5">
						<h2>
							<a href="#">모든 제품 5% 세일 예정!</a>
						</h2>
						<p class="post-meta mb-4">
							By <a href="#">YongZzang</a> <span class="block-8-sep">&bullet;</span>
							2018/10/31
						</p>
						<p>크리스마스를 기념해 모든 제품을 50% 세일합니다. 한정 수량만 판매하니 늦지마세요~</p>
						<p>
							<!-- <a href="#" class="btn btn-primary btn-sm">품목 보기</a> -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/includes/footer.jsp"></jsp:include>

	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/jquery-ui.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/aos.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/ajax.js"></script>
	<script>
		
	</script>
</body>
</html>