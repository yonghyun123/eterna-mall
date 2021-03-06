<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding='UTF-8' %>
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
              <c:choose>
                <c:when test="${amount >= 1000000 }">
                  <span class="grade-score">VVIP 고객이십니다.</span>
                </c:when>
                <c:otherwise>
                  <span class="grade-score">다음 등급까지 ${grade - amount }점 남았습니다.</span>  
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <ul class="user-saving">
            <li>
              <a class="saving-link">
                <div class="inner-class">
                  <div class="info-text text-black">적립금</div>
                  <div class="info">
                    <span class="saving-score">${user.userPoint }원</span>
                  </div>
                </div>
              </a>
            </li>
            <li>
              <a class="coupon-link">
                <div class="inner-class">
                  <div class="info-text text-black">쿠폰</div>
                  <div class="info">
                    <span class="coupon-quantity">${couponLength } 장</span>
                  </div>
                </div>
              </a>
            </li>
            <li>
              <a href="#" class="buy-link">
                <div>
                  <div class="info-text text-black">총 구매금액</div>
                  <div class="info">
                    <span class="all-buy-price">${amount } 원</span>
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
              <button class="tablinks" onclick="openCity(event, 'QNA')" id="product-qna">Q&A</button>
              <button class="tablinks" onclick="openCity(event, '적립금')" id="user-point">적립금</button>
              <button class="tablinks" onclick="openCity(event, '쿠폰')" id="user-coupon">쿠폰</button>
              <button class="tablinks" onclick="openCity(event, '개인정보 수정')" id="user-modify">개인정보 수정</button>
            </div>
            <!-- 주문내역 탭 -->
            <div id="주문 내역" class="tabcontent" style="display: block;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>주문 내역</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover order-list-table">
                        <c:choose>
                          <c:when test="${orderCountLength != 0 }">
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
                                  <c:set var="flag" value="${orderAllList[startIndex].orderFlag }"/> 
                                  <c:choose>
                                    <c:when test="${flag == 0 }">
                                      <h4>배송 전</h4> ${orderAllList[startIndex].orderDate } <span>출발</span> 
                                    </c:when>
                                    <c:when test="${flag == 1 }">
                                      <h4>배송 중</h4> ${orderAllList[startIndex].orderDate } <span>출발</span>
                                    </c:when>
                                    <c:when test="${flag == 2 }">
                                      <h4>배송 완료</h4> ${orderAllList[startIndex].receiveDate } <span>도착</span>
                                    </c:when>
                                  </c:choose>
                                  </td>
                                </tr>
                                <c:set var="endIndex" value="${endIndex + orderProductsLength[i.index + 1].numPurchase }"/>
                                <c:set var="startIndex" value="${startIndex + orderProductsLength[i.index].numPurchase }"/>
                              </c:forEach>
                            </c:when>
                          <c:otherwise>
                            <th class="text-center" style="padding: 3% 0"><h4>주문내역이 존재하지 않습니다.</h4></th>
                          </c:otherwise>
                        </c:choose>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <!-- 상품 후기 탭 -->
            <div id="상품 후기" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>상품 후기</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover">
                      <thead class="text-center">
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>등록일자</th>
                          <th colspan="100"></th>
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
            
            <!-- Q&A 탭 -->
            <div id="QNA" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>Q&A</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover">
                      <thead>
                        <tr class="text-center">
                          <th colspan="1">주문번호</th>
                          <th colspan="4">내용</th>
                          <th colspan="2">일자</th>
                        </tr>
                      </thead>
                      <tbody id="in-qbody">
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
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 적립금 탭 -->
            <div id="적립금" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>적립금</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover col-md-10 text-center" style="margin: 0 auto;">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>상태</th>
                          <th>금액</th>
                          <th>일자</th>
                        </tr>
                      </thead>
                      <tbody id="in-pbody">
                      </tbody>                    
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <!-- 쿠폰 탭 -->
            <div id="쿠폰" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>쿠폰</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover text-center">
                      <thead>
                        <tr>
                          <th>쿠폰번호</th>
                          <th colspan="5">쿠폰명</th>
                          <th>할인금액</th>
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
            <!-- 개인정보 탭 -->
            <div id="개인정보 수정" class="tabcontent" style="display: none;">
              <div class="container" id="in-mbody">
              <!-- template 들어올 공간  -->

              </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 개인정보 수정할 때 사용할 popup -->
    <div id="popup-message-PWCheck-fail">비밀번호가 일치하지 않습니다</div>
    <div id="popup-message-emailCheck-success">이메일 중복 확인</div>
    <div id="popup-message-emailCheck-fail">중복된 이메일이 존재합니다</div>
    <div id="popup-message-update-success">사용가능한 이메일입니다</div>
    <div id="popup-message-Userupdate-success">개인정보가 수정되었습니다</div>
    <div id="popup-message-inputPW">비밀번호를 입력해주세요</div>
    <%@ include file="user/order-detail-modal.jsp"%>
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
  
 <!-- review template -->
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
      <td colspan="100">{content}</td>
  	</tr>            
  </script>
  
  <!-- qna template -->
  <script type="my-template" id="qna-body">
  		<tr>
    		<td colspan="1" class="text-center">
      			{orderNumber}
    		</td>
    		<td colspan="4" class="title">
      			[{productName}] {subject}
	  			<span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
      			<span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
    		</td>
    		<td colspan="2" class="text-center">
      		{regdate}
    		</td>
  		</tr>
  		<tr style='display:none;'>
    		<td colspan="100">{content}</td>
  		</tr>
  </script>
  
  <!-- coupon template -->
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
    			{couponDate}
	    	</td>
	  	</tr>
  </script>
  
  <!-- point template -->
  <script type="my-template" id="point-body">
     <tr>
		<td class="title">
			{orderNumber}
		</td>
		<td class="title">
			{pointFlag}
		</td>
	   	<td class="title">
			{point}
	    </td>
		<td class="title">
			{pointDate}
	    </td>
	 </tr>                
  </script>
  
  <!-- 개인정보 수정 template -->
  <script type="my-template" id="modify-body">
  <div class="row justify-content-center">
	<div class="col-md-7 site-section-heading text-center pt-4">
       <h2>개인정보 수정</h2>
    </div>
  </div>
    <div class="row text-center update-row">
      <table class="cart-table text-left">
        <tbody>
          <tr>
            <th>아이디</th>
            <td>{userId}</td>
          </tr>
          <tr>
            <th>새 비밀번호</th>
            <td><input type="password" id="newPW"></td>
          </tr>
		  <tr>
            <th></th>
			<td><span id="modifyPutPw"></span></td>
          </tr>
          <tr>
            <th>새 비밀번호 확인</th>
            <td><input type="password" id="confirmNewPW"></td>
          </tr>
		  <tr>
            <th></th>
			<td><span id="modifyPutCheckPw"></span></td>
          </tr>
          <tr>
            <th>이름</th>
            <td>{userName}</td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
				<input type="text" id="new-userEmail" value="{userEmail}">
				<input type="button" class="btn btn-success emailCheck" value="중복체크">
            </td>
          </tr>
		  <tr>
            <th></th>
            <td><span id="modifyPutEmail"></span></td>
          </tr>
          <tr>
            <th>휴대폰</th>
            <td>{userTel}</td>
          </tr>
          <tr>
            <th rowspan="3" class="update-address">주소</th>
            <td>
			  <input type="text" id="new-zipcod-address" value="{userZipcode}" readOnly="readOnly">
              <input type="button" class="btn btn-success" onclick="daumPostcode()" value="search">
			</td>
     	  </tr>
    	  <tr>
      	  	<td>
			  <input type="text" id="new-street-address" value="{userStreetAddress}" readOnly="readOnly">
          	</td>
     	  </tr>
          <tr>
          	<td>
			  <input type="text" id="new-detail-address" value="{userDetailAddress}" placeholder="상세주소">
        	</td>
      	  </tr>
      	  <tr>
        	<th>회원가입 날짜</th>
        	<td>{userRegdate}</td>
      	  </tr>
		  <tr>
        	<th></th>
        	<td><input type="button" class="btn btn-success modify" disabled value="수정"></td>
      	  </tr>
        </tbody>
      </table>
  </div>
  </script>

  <!-- 개인정보 확인시 비밀번호 확인 template -->
  <script type="my-template" id="confirm-body">
  <div class="row justify-content-center">
    <div class="col-md-7 site-section-heading text-center pt-4">
        <h4>개인정보 수정</h4>
        <div class="confirm-text"><div>회원님의 정보를 안전하게 보호하기 위해</div> 비밀번호를 다시 한번 확인해주세요.</div>
    </div>
  </div>
  <div class="row text-center passwd-box">
    <div class="container">
      <div class="field_pw">
      	<div>
          <input type="password" name="confirm_password" id="confirm_password" class="col-md-3" placeholder="비밀번호">
   	      <button class="btn btn-primary" id="confirmPasswdBtn">확인</button>
        </div>
      </div>
    </div>
  </div>                        
  </script>
  
  <!-- 개인정보 수정 성공시 template -->
  <script type="my-template" id="success-body">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <span class="icon-check_circle display-3 text-success"></span>
        <h2 class="display-3 text-black">Thank you!</h2>
        <p class="lead mb-5">회원정보가 성공적으로 수정되었습니다</p>
      </div>
    </div>
  </div>
  </script>
  
  <!-- 실패 template -->
  <script type="my-template" id="fail-body">
      <tr class="text-center"><td colspan="100">{item} 존재하지 않습니다.</td></tr>
  </script>
  
  <script>
  /* 유효성 체크를 위한 flag들 */
  var checkpw = 0;
  var checkconfirm = 0;
  var checkemail = 1;
  var checkAddress = 1;
  var emailCheck = 0;
  
  /* 탭 클릭 */
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
      
    /* 상품후기 탭 클릭 */
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
      
  	/* Q&A 탭 클릭 */
  	if(evt.currentTarget.id == 'product-qna'){
      $.ajax({
        url: "/user/qnaList.mall",
        type:"get",
        dataType:"text",
        success: function(data){
          var jsonQNAData = JSON.parse(data);
          QNATemplate(jsonQNAData);
        }
      });
    }
  	
  	/* Q&A 탭 클릭 */
  	if(evt.currentTarget.id == 'user-point'){
      $.ajax({
        url: "/user/point.mall",
        type:"get",
        dataType:"text",
        success: function(data){
          var jsonQNAData = JSON.parse(data);
          pointTemplate(jsonQNAData);
        }
      });
    }
      
    /* 쿠폰 탭 클릭 */
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
      
    /* 개인정보 수정 탭 클릭 */
    if (evt.currentTarget.id == 'user-modify') {
      var templateHtml = document.querySelector('#confirm-body').innerHTML;
      var originHtml = document.querySelector('#in-mbody');
      originHtml.innerHTML = templateHtml;
    }
  }
  
  /* 주문번호별 상세정보 */
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
          detailSideTemplate(jsonDetailData);
          detailInformTemplate(jsonDetailData);
          $("#order-detail-modal").modal('show');
        }
      })
    });
  }
  
  /* 리뷰  */
  function reviewTemplate(reviewData){
    var originHtml = document.querySelector('#in-rbody');
    var newHtml = '';
    if(reviewData.length != 0) {
      var templateHtml = document.querySelector('#review-body').innerHTML;      
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
  	  
    }else {
      var templateHtml = document.querySelector('#fail-body').innerHTML;
      newHtml += templateHtml.replace('{item}', "등록하신 리뷰가");
    }
    originHtml.innerHTML = newHtml;
    
    $(".plusIcon").on("click",function(){
        var obj = $(this);
        if(obj.hasClass("glyphicon-plus")){
          obj.hide();
          obj.next().show();            
          obj.parent().parent().next().show();
        }else {
          obj.hide();
          obj.prev().show();
          obj.parent().parent().next().hide();
        }
     });
  }
  
  /* 적립금  */
  function pointTemplate(pointData){
    var originHtml = document.querySelector('#in-pbody');
    var newHtml = '';
    if(pointData.length != 0) {
    	var templateHtml = document.querySelector('#point-body').innerHTML;      
      	pointData.forEach(function(v,i){
          newHtml += templateHtml.replace('{orderNumber}', v.orderNumber)
                                 .replace('{pointFlag}', v.pointFlag)
                                 .replace('{point}', v.point)
                                 .replace('{pointDate}', v.pointDate);

        });
      }else {
    	var templateHtml = document.querySelector('#fail-body').innerHTML;
        newHtml += templateHtml.replace('{item}', "적립금 관련 내역이");
    }
    originHtml.innerHTML = newHtml;
  }
  
  /* 쿠폰  */
  function couponTemplate(couponData){
    var originHtml = document.querySelector('#in-cbody');
    var newHtml = '';
    if(couponData.length != 0) {
    	var templateHtml = document.querySelector('#coupon-body').innerHTML;      
      	couponData.forEach(function(v,i){
          newHtml += templateHtml.replace('{couponId}', v.couponId)
                                 .replace('{couponName}', v.couponName)
                                 .replace('{couponRate}', v.couponRate)
                                 .replace('{couponDate}', v.couponDate);

        });
      }else {
    	var templateHtml = document.querySelector('#fail-body').innerHTML;
        newHtml += templateHtml.replace('{item}', "쿠폰이");
      }
    originHtml.innerHTML = newHtml;
  }
  
  /* QNA */
  function QNATemplate(QNAData){
    var originHtml = document.querySelector('#in-qbody');
    var newHtml = '';
    if(QNAData.length != 0) {
    	var templateHtml = document.querySelector('#qna-body').innerHTML;      
    	QNAData.forEach(function(v,i){
    	  newHtml += templateHtml.replace('{orderNumber}', v.id)
    	                         .replace('{productName}', v.productName)
  	                             .replace('{subject}', v.subject)
  	                             .replace('{content}', v.content)
  	                             .replace('{regdate}', v.regdate);

    	});
      }else {
    	var templateHtml = document.querySelector('#fail-body').innerHTML;
        newHtml += templateHtml.replace('{item}', "등록하신 문의글이");
      }
      originHtml.innerHTML = newHtml;
      $(".plusIcon").on("click",function(){
          var obj = $(this);
          if(obj.hasClass("glyphicon-plus")){
             obj.hide();
             obj.next().show();            
             obj.parent().parent().next().show();
          }else {
             obj.hide();
             obj.prev().show();
             obj.parent().parent().next().hide();
          }
      });
  }
  
  /* 주문번호 별 상세보기 헤더 */
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
  
  /* 주문번호 별 상세보기 바디 */
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
  
  /* 주문번호 별 상세보기 사이드 */
  function detailSideTemplate(detailData){
    var templateHtml = document.querySelector('#detail-side').innerHTML;
    var originHtml = document.querySelector('#in-detail-side');
    var newHtml = '';
    detailData.forEach(function(v,i){
      newHtml = templateHtml.replace('{receiveDate}', v.receiveDate)
    		                .replace('{orderFlag}', v.orderFlag);
    });
    originHtml.innerHTML = newHtml;
  } 
  
  /* 주문번호 별 상세보기 푸터쪽 결제정보 */
  function detailInformTemplate(detailData){
    var templateHtml = document.querySelector('#detail-inform').innerHTML;
    var originHtml = document.querySelector('#in-detail-inform');
    var newHtml = '';
    detailData.forEach(function(v,i){
      v.receiverAddress = parsingAddress(v.receiverAddress);		
    	
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
  
  /* 주소 파싱 메서드 */
  function parsingAddress(address) {
    var addressArray = address.split('/');
    var receiverAddress;
    if(addressArray) {
	  receiveAddress = "(" + addressArray[0] + ") " + addressArray[1] + " " + addressArray[2]; 	  
    }
    return receiveAddress;	  
  }
  
  /* 개인정보 수정 - 수정하기 버튼 눌렀을때 */
  $(document).on("click",".modify",function(event) {
    var userEmail = document.getElementById('new-userEmail').value;
    var confirmNewPW = document.getElementById('confirmNewPW').value;
    var zipcode = document.getElementById('new-zipcod-address').value;
    var street = document.getElementById('new-street-address').value;
    var detail = document.getElementById('new-detail-address').value;
    var newAddress = zipcode +'/'+ street+'/'+detail;
    var params = "confirmNewPW=" + confirmNewPW +"&userEmail="+userEmail+ "&newAddress=" + newAddress;
    $.ajax({
      url : "/user/updateInfo.mall",
      type : "get",
      dataType : "text",
      data :  params,
      success : function(data) {
        var templateHtml = document.querySelector('#success-body').innerHTML;
        var originHtml = document.querySelector('#in-mbody');
        originHtml.innerHTML = templateHtml;
        popup("popup-message-Userupdate-success");
      }
    });
  });
  
  /* 개인정보 수정 - 이메일 중복 체크 */
  $(document).on("click",".emailCheck",function(event) {
    var emailCheck = document.getElementById('new-userEmail').value.trim();
    var params = "emailCheck=" + emailCheck;
    $.ajax({
      url : "/user/updateInfo.mall",
      type : "get",
      dataType : "text",
      data :  params,
      success : function(data) {
        if(data.trim()=='success'){
          popup("popup-message-update-success");
          document.getElementById('new-userEmail').readOnly = true;
          document.querySelector('.emailCheck').disabled = true;
          emailCheck = 1;
          ableJoin();
        } else if(data.trim() == 'fail'){
          popup("popup-message-emailCheck-fail");
          emailCheck = 0;
        }
      }
    });
  });
  
  /* 개인정보 수정 - 비밀번호 체크 */
  $(document).on("click","#confirmPasswdBtn",function(event) {
    var email = document.getElementById('confirm_password').value;
    /* 비밀번호 빈칸 */
    if(email.trim().length==0){
      popup("popup-message-inputPW");
      document.getElementById('confirm_password').value = '';
    } else {
  	  var inputPW = "inputPW=" + email;
   	  $.ajax({
        url : "/user/updateInfo.mall",
        type : "get",
        dataType : "text",
        data :  inputPW,
        success : function(data) {
          if(data.trim()=='fail'){
            /* 비밀번호 불일치 */
            popup("popup-message-PWCheck-fail");
            document.getElementById('confirm_password').value = '';
          } else {
            /* 비밀번호 일치 */
            var jsonModifyData = JSON.parse(data);
            modiftTemplate(jsonModifyData);
            eventRegist();
          }
        }
      });
    }
  });
  
  /* 개인정보 수정 template */
  function modiftTemplate(jsonModifyData) {
    var templateHtml = document.querySelector('#modify-body').innerHTML;
    var originHtml = document.querySelector('#in-mbody');
    var newHtml = '';
    jsonModifyData.forEach(function(v, i) {
      newHtml = templateHtml.replace('{userId}', v.userId)
          				  .replace('{userName}', v.userName)
          				  .replace('{userEmail}', v.userEmail)
          				  .replace('{userZipcode}', v.userZipcode)
          				  .replace('{couponDate}', v.couponDate)
          				  .replace('{userStreetAddress}', v.userStreetAddress)
          				  .replace('{userDetailAddress}', v.userDetailAddress)
          				  .replace('{userRegdate}', v.userRegdate)
          				  .replace('{userTel}', v.userTel);
    });
    originHtml.innerHTML = newHtml;
  }
  
  /* 주소입력 API */
  function daumPostcode() {
    new daum.Postcode({
      oncomplete : function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = ''; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수

        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if(data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          fullAddr = data.roadAddress;

        }else { // 사용자가 지번 주소를 선택했을 경우(J)
          fullAddr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
        if(data.userSelectedType === 'R') {
          //법정동명이 있을 경우 추가한다.
          if(data.bname !== '') {
            extraAddr += data.bname;
          }
          // 건물명이 있을 경우 추가한다.
          if(data.buildingName !== '') {
            extraAddr += (extraAddr !== '' ? ', '
              + data.buildingName
              : data.buildingName);
          }
          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
          fullAddr += (extraAddr !== '' ? ' ('
            + extraAddr + ')' : '');
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('new-street-address').value = fullAddr;
        document.getElementById('new-zipcod-address').value = data.zonecode; //5자리 새우편번호 사용

        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('new-detail-address').focus();
      }
    }).open();
  }
       
  /* 유효성 검사 */
  function eventRegist(){
    document.getElementById('newPW').onkeyup = function(){
      var val = this.value;
      passwdCheck(val);
      ableJoin();
    }
  
    document.getElementById('confirmNewPW').onkeyup = function(){
      var val = this.value;
      confirmPasswdCheck(val);
      ableJoin();
    }
  
    document.getElementById('new-userEmail').onkeyup = function(){
      var val = this.value;
      emailCheck(val);
    }

    document.getElementById('new-detail-address').onkeyup = function(){
    addressCheck();
    ableJoin();
    }
  }
  /* 비밀번호 체크 */
  function passwdCheck(val) {
      var msg = '';
      var regPasswd = /^(?=.*[a-zA-Z])(?=.*\d).{5,15}$/;
      if(val.length == 0){
        msg = ' ';
        checkpw = 0;
      } else if (val.length > 15 || val.lengh < 5 || !regPasswd.test(val)) {
        msg = '패스워드 길이는 영문, 숫자 포함 5~15자 입니다.';
        document.getElementById('modifyPutPw').style.color = 'red';
        checkpw = 0;
      } else {
        msg = successMessage(val);
        document.getElementById('modifyPutPw').style.color = 'blue';
        checkpw = 1;
      }
      document.getElementById('modifyPutPw').textContent = msg;

      if(val.length == 0){
    	  $('#modifyPutCheckPw').text(' ');
      }else if (val != document.getElementById('confirmNewPW')) {
    	 document.getElementById('modifyPutCheckPw').style.color = 'red';
         checkconfirm = 0;
         $('#modifyPutCheckPw').text('비밀번호와 일치하지 않습니다.');
      }
   }
  
  /* 비밀번호 일치 확인 */
  function confirmPasswdCheck(val){
     var msg = '';
     if(val.length == 0){
       msg = ' ';
       checkconfirm = 0;
     }else if(document.getElementById('newPW').value.length != 0 && val == document.getElementById('newPW').value){
       msg = ' 비밀번호와 일치합니다.';
       document.getElementById('modifyPutCheckPw').style.color = 'blue';
       checkconfirm =1;
     }else {
       msg = ' 비밀번호와 일치하지 않습니다.';
       document.getElementById('modifyPutCheckPw').style.color = 'red';
       checkconfirm =0;
     }
     document.getElementById('modifyPutCheckPw').textContent = msg;
  }
  
  /* 이메일 유효성, 중복 체크*/
  function emailCheck(val){
    var msg = '';
    var regEmail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
    if(val.length == 0){
      msg = ' ';
      checkemail = 0;
    }else if(!regEmail.test(val)){
      msg = '이메일 형식에 맞게 입력해주세요.';
      document.getElementById('modifyPutEmail').style.color = 'red';
      checkemail= 0;
      }else {
         msg = successMessage(val);
         document.getElementById('modifyPutEmail').style.color = 'blue';
         checkemail=1;
      }
      document.getElementById('modifyPutEmail').textContent = msg;
  }
  /* 사용 가능 알림 */
  var successMessage = function(val) {
      return ' 사용 가능합니다.';
  }
  
  /* 주소 공백 확인 */
  function addressCheck(){
	var addressFlag = 0;
  	var zip = document.getElementById('new-zipcod-address').value;
  	var street = document.getElementById('new-street-address').value;
  	var detail = document.getElementById('new-detail-address').value;
      
  	if(zip.length != 0 && street.length != 0 && detail.length != 0){
	  checkAddress = 1;
    }
  }

  /* 유효성 확인 후 join 버튼 활성화 */
  function ableJoin(){
	if(document.querySelector('.emailCheck').disabled){
   	  if(checkpw == 1 && checkconfirm == 1 &&  checkAddress == 1 && checkemail==1){
    	document.querySelector(".modify").disabled = false;
        }else {
          document.querySelector(".modify").disabled = true;
      }
  	}
  }
  </script>
</body>
</html>