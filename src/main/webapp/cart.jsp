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
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/style.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/cart.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<jsp:include page="/includes/header.jsp" />
</head>
<body>
  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
            <!-- QueryString 파싱해서 동적으로 span태그 생성 -->
            <a href="/index.html">Home</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">Cart</strong>
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
          <c:choose>
          <c:when test="${loginId != null }">
          <form class="col-md-12" method="post" action="/cartDelete.mall">
            </c:when>
            <c:otherwise>
            <form class="col-md-12" method="post" action="/nonUserCartDelete.mall">
            </c:otherwise>
            </c:choose>
            <div>
              <table class="cart-table">
                <thead>
                  <tr>
                    <th class="cart-button"><input type="checkbox"
                      id="allCheck" onclick="allChecked()"></th>
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
                      <c:forEach var="cart" items="${list }"
                        varStatus="status">
                        <tr>
                          <!-- 체크버튼 -->
                          <td class="cart-button text-center"><input
                            type="checkbox" value="${cart.productId }"
                            name="deleteCheck" class="selectedItems">
                            <input type="hidden"
                            value="${cart.productId }"
                            class="hiddenDelete"></td>
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
                                <button
                                  class="btn btn-outline-primary js-btn-minus"
                                  type="button">&minus;</button>
                              </div>
                              <input type="text"
                                class="form-control text-center cartCount"
                                value="${cart.count }"
                                aria-label="Example text with button addon"
                                aria-describedby="button-addon1">
                              <div class="input-group-append">
                                <button
                                  class="btn btn-outline-primary js-btn-plus"
                                  type="button">&plus;</button>
                              </div>
                            </div>
                          </td>
                          <!-- 금액 -->
                          <td class="product-price text-right"><span
                            class="totalCost"></span> 원</td>
                          <!-- 삭제 버튼 -->
                         <c:choose>
            			<c:when test="${loginId != null }">
                          <td class="cart-button text-center"><i
							class="fas fa-trash" id="loginDelete"></i>
                          </td>
                     	</c:when>
           				 <c:otherwise>
           				<td class="cart-button text-center"><i
							class="fas fa-trash" id="nonloginDelete"></i>
           				 </c:otherwise>
            		</c:choose>  
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="11" id="cartEmpty">장바구니에 담긴 상품이 존재하지 않습니다.</td>
                      </tr>
                    </c:otherwise>
                  </c:choose>
                </tbody>
              </table>
            </div>
            
            <div class="col-md-6">
              <div class="row mb-5">
                <div class="col-md-6 mb-3 mb-md-0">
                  <button class="btn btn-primary btn-sm"
                    id="DeleteCheckBtn">선택 삭제</button>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="row">
          <div class="col-md-6"></div>
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
                    <button
                      class="btn btn-primary btn-lg py-3 btn-block"
                      id="order">주문하기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="user/login.jsp"%>
    <jsp:include page="/includes/footer.jsp"></jsp:include>
  </div>
  <script src="/js/jquery-3.3.1.min.js"></script>
  <script src="/js/jquery-ui.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/jquery.magnific-popup.min.js"></script>
  <script src="/js/aos.js"></script>
  <script src="/js/main.js"></script>
  <script type="text/javascript">
			/* 화면 로딩 */
			var loginId = "${cookie.loginId.value}";
			$(function() {
				document.getElementById("allCheck").checked = true;
				allChecked();
			});

			/* 전체 선택과 해제 함수 */
			function allChecked() {
				if (document.getElementById("allCheck").checked) {
					$("input[name=deleteCheck]").prop("checked", true);
					calculator();
				} else {
					$("input[name=deleteCheck]").prop("checked", false);
					calculator();
				}
			}
			/* 체크된 상품 subTotal */
			$(document).on("click", "input[name=deleteCheck]", function(event) {
						calculator();
					});
			/* 상품 가격 계산 */
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
				var items = $("input[name=deleteCheck]");
				var toBuy = document.querySelectorAll(".totalCost");
				var subTotal = 0;
				for (var i = 0; i < items.length; i++) {
					if (items[i].checked) {
						subTotal += Number(toBuy[i].innerText);
					}
				}
				console.log('subtotal : ' + subTotal)
				$('.sumPrice').text(subTotal);

				var shippingPrice = 0;
				if (subTotal >= 30000) {
					$('.shippingPrice').text(0);
					shippingPrice = 0;
					$('#DeleteCheckBtn').prop("disabled", false);
					$('#order').prop("disabled", false) ;
				}else if (subTotal == 0) {
					$('.shippingPrice').text(0);
					shippingPrice = 0;
					$('#DeleteCheckBtn').prop("disabled", true);
					$('#order').prop("disabled", true);
				} else {
					$('.shippingPrice').text(3000);
					shippingPrice = 3000;
					$('#DeleteCheckBtn').prop("disabled", false);
					$('#order').prop("disabled", false);
				}

				var totalPrice = Number(shippingPrice) + subTotal;
				$('.totalPrice').text(totalPrice);
			};

			/* 장바구니 하나씩 삭제할 때  - cartDeleteController*/
			$(document).on("click","#loginDelete",function(event) {
						var productId = $(this).closest("tr").find(
								".hiddenDelete").val();
						var form = document.createElement("form");
						form.setAttribute("charset", "UTF-8");
						form.setAttribute("method", "Post");
						form.setAttribute("action", "/cartDelete.mall");

						var hiddenDelete = document.createElement("input");
						hiddenDelete.setAttribute("type", "hidden");
						hiddenDelete.setAttribute("name", "deleteCheck");
						hiddenDelete.setAttribute("value", productId);
						form.appendChild(hiddenDelete);
						document.body.appendChild(form);
						form.submit();
					});
			
			/**비회원 장바구니 하나씩 삭제할 때  - nonUsercartDeleteController*/
			$(document).on("click","#nonloginDelete",function(event) {
				var formData = new FormData();
				var productId = $(this).closest("tr").find(".hiddenDelete").val();
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action", "/nonUserCartDelete.mall");

				var hiddenDelete = document.createElement("input");
				hiddenDelete.setAttribute("type", "hidden");
				hiddenDelete.setAttribute("name", "deleteCheck");
				hiddenDelete.setAttribute("value", productId);
				form.appendChild(hiddenDelete);
				document.body.appendChild(form);
				form.submit();
		
			});
			
			/* 수량 수정 */
			$(document).on("click", ".btn-outline-primary", function(event) {
				calculator();
			});
			/* 주문버튼  */
			$(document).on("click", "#order", function(event) {
				var countArr = [];
				var productIdArr = [];
				var count = document.querySelectorAll('.cartCount');
				var productId = document.querySelectorAll('.hiddenDelete');
				var items = $("input[name=deleteCheck]");
				for (var i = 0; i < items.length; i++) {
					if (items[i].checked) {
						countArr.push(count[i].value);
						productIdArr.push(productId[i].value);
					}
				}
				console.log('countArr : ' + countArr);
				console.log(typeof countArr);
				console.log('productIdArr : ' + productIdArr);
				
				var countArrStr = JSON.stringify(countArr);
				var productIdArrStr = JSON.stringify(productIdArr);
				
					
				if(loginId){
					$.ajax({
						type : "post",
						url : "/cartUpdate.mall",
						dataType : "text",
						data : {
							'countArr' : countArrStr,
							'productIdArr' : productIdArrStr
						},
						success : function() {
							window.location.href = "/order.mall";
						}
					});

					
				} else {
					var form = document.createElement("form");
					form.setAttribute("charset", "UTF-8");
					form.setAttribute("method", "Post");
					form.setAttribute("action", "/cartUpdate.mall");
					var hiddenCount = [];
					var hiddenId = [];
					for(var i = 0; i < countArr.length; i++){
						 hiddenCount[i] = document.createElement('input');
						 hiddenCount[i].setAttribute('type', 'hidden');
						 hiddenCount[i].setAttribute('name', 'productCount');
						 hiddenCount[i].setAttribute('value', countArr[i]);
						 form.appendChild(hiddenCount[i]);
						 
						 hiddenId[i] = document.createElement('input');
						 hiddenId[i].setAttribute('type', 'hidden');
						 hiddenId[i].setAttribute('name', 'productId');
						 hiddenId[i].setAttribute('value', productIdArr[i]);
						 form.appendChild(hiddenId[i]);
						 
					}
					document.body.appendChild(form);
					form.submit();
				}
			});
		</script>
</body>
</html>