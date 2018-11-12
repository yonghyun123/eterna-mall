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
              <span class="grade">${user.tierType }</span> <span
                class="name">${user.userName }님</span>
            </div>
            <div class="grade-inform text-black">
              <span class="grade-score">다음 등급까지 ${grade - amount }점
                남았습니다.</span>
            </div>
          </div>
          <ul class="user-saving">
            <li><a href="#" class="saving-link">
                <div class="inner-class">
                  <div class="info-text text-black">적립금</div>
                  <div class="info">
                    <span class="saving-score">${user.userPoint }원</span>
                    <i class="fas fa-angle-right fa-xs"></i>
                  </div>
                </div>
            </a></li>
            <li><a href="#" class="coupon-link">
                <div class="inner-class">
                  <div class="info-text text-black">쿠폰</div>
                  <div class="info">
                    <span class="coupon-quantity">${couponLength }
                      장</span> <i class="fas fa-angle-right"></i>
                  </div>
                </div>
            </a></li>
            <li><a href="#" class="buy-link">
                <div>
                  <div class="info-text text-black">총 구매금액</div>
                  <div class="info">
                    <span class="all-buy-price">${amount } 원</span>
                  </div>
                </div>
            </a></li>
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
                onclick="openCity(event, '주문 내역')" id="defaultOpen">주문
                내역</button>
              <button class="tablinks"
                onclick="openCity(event, '상품 후기')" id="product-review">상품
                후기</button>
              <button class="tablinks" onclick="openCity(event, '적립금')"
                id="user-point">적립금</button>
              <button class="tablinks" onclick="openCity(event, '쿠폰')"
                id="user-coupon">쿠폰</button>
              <button class="tablinks"
                onclick="openCity(event, '개인정보 수정')" id="user-modify">개인정보
                수정</button>
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
                          <th class="order-list-number text-center">주문
                            번호</th>
                          <th class="order-list-info text-center"
                            colspan="5">주문 내용</th>
                          <th class="order-list-status text-center">배송
                            결과</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:set var="startIndex" value="0" />
                        <c:set var="endIndex"
                          value="${orderProductsLength[0].numPurchase - 1}" />
                        <c:set var="orderCountLength"
                          value="${orderCountLength - 1}" />
                        <c:forEach var="index" begin="0"
                          end="${orderCountLength }">
                          <tr class="order-list-row">
                            <td class="order-number text-center"
                              id="${orderAllList[startIndex].orderNumber }">${orderAllList[startIndex].orderNumber }</td>
                            <td colspan="5"
                              class="order-inform text-left">
                              <!-- 상품 이름 및 이미지에 해당 상품 페이지 이동 a태그 걸기 -->
                              <c:forEach var="buy"
                                items="${orderAllList }"
                                begin="${startIndex }"
                                end="${endIndex }" varStatus="x">
                                <img alt="" class="product-thumbnail"
                                  src="/images/${buy.fileName }">
                                <div class="product-text">
                                  <div class="product-name">${buy.productDescription }</div>
                                  <div class="product-price-count">${buy.productPrice }원
                                    / ${buy.count }개</div>
                                </div>
                                <br>
                              </c:forEach>
                            </td>
                            <td class="order-date-flag text-center">${orderAllList[startIndex].orderDate }
                              <br>
                              ${orderAllList[startIndex].orderFlag }
                            </td>
                          </tr>
                          <c:set var="endIndex"
                            value="${startIndex + orderProductsLength[index].numPurchase }" />
                          <c:set var="startIndex"
                            value="${startIndex + orderProductsLength[index].numPurchase }" />
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
                  <div
                    class="col-md-7 site-section-heading text-center pt-4">
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
                    <div class="in-page"></div>
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
                    <p class="h6">상품평 작성시 200원, 포토 상품평 작성시 300원을 적립해
                      드립니다.</p>
                  </div>
                </div>
              </div>
            </div>
            <div id="적립금" class="tabcontent" style="display: none;">
              <div class="container">
                <div class="row justify-content-center">
                  <div
                    class="col-md-7 site-section-heading text-center pt-4">
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
                  <div
                    class="col-md-7 site-section-heading text-center pt-4">
                    <h2>쿠폰</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <table class="table table-hover text-center"
                      id="table-coupon">
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
            <div id="개인정보 수정" class="tabcontent" style="display: none;">
              <div class="container" id="in-mbody"></div>
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
  <script type="my-template" id="modify-body">
