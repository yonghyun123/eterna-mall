
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
<link rel="stylesheet" href="/css/modal.css">
<link rel="stylesheet"
  href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
  integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
  crossorigin="anonymous">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/style.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/checkout.css">
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
            <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <a
              href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span> <strong
              class="text-black">Checkout</strong>
          </div>
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-7 text-center pt-4 cart-heading">
        <h2>결제</h2>
      </div>
    </div>
  </div>
  <div class="cart-section">
    <div class="container">
      <div class="row mb-4">
        <div class="col-md-12">
          <table class="cart-table">
            <thead>
              <tr>
                <th class="product-inform" colspan="5">상품정보</th>
                <th class="product-quantity">수량</th>
                <th class="product-price">상품가격</th>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${not empty cartList }">
                  <c:forEach var="cart" items="${cartList }" varStatus="status">
                  <c:if test="${status.last eq true}">
                  	<input type="hidden" value="${status.count}" id="product-total-count">
                  </c:if>
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
                          <input type="text" class="form-control text-center orderProductCount" value="${cart.count}" aria-label="Example text with button addon" aria-describedby="button-addon1" disabled="disabled">
                          <input type="hidden" class="orderProductId" value="${cart.productId }">
                        </div>
                      </td>
                      <!-- 금액 -->
                      
                      <td class="product-price text-center">
                      <span class="totalCost" id="totalCost"></span>원</td>
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
              <h2>구매자 정보</h2>
            </div>
            <table class="cart-table">
            <c:choose>
                    <c:when test="${not empty user }">
              <thead>
                <tr class="col-md-12">
                  <th>이름</th>
                  <td>${user.userName }</td>
                </tr>
                <tr class="col-md-12">
                  <th>전화번호</th>
                  <td>${user.userTel }</td>
                </tr>
                <tr class="col-md-12">
                  <th>이메일</th>
                  <td>${user.userEmail }</td>
                </tr>
              </thead>
              </c:when>
              <c:otherwise>
               <thead>
                <tr class="col-md-12">
                  <th>이름</th>
                  <td class="col-md-6"><input type="text" class="form-control col-md-3" id="sendName" name="sendName"><span id="buyer-name-id"></span></td>
                </tr>
                
                <tr class="col-md-12">
                  <th>전화번호</th>
                  <td><input type="text" class="form-control col-md-3" id="buyer-sendTel" name="sendTel"><span id="buyer-tel-id"></span></td>
                </tr>
                <tr class="col-md-12">
                  <th>이메일</th>
                  <td><input type="text" class="form-control col-md-3" id="sendEmail" name="sendEmail"><span id="buyer-email-id"></span></td>
                </tr>
                <tr class="col-md-12">
                  <th>전화번호</th>
                  <td><input type="text" class="form-control col-md-3" id="sendPassword" name="sendPassword"><span id="buyer-passwd-id"></span></td>
                </tr>
              </thead>
              </c:otherwise>
              </c:choose>
            </table>
          </div>
          <div class="col-md-12">
            <div class="title">
              <h2>수령인 정보</h2>
            </div>
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>수령인 이름</th>
                    <td><input type="text" class="form-control col-md-3" id="receiver" name="receiverName"><span id="receiver-name-id"></span></td>
                </tr>
                <tr class="col-md-12">
                  <th>휴대폰</th>
                    <td class="phone"><input type="text" class="form-control col-md-3" id="receiverPhone" name="receiverPhone" maxlength="11"><span id="receiver-tel-id"></span></td>
                </tr>
                <tr class="col-md-12">
                  <th>주소</th>
                  <td>
                   <c:choose>
                    <c:when test="${not empty user }">
                    <div>
                      <div class="address">
                        <input type="radio" value="equealAdr" name="address" id="equealAdr"> 주문자 주소와 동일
                        <input type="radio" value="RecentAdr" name="address" id="ChoiceRecentAdr">최근주소
                        <input type="radio" value="newAdr" name="address" id="newAdr"> 새주소
                        <input type="button" class="btn btn-success address-bt" onclick="daumPostcode()" value="search">
                      </div>
                    </div>
                    </c:when>
                    <c:otherwise>
                    <div>
                      <div class="address">
                       <input type="button" class="btn btn-success" onclick="daumPostcode()" value="search">
                      </div>
                    </div>
                    </c:otherwise>
                    </c:choose>
                    <div>
                      <input type="text" class="form-control" id="new-zipcod-address">
                      <input type="text" class="form-control" id="new-street-address">
                      <input type="text" class="form-control" id="new-detail-address">
                    </div>
                  </td>
                </tr>
                <tr class="col-md-12">
                  <th>배송요청사항</th>
                  <td><textarea name="request" cols="30" rows="5" class="form-control" maxlength="50" style="width: 50%;"></textarea>
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
              <c:choose>
                    <c:when test="${not empty user }">
                <tr class="col-md-12">
                  <th>쿠폰 적용 </th>
                  <td>
                    <div class="find">
                      선택 쿠폰 : <span class="selectedCoupon"></span><a id="coupon" class="btn btn-primary btn-sm">쿠폰 선택</a> 
                      <input type="hidden"  class="couponId">
                      <input type="hidden" class="couponRate">
                      <a id="cancelCoupon" class="btn btn-primary btn-sm">적용 취소</a>
                    </div>
                  </td>
                </tr>
                <tr class="col-md-12">
                  <th>적립금 적용</th>
                  <td>
                    <div>
                        사용가능한 적립금 : <span class="availablePoint">${user.userPoint }</span> (원)
                    </div>
                    <div class="toUsePoint">
                      <input type="text" class="form-control" id="toUsePoint" name="name">
                      <a id="pointBtn" class="btn btn-primary btn-sm">사용</a>
                      <a id="cancelPointBtn" class="btn btn-primary btn-sm">적용 취소</a>
                    </div>
                    </td>
                </tr>
                </c:when>
                <c:otherwise>
                <tr class="col-md-12">
	
                  <th>쿠폰 적용 </th>
                  <td>보유한 쿠폰이 존재하지 않습니다
					<div class="find" style="display: none;">
                      선택 쿠폰 : <span class="selectedCoupon"></span> <a id="coupon" class="btn btn-primary btn-sm">쿠폰 선택</a> 
                      <input type="hidden"  class="couponId">
                      <input type="hidden" class="couponRate">
                      <a id="cancelCoupon" >적용 취소</a>
                    </div>
                  </td>
                </tr>
                <tr class="col-md-12">
                  <th>적립금 적용</th>
                  <td>보유한 적립금이 존재하지 않습니다
					<div style="display: none;"> 사용가능 적립금 : <span class="availablePoint">${user.userPoint }</span> (원) 
					<a id="pointBtn" class="btn btn-primary btn-sm">사용</a>
					<a id="cancelPointBtn" >적용 취소</a>
                    </div>
                    <div class="toUsePoint" style="display: none;">
                      <span>사용할 적립금 : </span>
                      <input type="text" class="form-control" id="toUsePoint" name="name">
                      <span>(원)</span>
                    </div></td>
                </tr> 
                </c:otherwise>
                </c:choose>
              </thead>
            </table>
            <div class="title">
              <h2>결제 수단<input type="hidden" id="pay"></h2>
            </div>
            <div class="generalPay">
            <table class="cart-table">
              <thead>
                <tr class="col-md-12">
                  <th>일반결제</th>
                  <td><div>
                    <label>
                      <input type="radio" value="creditCard" name="generalPay" checked="checked"> <span>신용카드</span></label>
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
                      <label id="info-checkbox"><input type="checkbox" name="info"id="info-check" > <span>[필수] 개인정보 수집 및 이용 동의</span></label>
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
                <button class="btn btn-primary btn-lg py-3 btn-block" id="loading-btn" disabled="disabled">Place Order</button>
              </div>
            </div>
          </div>
        </div>
        <!-- </form> -->
      </div>
    </div>

