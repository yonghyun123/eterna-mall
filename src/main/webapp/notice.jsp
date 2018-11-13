<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Eterna &mdash; Most Valuable Cosmetic</title>

<link rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/fonts/icomoon/style.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet"href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"crossorigin="anonymous">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/shop_single.css">
<link rel="stylesheet" href="/css/notice.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">

<link rel="icon" href="/images/lipstick.png">
<link rel="apple-touch-icon" href="/images/lipstick.png">

<jsp:include page="/includes/header.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
     <div class="container">
       <a href="#"><i class="far fa-arrow-alt-circle-up"></i></a>
       <div class="row">
       <div class="col-md-12 mb-5">
           <div class="container">
             <div class="row justify-content-center">
               <div
                 class="col-md-7 site-section-heading text-center pt-4">
                 <h2>FAQ</h2>
                 <p class="h6">자주하는 질문</p>
                 <p class="h6">고객님들께서 자주하시는 질문들을 모두 모았습니다.</p>
               </div>
             </div>
             <div class="row">
               <div class="container">
                 <table class="table table-hover col-md-12" id="table-faq">
                   <thead>
                     <tr>
                       <th>번호</th>
                       <th>제목</th>
                     </tr>
                   </thead>
                   <tbody>
                      <tr>
                        <td>1</td>
                      	<td class="title"> 내가 주문한 내역은 어떻게 확인하나요? 
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display:none;">
                      	<td colspan="3">
                        1 . Eterna 회원이신 경우<br> 
                                                      로그인 후, 홈페이지 상단 우측의 사람 모양 이미지 &gt; 주문 내역 <br> 
                                                      에서 해당 주문번호를 눌러 확인 가능합니다. <br> <br>
                        2. 비회원 주문인 경우<br>
                                                      홈페이지 상단 우측의 사람 모양 이미지를 눌러 <br> 
                                                      주문번호와 비밀번호를 입력하여  확인 가능합니다. <br>
                        </td>
                      </tr>
                      <tr>
                        <td>2</td>
                      	<td class="title"> (회원) 쿠폰 적용은 어떻게 하나요? 
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                      	<td colspan="3">
                                                     주문서 (Payment) 에서 쿠폰 적용을 눌러 조회하신 후 [선택]버튼을 눌러 적용할 수 있습니다.<br> 
                                                     한 주문건에 쿠폰은 한 장만 사용가능합니다. <br> 
                                                     쿠폰별로 할인율이 다르니, 참고하시어 사용하세요.  <br> <br>
                        </td>
                      </tr>
                      <tr>
                        <td>3</td>
                      	<td class="title"> (회원) 적립금 적용은 어떻게 하나요? 
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                      	<td colspan="3">
                                                     주문서 (Payment) 에 적립금 사용 칸에 1원 단위로 적용이 가능합니다.<br> 
                                                     서 사용가능한 적립금 조회하신 후 사용할 적립금을 입력하여 적용할 수 있습니다. <br> 
                                                     적립금이 0원이거나, 보유한 적립금을 초과하여 적용하실 수 없습니다.  <br> <br>
                        </td>
                      </tr>
                      <tr>
                        <td>4</td>
                      	<td class="title"> 할인 된 금액은 어디서 확인할 수 있나요?
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                      	<td colspan="3">
                                                     할인 된 금액은 결제 전 주문서(Payment)에서 확인가능하며,<br> 
                                                      마이페이지의 주문 상세보기 에서 확인하실 수 있습니다 <br> 
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                                                     주문서 (Payment) 에 적립금 사용 칸에 1원 단위로 적용이 가능합니다.<br> 
                                                     서 사용가능한 적립금 조회하신 후 사용할 적립금을 입력하여 적용할 수 있습니다. <br> 
                                                     적립금이 0원이거나, 보유한 적립금을 초과하여 적용하실 수 없습니다.  <br> <br>
                        </td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td class="title"> 할인 된 금액은 어디서 확인할 수 있나요?
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                                                     할인 된 금액은 결제 전 주문서(Payment)에서 확인가능하며,<br> 
                                                     마이페이지의 주문 상세보기 에서 확인하실 수 있습니다 <br> 
                                                     상단 우측의 마이페이지  &gt; 주문내역  &gt; 주문번호 클릭
                       </td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td class="title"> 주문이 안 됩니다.
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                                                     주문이 안 되는 경우,<br> 
                                                     모든 인터넷 창을 종료 후, Eterna 홈페이지 재접속 후에 다시 로그인해주세요 <br>  <br> 
                                                     공용 PC의 경우 방화벽이 높게 설정되어 있을 경우, 결제가 어려울 수 있습니다.<br>  <br> 
                                                     재로그인, 재접속 이후에도 동일한 문제가 발생하실 경우, 고객센터(033-111-2222)에 문의를 남겨주세요<br> 
                       </td>
                       </tr><tr>
                        <td>7</td>
                        <td class="title"> 적립금은 어떻게 쌓을 수 있나요?
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                                                     적립금은 주문 결제와 주문 결제 후, 후기 작성을 통해 쌓을 수 있습니다.<br> <br>  
                        1. 주문 결제 적립금 : 각 주문건의 0.1%의 적립율을 곱한 금액으로 지급됩니다. <br> 
                        2. 후기 작성 : 주문 결제 후, 후기 작성을 통해 200원의 적립금이 지급됩니다.<br>
                       </td>
                       </tr>
                       <tr>
                        <td>8</td>
                        <td class="title"> 회원가입은 무료인가요?
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                        Eterna 배송지역 상관없이 회원가입은 무료입니다.<br> 
                                                      회원가입 후 다양한 상품과 혜택을 만나보세요! <br> 
                       </td>
                       </tr>
                       <tr>
                        <td>9</td>
                        <td class="title"> 비회원 주문내역에 대한 실적 합산이 가능한가요?
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                                                      비회원으로 구매하신 내역은 실적 합산이 불가합니다<br>  
                                                      주문하시기 전 회원가입 하셔서 적립금도 쌓고 더 많은 혜택을 누리세요!<br> 
                       </td>
                       </tr>
                       <tr>
                        <td>10</td>
                        <td class="title"> 상품 후기는 어떻게 남길 수 있나요?
                        <span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
                        <span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
                        </td>
                      </tr>
                      <tr style="display: none;">
                        <td colspan="3">
                                                      구매하신 상품에 한해 상품 후기를 남길 수 있습니다<br>   
                                                      구매하신 상품 상세보기  &gt; 제품 리뷰 &gt; 리뷰 등록<br> 
                       </td>
                       </tr>
                   </tbody>
                 </table>
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
  <script src="/js/paginathing.js"></script>
  <script>

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
	
  $('#faqL').addClass('active');
     
      </script>
</body>
</html>