<div class="row justify-content-center">
                      <div
                        class="col-md-7 site-section-heading text-center pt-4">
                        <h2>개인정보 수정</h2>
                      </div>
                    </div>
                    <div class="title">
                      <h2>기본정보</h2>
                    </div>
                    <div class="row text-center">
                      <table class="cart-table">
                        <tbody>
                          <tr>
                            <th>아이디</th>
                            <td>{userId}</td>
                          </tr>
                          <tr>
                            <th>새 비밀번호</th>
                            <td><input type="text" id="newPW">
                            </td>
                          </tr>
                          <tr>
                            <th>새 비밀번호 확인</th>
                            <td><input type="text"
                              id="confirmNewPW"></td>
                          </tr>
                          <tr>
                            <th>이름</th>
                            <td>{userName}</td>
                          </tr>
                          <tr>
                            <th>이메일</th>
                            <td><input type="text"
                              id="new-userEmail"
                              placeholder="{userEmail}">
                            </td>
                          </tr>
                          <tr>
                            <th>휴대폰</th>
                            <td>{userInfo.userTel}</td>
                          </tr>
                          <tr>
                            <th rowspan="3">주소</th>
                            <td><input type="text"
                              id="new-zipcod-address"
                              placeholder="{userZipcode}">
                              <input type="button"
                              class="btn btn-success"
                              onclick="daumPostcode()" value="search"></td>
                          </tr>
                          <tr>
                            <td><input type="text"
                              id="new-street-address"
                              placeholder="{userStreetAddress}">
                            </td>
                          </tr>
                          <tr>
                            <td><input type="text"
                              id="new-detail-address"
                              placeholder="{userDetailAddress}">
                            </td>
                          </tr>
                          <tr>
                            <th>회원가입 날짜</th>
                            <td>{userRegdate}</td>
                          </tr>
                        </tbody>
                      </table>
                      <input type="button"
                        class="btn btn-success" onclick="modify()" value="수정">
                    </div>
</script>
  <script type="my-template" id="confirm-body">