<%@ include file="coupon.jsp"%>
<%@ include file="loading.jsp" %>
<%@ include file="personalInfo.jsp" %>
<%@ include file="recentAddress.jsp"%>

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
    $(function() {
      /* totalPrice뿌려주기 */
      var cartCount = document.querySelectorAll('.orderProductCount');
      var cartPrice = document.querySelectorAll('.cartPrice');
      var totalCost = document.querySelectorAll('.totalCost');
	  var uriCheck = "${uriCheck}"; 

	  console.log(cartCount);
	  console.log(cartPrice);
      for (key in cartCount) {
        if (cartCount[key].value) {
          totalCost[key].innerText = Number(cartCount[key].value) * Number(cartPrice[key].innerText);
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
        popup("popup-message-use-point-minus");
      } else if ((availablePoint - toUsePoint) < 0) {
    	  popup("popup-message-use-point-minus");
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
      var userAddress= '${user.userAddress}' ;
      var addressArray = userAddress.split('/');
         
      for (var i = 0; i < check.length; i++) {
        if(check[i].checked){
          switch(check[i].value){
          case "equealAdr": 
            $("#new-zipcod-address").val(addressArray[0]);
            $("#new-detail-address").val(addressArray[2]);
            $("#new-street-address").val(addressArray[1]);
            document.getElementById('receiver').value= '${user.userId}';
            document.getElementById('receiverPhone').value= '${user.userTel}';
            break;
          case "newAdr":
            document.getElementById('new-zipcod-address').value= '';
            document.getElementById('new-street-address').value= '';
            document.getElementById('new-detail-address').value= '';
            document.getElementById('receiver').value= '';
            document.getElementById('receiverPhone').value= '';
            break;
          }
        }
      }
    }); 
    /* 정보제공 체크박스 */
    $('#info-checkbox').change(function(){
    	if($("input:checkbox[id='info-check']").is(":checked") == true){
    		$('#personalInfo-modal').modal();
    		$('#loading-btn').attr('disabled', false); 
    	} else {
    		$('#loading-btn').attr('disabled', true);
    	}
    })
    
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
    $('#cancelCoupon').click(function(){
      $('.applyCoupon').text(0);
      var applyPoint2 = $('.applyPoint').text();
      var orderTotal = Number(productPrice)  + Number(shippingFee)  - Number(applyPoint2);
      $('.selectedCoupon').text('');
      $('.orderTotal').text(orderTotal);
      selectedCouponId = '';
    });
    /* 적립금 적용 취소 눌렀을 때 */
    $('#cancelPointBtn').click(function(){
      $('.applyPoint').text(0);
      var applyCoupon2 = $('.applyCoupon').text();
      var orderTotal = Number(productPrice)  + Number(shippingFee)  - Number(applyCoupon2);
      $('#toUsePoint').val('');
      $('.orderTotal').text(orderTotal);
    });
    });
    
    // 우편번호 찾기 화면을 넣을 element
      function daumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if(data.userSelectedType === 'R'){
                      //법정동명이 있을 경우 추가한다.
                      if(data.bname !== ''){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있을 경우 추가한다.
                      if(data.buildingName !== ''){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('new-street-address').value = fullAddr;
                  document.getElementById('new-zipcod-address').value = data.zonecode; //5자리 새우편번호 사용

                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById('new-detail-address').focus();
              }
          }).open();
      }
    
    /* 결제 버튼 눌렀을때 데이터 넘기기 */
    function buyBtnClicked(){
	  var orderBtn = document.querySelector('#loading-btn');
	  orderBtn.addEventListener('click', function(){
			setTimeout(function() {
				  var count = document.querySelectorAll('.orderProductCount');
				  var productId = document.querySelectorAll('.orderProductId');
				  console.log(count);
				  console.log(productId);
				  var countArr = [];
				  var productIdArr = [];
				  for (var i = 0; i < count.length; i++) {
					  countArr.push(count[i].value);
					  productIdArr.push(productId[i].value);
				  }
				
				  var couponPrice = $('.applyCoupon').text();
				  var couponPoint = $('.applyPoint').text();
				  if(!couponPoint){
					  couponPoint = 0;
				  }
				  var productId = "${cartList[0].productId}"; 
				  var productCount ="${cartList[0].count}";
				  var reducePrice = Number(couponPrice) + Number(couponPoint);
				  var totalPrice = $('.productPrice').text();
				  var zipcode = $('#new-zipcod-address').val();
				  var street = $('#new-street-address').val();
				  var detailAddr = $('#new-detail-address').val();
				  var fullAddress = zipcode + '/' + street + '/' + detailAddr;
				  var receiver = $('#receiver').val();
				  var receiverPhone = $('#receiverPhone').val();
				  var productTotalCount = $('#product-total-count').val();
				  
				  var buyerName;
				  var buyerPasswd;
				  var buyerPhone;

				  if($('#sendName')){
					  buyerName = $('#sendName').val();
				  }
				  if($('#sendPassword')){
					  buyerPasswd = $('#sendPassword').val();
				  }
				  if($('#buyer-sendTel')){
					  buyerPhone = $('#buyer-sendTel').val();
				  }
				  
				  
				  console.log(buyerName);
				  console.log(buyerPasswd);
				  console.log(buyerPhone);
				  console.log(reducePrice);
				  console.log(productId);
				  console.log(productCount);
				  console.log(totalPrice);
				  console.log(selectedCouponId);
				  console.log(fullAddress);

				  var uriCheck = "${uriCheck}"; 
				  var postUri = '/'+uriCheck+'.mall';
				  console.log(postUri);

		          var form = document.createElement("form");
		          form.setAttribute("charset", "UTF-8");
		          form.setAttribute("method", "Post");
		          form.setAttribute("action", postUri);
		          
		          //buyerInfo
		          
		          //buyerName
				  var hiddenBuyerName = document.createElement("input");
				  hiddenBuyerName.setAttribute("type", "hidden");
				  hiddenBuyerName.setAttribute("name", "buyerName");
				  hiddenBuyerName.setAttribute("value", buyerName);
					  
				  //buyerPhone
				  var hiddenBuyerPhone = document.createElement("input");
				  hiddenBuyerPhone.setAttribute("type", "hidden");
				  hiddenBuyerPhone.setAttribute("name", "buyerPhone");
				  hiddenBuyerPhone.setAttribute("value", buyerPhone);
				  
				  //buyerPasswd
				  var hiddenBuyerPasswd = document.createElement("input");
				  hiddenBuyerPasswd.setAttribute("type", "hidden");
				  hiddenBuyerPasswd.setAttribute("name", "buyerPasswd");
				  hiddenBuyerPasswd.setAttribute("value", buyerPasswd);
				  
				  var hiddenUsedPoint = document.createElement('input');
				  hiddenUsedPoint.setAttribute('type', 'hidden');
				  hiddenUsedPoint.setAttribute('name', 'usedPoint');
				  hiddenUsedPoint.setAttribute('value',couponPoint)
				  
				  
		          //productId
		          var hiddenProductId = document.createElement("input");
		 		  hiddenProductId.setAttribute("type", "hidden");
		          hiddenProductId.setAttribute("name", "productId");
		          hiddenProductId.setAttribute("value", productId);
		 
		          //productCount
		          var hiddenProductCount = document.createElement("input");
		          hiddenProductCount.setAttribute("type", "hidden");
		          hiddenProductCount.setAttribute("name", "productCount");
		          hiddenProductCount.setAttribute("value", productCount);
		 
		          //totalPrice
		          var hiddenTotalPrice = document.createElement("input");
		          hiddenTotalPrice.setAttribute("type", "hidden");
		          hiddenTotalPrice.setAttribute("name", "totalPrice");
		          hiddenTotalPrice.setAttribute("value", totalPrice);

		          //reducePrice
		          var hiddenReducePrice = document.createElement("input");
		          hiddenReducePrice.setAttribute("type", "hidden");
		          hiddenReducePrice.setAttribute("name", "reducePrice");
		          hiddenReducePrice.setAttribute("value", reducePrice);
		          
		          //selectedCoupon
		          var hiddenSelectedCoupon = document.createElement("input");
		          hiddenSelectedCoupon.setAttribute("type", "hidden");
		          hiddenSelectedCoupon.setAttribute("name", "selectedCouponId");
		          hiddenSelectedCoupon.setAttribute("value", selectedCouponId);
		          
		
		          //fullAddress(/구분자 사용)
		          var hiddenFullAddr = document.createElement("input");
		          hiddenFullAddr.setAttribute("type", "hidden");
		          hiddenFullAddr.setAttribute("name", "fullAddress");
		          hiddenFullAddr.setAttribute("value", fullAddress);
		          
		          //receiver
		          var hiddenReceiver = document.createElement("input");
		          hiddenReceiver.setAttribute("type", "hidden");
		          hiddenReceiver.setAttribute("name", "receiver");
		          hiddenReceiver.setAttribute("value", receiver);
		          
		          //receiverPhone
		          var hiddenReceiverPhone = document.createElement("input");
		          hiddenReceiverPhone.setAttribute("type", "hidden");
		          hiddenReceiverPhone.setAttribute("name", "receiverPhone");
		          hiddenReceiverPhone.setAttribute("value", receiverPhone);
		          
		          //hiddenProductTotalCount
		          var hiddenProductTotalCount = document.createElement("input");
		          hiddenProductTotalCount.setAttribute("type", "hidden");
		          hiddenProductTotalCount.setAttribute("name", "productTotalCount");
		          hiddenProductTotalCount.setAttribute("value", productTotalCount);
			      var hiddenCount = [];
			      var hiddenId = [];
				  for(var i = 0; i < countArr.length; i++){
				   	   hiddenCount[i] = document.createElement('input');
					   hiddenCount[i].setAttribute('type', 'hidden');
					   hiddenCount[i].setAttribute('name', 'productCountArr');
					   hiddenCount[i].setAttribute('value', countArr[i]);
					   form.appendChild(hiddenCount[i]);
					 
					   hiddenId[i] = document.createElement('input');
					   hiddenId[i].setAttribute('type', 'hidden');
					   hiddenId[i].setAttribute('name', 'productIdArr');
					   hiddenId[i].setAttribute('value', productIdArr[i]);
					   form.appendChild(hiddenId[i]);
				  }
		          
				  form.appendChild(hiddenUsedPoint);
		          form.appendChild(hiddenBuyerName);
		          form.appendChild(hiddenBuyerPhone);
		          form.appendChild(hiddenBuyerPasswd);
		          form.appendChild(hiddenProductId);
		          form.appendChild(hiddenProductCount);
		          form.appendChild(hiddenTotalPrice);
		          form.appendChild(hiddenSelectedCoupon);
		          form.appendChild(hiddenReducePrice);
		          form.appendChild(hiddenFullAddr);
		          form.appendChild(hiddenReceiver);
		          form.appendChild(hiddenReceiverPhone);
		          form.appendChild(hiddenProductTotalCount);
		          
		          document.body.appendChild(form);
		          
 		          form.submit(); 
			}, 3000)
	  });
    }
    buyBtnClicked();

    
    var inputRegExpr = {
		   passwdCheck: function(val){
			      var msg = '';
			      var regPasswd = /^(?=.*[a-zA-Z])(?=.*\d).{5,15}$/;
			       if(val.length == 0){
		             msg = ' ';
		             checkpw = 0;
		          }
			      else if (val.length > 15 || val.lengh < 5 || !regPasswd.test(val)) {
			         msg = '패스워드 길이는 영문, 숫자 포함 5~15자 입니다.';
			      } else {
			    	  msg = '사용가능합니다.'
			         checkpw = 1;
			      }
				  document.getElementById('buyer-passwd-id').innerText = msg;
		   },
		   nameCheck: function(val){
			   var msg = '';
			      var regName = /(^[가-힣]{2,10}$|^[a-zA-Z]{2,10})/;
			       if(val.length == 0){
		             msg = ' ';
		             checkName = 0;
			      }
			      else if (!regName.test(val)) {
			         msg = ' 영문, 한글 2~10자 내로 입력 가능합니다.';
			         checkName = 0;
			      } else {
			    	  msg = '사용가능합니다.'
			         checkName = 1;
			      }
			       document.getElementById('buyer-name-id').innerText = msg;
		   },
		   receiverNameCheck: function(val){
			   var msg = '';
			      var regName = /(^[가-힣]{2,10}$|^[a-zA-Z]{2,10})/;
			      if(val.length == 0){
		             msg = ' ';
		             checkReceiverName = 0;
			      }
			      else if (!regName.test(val)) {
			         msg = ' 영문, 한글 2~10자 내로 입력 가능합니다.';
			         checkReceiverName = 0;
			      } else {
			    	  msg = '사용가능합니다.';
			    	  checkReceiverName = 1;
			      }
			       document.getElementById('receiver-name-id').innerText = msg;
		   },
		   emailCheck: function(val){
			  var msg = '';
		      var regEmail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		      if(val.length == 0){
		         msg = ' ';
		         checkemail = 0;
		      }
		      else if(!regEmail.test(val)){
	               msg = '이메일 형식에 맞게 입력해주세요.';
	               checkemail= 0;
		      }else{
                msg = '사용가능합니다.'
                checkemail=1;
		      }
		      document.getElementById('buyer-email-id').innerText = msg;
		   },
		   
		   phoneCheck: function(val){
			   var msg = '';
		       var regTel = /^01([0|1|6|7|8|9]?)?([0-9]{8,9})$/;
		       if(val.length == 0){
	              msg = ' ';
	              checkTel = 0;
		       }
		       else if (!regTel.test(val)) {
		          msg = ' 01012341234 형식으로 입력해주세요.';
		          checkTel = 0;
		       } else {
		          msg = '사용가능합니다.'
		          checkTel = 1;
		       }
		       document.getElementById('buyer-tel-id').innerText = msg;
		   },
		   receiverPhoneCheck: function(val){
			   var msg = '';
		       var regTel = /^01([0|1|6|7|8|9]?)?([0-9]{8,9})$/;
		       if(val.length == 0){
	              msg = ' ';
	              checkReceiverTel = 0;
		       }
		       else if (!regTel.test(val)) {
		          msg = ' 01012341234 형식으로 입력해주세요.';
		          checkReceiverTel = 0;
		       } else {
		          msg = '사용가능합니다.';
		          checkReceiverTel = 1;
		       }
		       document.getElementById('receiver-tel-id').innerText = msg;
		   },
		   
		   addressCheck: function(val){
			   /* 주소 공백 확인 */
		       var zip = document.getElementById('zip-code').value;
		       var street = document.getElementById('street-address').value;
		       var detail = document.getElementById('detail-address').value;
		       if(zip.length != 0 && street.length != 0 && detail.length != 0){
		          checkAddress = 1;
		       }else{
		          checkAddress = 0;
		       }
		   }
	};
    
    //비회원 유효성 체크 함수
    function checkExprInputData(){
    	var checkpw = 0;
    	var checkName = 0;
    	var checkemail = 0;
    	var checkTel = 0;
    	var checkReceiverName = 0;
    	var checkReceiverTel = 0;
    	
    	var sendName = document.querySelector('#sendName');
    	var sendTel = document.querySelector('#buyer-sendTel');
    	var sendPassword = document.querySelector('#sendPassword');
    	var sendEmail = document.querySelector('#sendEmail');
    	var receiverName = document.querySelector('#receiver');
    	var receiverPhone = document.querySelector('#receiverPhone');
    	receiverName.onkeyup = function(){
    		var val = this.value;
    		inputRegExpr.receiverNameCheck(val);
    		ableJoin();
    	}
    	receiverPhone.onkeyup = function(val){
    		var val = this.value;
    		inputRegExpr.receiverPhoneCheck(val);
    		ableJoin();
    	}
    	
    	sendName.onkeyup = function(){
    		var val = this.value;
    		inputRegExpr.nameCheck(val);
    		ableJoin();
    	};
    	sendEmail.onkeyup = function(){
    		var val = this.value;
    		inputRegExpr.emailCheck(val);
    		ableJoin();
    	};
    	sendPassword.onkeyup = function(){
    		var val = this.value;
    		inputRegExpr.passwdCheck(val);
    		ableJoin();
    	};
    	sendTel.onkeyup = function(){
    		var val = this.value;
    		inputRegExpr.phoneCheck(val);
    		ableJoin();
    	}
        document.getElementById('new-zipcod-address').onkeyup = function(){
        	inputRegExpr.addressCheck();
            ableJoin();
         }
         
         document.getElementById('new-street-address').onkeyup = function(){
        	inputRegExpr.addressCheck();
            ableJoin();
         }
         
         document.getElementById('new-detail-address').onkeyup = function(){
        	inputRegExpr.addressCheck();
            ableJoin();
         }
    	
    }
    //checkExprInputData();
    
    /* 유효성 확인 후 join 버튼 활성화 */
    function ableJoin(){
       if(checkpw == 1 && checkemail==1 && checkName == 1 && checkTel == 1 && checkReceiverName == 1 && checkReceiverTel == 1){
          document.getElementById("loading-btn").disabled = false;
       }else{
          document.getElementById("loading-btn").disabled = true;
       }
    }
    </script>
  
  </body>
</html>

