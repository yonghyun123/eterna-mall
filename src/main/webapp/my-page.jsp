<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/style.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/my-page.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <jsp:include page="/includes/header.jsp"></jsp:include>
</head>
<body>
  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
          <!-- QueryString 파싱해서 동적으로 span태그 생성 -->
            <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">MyPage</strong>
          </div>
        </div>
      </div>
    </div>

    <div class="my-page-top-section">
      <div class="container">
        <div class="row mb-4 my-page-top">
          <div class="user-grade">
            <div class="user text-black text-left">
              <span class="grade">${user.tierType }</span>
              <span class="name">${user.userName }님</span>
            </div>
            <div class="grade-inform text-black">
              <span class="grade-score">다음 등급까지 ${grade - amount }점 남았습니다.</span>
            </div>
          </div>
          <ul class="user-saving">
            <li>
              <a href="#" class="saving-link">
                <div class="inner-class">
                  <div class="info-text text-black">적립금</div>
                  <div class="info">
                    <span class="saving-score">${user.userPoint }원</span>
                    <i class="fas fa-angle-right fa-xs"></i>
                  </div>
                </div>
              </a>
            </li>
            <li>
              <a href="#" class="coupon-link">
                <div class="inner-class">
                  <div class="info-text text-black">쿠폰</div>
                  <div class="info">
                    <span class="coupon-quantity">${couponLength } 장</span>
                    <i class="fas fa-angle-right"></i>
                  </div>
                </div>
              </a>
            </li>
            <li>
              <a href="#" class="buy-link">
                <div>
                  <div class="info-text text-black">총 구매금액</div>
                  <div class="info">
                    <span  class="all-buy-price">${amount } 원</span>
                  </div>
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="my-page-bottom-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="tab" id="tab">
              <button class="tablinks active"
                onclick="openCity(event, '주문 내역')" id="defaultOpen">주문 내역</button>
              <button class="tablinks"
                onclick="openCity(event, '상품 후기')">상품 후기</button>
                <button class="tablinks"
                onclick="openCity(event, '적립금')">적립금</button>
                <button class="tablinks"
                onclick="openCity(event, '쿠폰')">쿠폰</button>
                <button class="tablinks"
                onclick="openCity(event, '개인정보 수정')">개인정보 수정</button>
            </div>
            <div id="제품 리뷰" class="tabcontent" style="display: block;">
              <div class="container">
                <div class="row justify-content-center">
                  <div
                    class="col-md-7 site-section-heading text-center pt-4">
                    <h2>주문 내역</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover order-list-table">
                      <thead>
                        <tr>
                          <th class="order-list-number text-center">주문 번호</th>
                          <th class="order-list-info text-center" colspan="5">주문 내용</th>
                          <th class="order-list-status text-center">배송 결과</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:set var="startIndex" value="0"/>
                        <c:set var="endIndex" value="${orderProductsLength[0].numPurchase - 1}"/>
                        <c:set var="orderCountLength" value="${orderCountLength }"/>
                        <c:forEach var="index" begin="0" end="${orderCountLength - 1 }">
                          <tr>
                            <td class="order-number text-center" id="${orderAllList[startIndex].orderNumber }">${orderAllList[startIndex].orderNumber }</td>
                            <td colspan="5" class="order-inform text-left">
                            <!-- 상품 이름 및 이미지에 해당 상품 페이지 이동 a태그 걸기 -->
                            <c:forEach var="buy" items="${orderAllList }" begin="${startIndex }" end="${endIndex }" varStatus="x">
                                <img alt="" class="product-thumbnail" src="../images/${buy.fileName }.png">
                                <div class="product-text"> 
                                  <div class="product-name">${buy.productDescription }</div>
                                  <div class="product-price-count">${buy.productPrice }원 / ${buy.count }개</div>
                                </div><br>
                            </c:forEach>
                            </td>
                            <td class="order-date-flag text-center">${orderAllList[startIndex].orderDate } <br> ${orderAllList[startIndex].orderFlag }</td>
                          </tr>
                          <c:set var="startIndex" value="${startIndex += orderProductsLength[index].numPurchase }"/>
                          <c:set var="endIndex" value="${endIndex += orderProductsLength[index].numPurchase - 1}"/>
                        </c:forEach>  
                      </tbody>
                    </table>
                    <div class="row aos-init aos-animate"
                      data-aos="fade-up">
                      <div class="col-md-12 text-center">
                        <div class="site-block-27">
                          <ul>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <p class="h6">고객님이 작성해 주시는 상품평은 다른 분들께 소중한 정보가
                      됩니다.</p>
                    <p class="h6">상품평 작성시 200원, 포토 상품평 작성시 300원을
                      적립해 드립니다.</p>
                  </div>
                </div>
              </div>
            </div>
            <div id="상품 문의" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div
                    class="col-md-7 site-section-heading text-center pt-4">
                    <h2>상품 문의</h2>
                    <p class="h6">본 상품에 대해서 궁금한 사항을 올려주세요. 상품 담당자가
                      신속히 답변을 드립니다.</p>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <div class="field">
                      <textarea class="review" name="contents"
                        id="message" rows="6"
                        placeholder="로그인한 경우에만 문의 작성이 가능합니다"
                        maxlength="200"></textarea>
                      <input type="button" value="등록"
                        class="btn btn-outline-primary js-btn-plus"
                        id="create">
                    </div>
                    <table class="table table-hover col-md-12">
                      <thead>
                        <tr>
                          <th>Firstname</th>
                          <th>Lastname</th>
                          <th>Email</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>John</td>
                          <td>Doe</td>
                          <td>john@example.com</td>
                        </tr>
                        <tr>
                          <td>Mary</td>
                          <td>Moe</td>
                          <td>mary@example.com</td>
                        </tr>
                        <tr>
                          <td>July</td>
                          <td>Dooley</td>
                          <td>july@example.com</td>
                        </tr>
                      </tbody>
                    </table>
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
  
  	// 탭 기능
  	document.getElementById("defaultOpen").click();
  
  	/* $.ajax({
  		url:  "/user/orderList.mall",
  		type: "get",
  		success: function(data) {
  			alert(data);
  		}
  	}) */
  
  	/* // 주문번호 상세보기
  	var orderNumbers = document.querySelectorAll(".order-number");
  	
  	for ( var i = 0; i < orderNumbers.length; i++) {
		orderNumbers[i].addEventListener('click', function(event) {
			alert(this.id);
				$.ajax({
					url: orderDetail.mall
				})
		})
	} */
  	
  </script>

</body>
</html>