<div class="row justify-content-center">
                      <div
                        class="col-md-7 site-section-heading text-center pt-4">
                        <h2>비밀번호 재확인</h2>
                        <br>
                        <h4>
                          회원님의 정보를 안전하게 보호하기 위해 <br>비밀번호를 다시 한번
                          확인해주세요
                        </h4>
                      </div>
                    </div>
                    <div class="row text-center">
                      <div class="container">
                        <div class="field_pw">
                          <div class="tit_id">아이디</div>
                          <span class="txt_id">${user.userId }</span>
                          <div class="tit_pw">비밀번호</div>
                          <div>
                            <input type="password"
                              name="confirm_password"
                              id="confirm_password" class="col-md-3">
                          </div>
                        </div>
                        <div class="group_btn">
                          <span class="inner_groupbtn">
                            <button class="btn btn-primary btn-sm"
                              id="confirmPasswdBtn">확인</button>
                          </span>
                        </div>
                      </div>
                    </div>
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

					tablinks[i].className = tablinks[i].className.replace(
							"active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";

				if (evt.currentTarget.id == 'product-review') {
					$.ajax({
						url : "/reviewlist.mall",
						type : "get",
						dataType : "text",
						success : function(data) {
							var jsonReviewData = JSON.parse(data);
							reviewTemplate(jsonReviewData);
						}
					});
				}

				if (evt.currentTarget.id == 'user-coupon') {
					$.ajax({
						url : "/user/coupon.mall",
						type : "get",
						dataType : "text",
						success : function(data) {
							var jsonCouponData = JSON.parse(data);
							couponTemplate(jsonCouponData);
						}
					});

				}
				if (evt.currentTarget.id == 'user-modify') {
					var templateHtml = document.querySelector('#confirm-body').innerHTML;
					var originHtml = document.querySelector('#in-mbody');
					originHtml.innerHTML = templateHtml;
				}
			}

			function reviewTemplate(reviewData) {
				var templateHtml = document.querySelector('#review-body').innerHTML;
				var originHtml = document.querySelector('#in-rbody');
				var newHtml = '';
				reviewData.forEach(function(v, i) {
					var scoreFormat = Number(v.score) * 20;
					scoreFormat + '%';
					newHtml += templateHtml.replace('{number}', i + 1).replace(
							'{subject}', v.subject).replace('{userId}',
							v.userId).replace('{regdate}', v.regdate).replace(
							'{score}', scoreFormat).replace('{content}',
							v.content);

				});
				originHtml.innerHTML = newHtml;

				$(".plusIcon").on("click", function() {
					var obj = $(this);
					if (obj.hasClass("glyphicon-plus")) {
						obj.hide();
						obj.next().show();
						obj.parent().parent().next().show();
					} else {
						obj.hide();
						obj.prev().show();
						obj.parent().parent().next().hide();
					}
				});
			}

			function couponTemplate(couponData) {
				var templateHtml = document.querySelector('#coupon-body').innerHTML;
				var originHtml = document.querySelector('#in-cbody');
				var newHtml = '';
				couponData.forEach(function(v, i) {
					newHtml += templateHtml.replace('{couponId}', v.couponId)
							.replace('{couponName}', v.couponName).replace(
									'{couponRate}', v.couponRate).replace(
									'{useFlag}', v.useFlag).replace(
									'{couponDate}', v.couponDate);

				});
				originHtml.innerHTML = newHtml;
			}

			var orderList = document.querySelectorAll(".order-number");
			for (var i = 0; i < orderList.length; i++) {
				orderList[i].addEventListener('click', function(event) {
					alert(this.id);
					/* $.ajax({
					    url:   
					}) */
				});
			}

			$(document).on("click","#confirmPasswdBtn",function(event) {
						var inputPW = "inputPW=" + document.getElementById('confirm_password').value;
						console.log(inputPW);
						$.ajax({
							url : "/user/updateInfo.mall",
							type : "get",
							dataType : "text",
							data :  inputPW,
							success : function(data) {
								var jsonModifyData = JSON.parse(data);
								modiftTemplate(jsonModifyData);
							}
						});
					});
			function modiftTemplate(jsonModifyData) {
				var templateHtml = document.querySelector('#modify-body').innerHTML;
				var originHtml = document.querySelector('#in-mbody');
				var newHtml = '';
				jsonModifyData.forEach(function(v, i) {
					newHtml = templateHtml.replace('{userId}', v.userId)
							.replace('{userName}', v.userName).replace(
									'{userEmail}', v.userEmail).replace(
									'{userZipcode}', v.userZipcode).replace(
									'{couponDate}', v.couponDate).replace(
									'{userStreetAddress}', v.userStreetAddress).replace(
									'{userDetailAddress}', v.userDetailAddress).replace(
									'{userRegdate}', v.userRegdate).replace(
									'{userTel}', v.userTel);

				});
				originHtml.innerHTML = newHtml;
			}
			function daumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
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
								if (data.userSelectedType === 'R') {
									//법정동명이 있을 경우 추가한다.
									if (data.bname !== '') {
										extraAddr += data.bname;
									}
									// 건물명이 있을 경우 추가한다.
									if (data.buildingName !== '') {
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
								document.getElementById('new-detail-address')
										.focus();
							}
						}).open();
			}
// 			modifyBtn.addEventListener('click', function() {
// 				var zipcode = $('#new-zipcod-address').val();
// 				var street = $('#new-street-address').val();
// 				var detailAddr = $('#new-detail-address').val();
// 				var fullAddress = zipcode + '/' + street + '/' + detailAddr;
				//        var tem = $('new-zipcod-address').prop('placeholder');
				//        console.log(tem); 
				//        var email = 
// 			});
		</script>
</body>
</html>