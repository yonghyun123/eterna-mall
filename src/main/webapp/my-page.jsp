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
    <link rel="stylesheet" href="/css/shop_single.css">
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
              <button class="tablinks active" onclick="openCity(event, '주문 내역')" id="defaultOpen">주문 내역</button>
              <button class="tablinks" onclick="openCity(event, '상품 후기')" id="product-review">상품 후기</button>
              <button class="tablinks" onclick="openCity(event, '적립금')" id="user-point">적립금</button>
              <button class="tablinks" onclick="openCity(event, '쿠폰')" id="user-coupon">쿠폰</button>
              <button class="tablinks" onclick="openCity(event, '개인정보 수정')" id="user-edit">개인정보 수정</button>
            </div>
            <div id="주문 내역" class="tabcontent" style="display: block;">
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
                        <c:set var="orderCountLength" value="${orderCountLength - 1}"/>
                        <c:forEach var="index" begin="0" end="${orderCountLength }" varStatus="i">
                          <tr class="order-list-row">
                            <td class="order-number text-center" id="${orderAllList[startIndex].orderNumber }">${orderAllList[startIndex].orderNumber }</td>
                            <td colspan="5" class="order-inform text-left">
                            <!-- 상품 이름 및 이미지에 해당 상품 페이지 이동 a태그 걸기 -->
                            <c:forEach var="buy" items="${orderAllList }" begin="${startIndex }" end="${endIndex }" varStatus="x">
                                <img alt="" class="product-thumbnail" src="/images/${buy.fileName }">
                                <div class="product-text"> 
                                  <div class="product-name">${buy.productDescription }</div>
                                  <div class="product-price-count">${buy.productPrice }원 / ${buy.count }개</div>
                                </div><br>
                            </c:forEach>
                            </td>
                            <td class="order-date-flag text-center">
                            ${orderAllList[startIndex].orderDate } <br>
                            <c:set var="flag" value="${orderAllList[startIndex].orderFlag }"/> 
                            <c:choose>
                              <c:when test="${flag == 0 }">
                               배송 완료
                              </c:when>
                              <c:when test="${flag == 1 }">
                               배송 중
                              </c:when>
                              <c:when test="${flag == 2 }">
                               배송준비중
                              </c:when>
                            </c:choose>
                            </td>
                          </tr>
                          <c:set var="endIndex" value="${endIndex + orderProductsLength[i.index + 1].numPurchase }"/>
                          <c:set var="startIndex" value="${startIndex + orderProductsLength[i.index].numPurchase }"/>
                          
                        </c:forEach>  
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="상품 후기" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>상품 후기</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover" id="table-review">
                      <thead class="text-center">
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>등록일자</th>
                        </tr>
                      </thead>
                      <tbody id="in-rbody">
                      
                      </tbody>
                    </table>
                    <div class="in-page">
                    
                    </div>
                    <div class="row aos-init aos-animate"
                      data-aos="fade-up">
                      <div class="col-md-12 text-center">
                        <div class="site-block-27">
                          <ul>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <p class="h6">고객님이 작성해 주시는 상품평은 다른 분들께 소중한 정보가 됩니다.</p>
                    <p class="h6">상품평 작성시 200원, 포토 상품평 작성시 300원을 적립해 드립니다.</p>
                  </div>
                </div>
              </div>
            </div>
            <div id="적립금" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>적립금</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover" id="table-point">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>등록일자</th>
                        </tr>
                      </thead>
                      <tbody id="in-tbody">
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="쿠폰" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>쿠폰</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover text-center" id="table-coupon">
                      <thead>
                        <tr>
                          <th>쿠폰번호</th>
                          <th colspan="5">쿠폰명</th>
                          <th>할인금액</th>
                          <th>사용여부</th>
                          <th>유효기간</th>
                        </tr>
                      </thead>
                      <tbody id="in-cbody">
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

  <script type="my-template" id="review-body">
  <tr>
  	<td class="text-center">
  		{number}
  	</td>
  	<td class="title">
  		{subject}
  		<span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
  		<span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
  	</td>
  	<td class="text-center">
  		{userId}
  	</td>
  	<td class="text-center">
  		{regdate}
  	</td>
  	<td>
  		<div class="section_review_list">
  			<div class="review_box">
  				<div class="short_review_area">
  					<div class="grade_area">
  					<!-- [D] 별점 graph_value는 퍼센트 환산하여 width 값을 넣어줌 -->
  					<span class="graph_mask"> <em class="graph_value" style="width: {score}%;"></em> </span>
  				</div>
  				</div>
  			</div>
  		</div>
  	<td>
  </tr>
  <tr style='display:none;'>
  	<td colspan="4">{content}</td>
  </tr>
  </script>
  
  <script type="my-template" id="coupon-body">
  <tr>
    <td class="title">
      {couponId}
    </td>
    <td class="title">
      {couponName}
    </td>
    <td class="title" colspan="5">
      {couponRate}%
    </td>
    <td class="title">
      {useFlag}
    </td>
    <td class="title">
	  {couponDate}
    </td>
  </tr>
  </script>
  
  <script type="my-template" id="detail-header">
	<span class="text-left"><h2>주문 상세</h2></span>
	<div class="text-left"><span>주문일 : <h4 class="order-input">{orderDate}</h4>  |  주문번호 : <h4 class="order-input">{orderId}</h4></span></div>
  </script>
  
  <script type="my-template" id="detail-body">
	<img alt="" class="product-thumbnail" src="/images/{fileName}">
	<div class="product-text"> 
	  <div class="product-name">{productDescription}</div>
	  <div class="product-price-count">{productPrice}원 / {productCount}개</div>
	</div><br>
  </script>
  
  <script type="my-template" id="detail-footer">
	<div class="product-text">
	  <div class="product-price-count">{orderFlag}!</div> 
	  <div class="product-name"><h4>{receiveDate} 도착</h4></div>
	</div><br>
  </script>
  
  <script type="my-template" id="detail-inform">
    <tr>
      <th colspan="4" width="50%">받는사람 정보</th>
      <th colspan="4" width="50%"> 결제 정보 </th>
              </tr>
              <tr>
                <td class="inform-td" colspan="2">받는 사람</td>
                <td colspan="2">{receiverName}</td>
                <td class="inform-td" colspan="2">총 상품 가격</td>
                <td colspan="2">{totalProductPrice}</td>
              </tr>
              <tr>
                <td class="inform-td" colspan="2">연락처</td>
                <td colspan="2">{receiverTel}</td>
                <td class="inform-td" colspan="2">할인금액</td>
                <td colspan="2">{reducePrice}</td>
              </tr>
              <tr>
                <td class="inform-td" colspan="2">주소</td>
                <td colspan="2">{receiverAddress}</td>
                <td class="inform-td" colspan="2">배송비</td>
                <td colspan="2">{shippingFee}</td>
              </tr>
              <tr>
                <td colspan="4"></td>
                <td class="inform-td" colspan="2">총 결제금액</td>
                <td colspan="2"><h5>{totalPrice}</h5></td>
    </tr>
  </script>
  
  
  <script>
  function openCity(evt, cityName) {
      var i, tabcontent, tablinks;
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
         tabcontent[i].style.display = "none";
      }
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
         
         tablinks[i].className = tablinks[i].className.replace("active", "");
      }
      document.getElementById(cityName).style.display = "block";
      evt.currentTarget.className += " active";
      
      if(evt.currentTarget.id == 'product-review'){
      	$.ajax({
      		 url: "/reviewlist.mall",
      		 type:"get",
      		 dataType:"text",
      		 success: function(data){
      			 var jsonReviewData = JSON.parse(data);
      			 reviewTemplate(jsonReviewData);
      		 }
      	  });
      }
      
      if(evt.currentTarget.id == 'user-coupon'){
        	$.ajax({
        		 url: "/user/coupon.mall",
        		 type:"get",
        		 dataType:"text",
        		 success: function(data){
        			 var jsonCouponData = JSON.parse(data);
        			 couponTemplate(jsonCouponData);
        		 }
        	  });
        }
   } 	
  
  var orderList = document.querySelectorAll(".order-number");
  for (var i = 0; i < orderList.length; i++) {
        orderList[i].addEventListener('click', function(event) {
           var orderNumber = "orderNumber=" + this.id;
           $.ajax({
           		url: '/user/orderNumber.mall',
           		data: orderNumber,
           		dataType:'text',
           		success: function(data) {
           			var jsonDetailData = JSON.parse(data);
           			var body = detailHeaderTemplate(jsonDetailData);
           			detailBodyTemplate(jsonDetailData, body);
           			detailFooterTemplate(jsonDetailData);
           			detailInformTemplate(jsonDetailData);
           			$("#order-detail-modal").modal('show');
           		}
           })
        });
  }
  
  function reviewTemplate(reviewData){
	  var templateHtml = document.querySelector('#review-body').innerHTML;
	  var originHtml = document.querySelector('#in-rbody');
	  var newHtml = '';
	  reviewData.forEach(function(v,i){
		  var scoreFormat = Number(v.score) * 20;
		  scoreFormat+'%';
		  newHtml += templateHtml.replace('{number}', i+1)
		  						 .replace('{subject}', v.subject)
		  						 .replace('{userId}', v.userId)
		  						 .replace('{regdate}', v.regdate)  
		  						 .replace('{score}', scoreFormat )
		  						 .replace('{content}', v.content);

	  });
	  originHtml.innerHTML = newHtml;
	  
	  $(".plusIcon").on("click",function(){
		  var obj = $(this);
		  if( obj.hasClass("glyphicon-plus") ){
		   	 obj.hide();
		   	 obj.next().show();            
		   	 obj.parent().parent().next().show();
		  }else{
		     obj.hide();
		     obj.prev().show();
		     obj.parent().parent().next().hide();
		  }
	  });
  }
  
  function couponTemplate(couponData){
	  var templateHtml = document.querySelector('#coupon-body').innerHTML;
	  var originHtml = document.querySelector('#in-cbody');
	  var newHtml = '';
	  couponData.forEach(function(v,i){
		  newHtml += templateHtml.replace('{couponId}', v.couponId)
		  						 .replace('{couponName}', v.couponName)
		  						 .replace('{couponRate}', v.couponRate)
		  						 .replace('{useFlag}', v.useFlag)  
		  						 .replace('{couponDate}', v.couponDate );

	  });
	  originHtml.innerHTML = newHtml;
  }
  
  function detailHeaderTemplate(detailData){
	  var templateHtml = document.querySelector('#detail-header').innerHTML;
	  var originHtml = document.querySelector('#in-detail-header');
	  var body = document.querySelector('#in-detail-body');
	  var newHtml = '';
	 
	  detailData.forEach(function(v,i){
		  newHtml = templateHtml.replace('{orderDate}', v.orderDate)
		  						 .replace('{orderId}', v.orderNumber );

	  });
	  originHtml.innerHTML = newHtml;
	  
	  return body;
  }
  
  function detailBodyTemplate(detailData, body){
	  var templateHtml = document.querySelector('#detail-body').innerHTML;
	  var originHtml = body;
	  var newHtml = '';
	  detailData.forEach(function(v,i){
		newHtml += templateHtml.replace('{fileName}', v.fileName)
							   .replace('{productDescription}', v.productDescription)
		  					   .replace('{productPrice}', v.productPrice)
		  					   .replace('{productCount}', v.productCount);
	  });
	  
	  originHtml.innerHTML = newHtml;
  }
  
  function detailFooterTemplate(detailData){
	  var templateHtml = document.querySelector('#detail-footer').innerHTML;
	  var originHtml = document.querySelector('#in-detail-footer');
	  var newHtml = '';
	  detailData.forEach(function(v,i){
		  newHtml = templateHtml.replace('{receiveDate}', v.receiveDate)
		  						 .replace('{orderFlag}', v.orderFlag);
	  });
	  originHtml.innerHTML = newHtml;
  } 
  
  function detailInformTemplate(detailData){
	  var templateHtml = document.querySelector('#detail-inform').innerHTML;
	  var originHtml = document.querySelector('#in-detail-inform');
	  var newHtml = '';
	  detailData.forEach(function(v,i){
		  newHtml = templateHtml.replace('{receiverName}', v.receiverName)
		  						 .replace('{receiverTel}', v.receiverTel)
		  						 .replace('{receiverAddress}', v.receiverAddress)
		  						 .replace('{totalProductPrice}', v.totalProductPrice)
		  						 .replace('{reducePrice}', v.reducePrice)
		  						 .replace('{shippingFee}', v.shippingFee)
		  						 .replace('{totalPrice}', v.totalPrice);
		  						 
	  });
	  originHtml.innerHTML = newHtml;
  }
  </script>

</body>
</html>