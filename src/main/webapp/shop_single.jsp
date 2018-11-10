<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/shop_single.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/style.css">


<jsp:include page="/includes/header.jsp"></jsp:include>
</head>
<body>
  <div class="site-wrap">
    
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
            <a href="/index.jsp">Home</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">${selectProduct.productDescription }</strong>
          </div>
        </div>
      </div>
    </div>
    <div class="site-section">
    <c:forEach var="imageList" items="${imageList}" varStatus="status">

    </c:forEach>
    
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="/images/${imageList[0].fileName}" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-6">
            <h2 class="text-black">${selectProduct.productDescription }</h2>
            <div class="mb-5">
              <p>
                <strong class="text-black h5">Price </strong>
                 <strong class="text-primary h4" id="product-price">${selectProduct.price }</strong>
              </p>
              <p>배송비 : 3,000원 (30,000원 이상 무료배송)</p>
              <div class="input-group mb-3" style="max-width: 120px;">
                <div class="input-group-prepend">
                  <button class="btn btn-outline-primary js-btn-minus modify-count" type="button">&minus;</button>
                </div>
                <input type="text" id="product-count" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                <div class="input-group-append">
                  <button class="btn btn-outline-primary js-btn-plus modify-count" type="button">&plus;</button>
                </div>
              </div>
              <p>
                <strong class="text-black h5">Total Price </strong>
                 <strong class="text-primary h4" id="total-price">${selectProduct.price}</strong>
              </p>
              <p>
                <input type="button" class="buy-now btn btn-sm btn-primary" value="Add Cart" id="add-cart-btn">
                <input type="button" class="buy-now btn btn-sm btn-primary" value="Order Now" id="order-now-btn">
              </p>
            </div>
          </div>
        </div>
      </div>
      
      
      <div class="site-section block-3 site-blocks-2 bg-light">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-7 site-section-heading text-center pt-4">
              <h2>제품 상세 설명</h2>
            </div>
          </div>
          <div class="row image-row">
            <div class="col-md-12">
              <img src="/images/${imageList[1].fileName}" alt="Image placeholder"
                class="img-fluid detail">
            </div>
          </div>
        </div>
      </div>
      <div class="site-section block-3 site-blocks-2 bg-light">
        <div class="container">
          <a href="#"><i class="far fa-arrow-alt-circle-up"></i></a>
          <div class="row">
          <div class="col-md-12">
            <div class="tab" id="tab">
              <button class="tablinks active" onclick="openCity(event, '제품 리뷰')" id="defaultOpen">제품리뷰</button>
              <button class="tablinks" onclick="openCity(event, '상품 문의')" id="product-qNa">상품 문의</button>
              
            </div>
            <div id="제품 리뷰" class="tabcontent" style="display: block;">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>제품 리뷰</h2>
                  </div>
                </div>
                <div class="row">
                  <div class="container">
                    <input type="button" value="리뷰등록" class="btn btn-outline-primary js-btn-plus create" id="review-create">
                    <table class="table table-hover " id="table-review">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>등록일자</th>
                        </tr>
                      </thead>
                      <tbody id="in-tbody">
                      <!-- 여기에 리뷰 내용들어가야해 -->
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
                    <input type="submit" value="등록" class="btn btn-outline-primary js-btn-plus create" id="qna-create">					
                    </div>
                    <table class="table table-hover col-md-12" id="table-qNa">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>등록일자</th>
                        </tr>
                      </thead>
                      <tbody id="qNa-body">
                      <!-- qNa body -->
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
  <script type="my-template" id="qna-detail-body">
<tr>
	<td class="title">
		{number}
	</td>
	<td class="title">
		{subject}
		<span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
		<span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
	</td>
	<td class="title">
		{userId}
	</td>
	<td class="title">
		{regdate}
	</td>
</tr>
<tr style='display:none;'>
	<td colspan="4">{content}</td>
</tr>
  </script>
  
  <script type="my-template" id="review-body">
<tr>
	<td class="title">
		{number}
	</td>
	<td class="title">
		{subject}
		<span class="open-close glyphicon glyphicon-plus plusIcon">상세보기</span>
		<span class="open-close glyphicon glyphicon-minus plusIcon" style="display:none">닫기</span>
	</td>
	<td class="title">
		{userId}
	</td>
	<td class="title">
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
  <script type="my-template" id="qna-body">
<tr>
	<td class="title">
		{number}
	</td>
	<td class="title">
		{subject}
	</td>
	<td class="title">
		{userId}
	</td>
	<td class="title">
		{regdate}
	</td>
</tr>
<tr style='display:none;'>
	<td colspan="4">{content}</td>
</tr>
  </script>
  <script>
  var loginId = "${cookie.loginId.value}";
  var productId = ${selectProduct.productId};
  var lickBtn =  document.querySelectorAll('.modify-count');
 
  $(document).on('click','.modify-count',function(){
	  insertText();
  });
  
  document.getElementById("defaultOpen").click();
  
  $.ajax({
	 url: "/reviewlist.mall",
	 type:"get",
	 data: {
		 productId: productId
	 },
	 dataType:"text",
	 success: function(data){
		 var jsonReviewData = JSON.parse(data);
		 reviewTemplate(jsonReviewData);
	 }
  });
  
  reviewCreateBtn();
  settingHiddenValue();
  addCartAjax();
  orderBtnClicked();
  /* order 버튼 클릭 이벤트 form동적 생성후 데이터 post */
 	
  function orderBtnClicked(){
	  var orderBtn = document.querySelector('#order-now-btn');
	  orderBtn.addEventListener('click', function(){
		  var productCount = $('#product-count').val();
          var form = document.createElement("form");
          form.setAttribute("charset", "UTF-8");
          form.setAttribute("method", "Post");
          form.setAttribute("action", "/order.mall");

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
          
          form.appendChild(hiddenProductId);
          form.appendChild(hiddenProductCount);
          document.body.appendChild(form);
          form.submit(); 
	  });
  }
  
  /* 리뷰등록 및 QnA등록 버튼 이벤트*/
  function reviewCreateBtn(){
	  var reviewBtn = document.querySelector('#review-create');
	  var qnaBtn = document.querySelector('#qna-create');
	  
	  reviewBtn.addEventListener('click', function(){
		  checkBuyerInfoAjax();
	  });
	  qnaBtn.addEventListener('click', function(){
		  
		  sendQnACreate();
	  })
  }
  /*장바구니에 담을 때 ajax 요청으로 이미 담겨있는지 파악 후 add */
  function addCartAjax(){
	  $('#add-cart-btn').on('click',function(){
		  var productCount = $('#product-count').val();
		  $.ajax({
			 url: "/addcart.mall",
			 type:"post",
			 data: {
				 productId: productId,
				 userId: loginId,
				 productCount: productCount
			 },
			 dataType:"text",
			 success: function(data){
				showCartAddModal(data);
				console.log(data);
			 }
		  }); 
	  })
  }
  
  /* 장바구니 버튼처리하는 기능메서드 (이미 담겨있다면 다이얼로그, 담겨있지 않다면 토스트) */
  function showCartAddModal(data){
	  if(loginId){
		  // 카트에 담는걸 성공했을때
		  if(data == 1){
			  $('#cart-succ-modal').modal();
		  } else {
			  //이미 담겨있을때
			  $('#cart-dup-modal').modal();
		  }
	  } else {
		  //비회원이 장바구니에 담을때 로직처리해야해---------
	  }

  }
  
  /* q&a 등록 버튼을 눌렀을때 hidden으로 유저 id와 productId를 넘김  */
  function settingHiddenValue(){
	  $('#qna-userId').val(loginId);
	  $('#qna-productId').val(productId);
	  if(!loginId){
		  $('#qna-create').attr('disabled', true);
	  } else {
		  $('#qna-create').attr('disabled', false);
	  }
  }
  
  function sendQnACreate(){
	  $("#qna-modal").modal();
  }
  
  function checkBuyerInfoAjax(){
	  $.ajax({
			 url: "/reviewCheck.mall",
			 type:"get",
			 data: {
				 userId: loginId,
				 productId: productId
			 },
			 dataType:"text",
			 success: function(data){
				 if(data == 1){
					 //modal
					 console.log('적합한 회원입니다.');
				     $("#review-modal").modal();						 
				 } else {
					 alert('상품을 구매하지 않았습니다');
				 }
			 }
	  })
  }
  

  function insertText(){
	  var count = document.querySelector('#product-count').value;
	  var productPrice = document.querySelector('#product-price').innerText;
	  const totalPrice = Number(productPrice) * Number(count);
	  $('#total-price').text(totalPrice);
  }


  function reviewTemplate(reviewData){
	  var templateHtml = document.querySelector('#review-body').innerHTML;
	  var originHtml = document.querySelector('#in-tbody');
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
        
        if(evt.currentTarget.id == 'product-qNa'){
        	$.ajax({
        		 url: "/qnalist.mall",
        		 type:"get",
        		 data: {
        			 productId: productId
        		 },
        		 dataType:"text",
        		 success: function(data){
        			 var jsonQnAData = JSON.parse(data);
        			 qnaTemplate(jsonQnAData);
        		 }
        		 
        	 });
        }
     }
       
     function qnaTemplate(jsonQnAData){
   	  	var secretHtml = document.querySelector('#qna-body').innerHTML;
  		  var generalHtml = document.querySelector('#qna-detail-body').innerHTML;
		  var originHtml = document.querySelector('#qNa-body');
		  
		  var newHtml = '';
		  jsonQnAData.forEach(function(v,i){
		  /* 일반글일때 */
		 	 if(v.secretFlag == '0'){
				  newHtml += generalHtml.replace('{number}', i+1)
					 .replace('{subject}', v.subject)
					 .replace('{userId}', v.userId)
					 .replace('{regdate}', v.regdate)
					 .replace('{content}', v.content);
			  } else if(v.secretFlag == '1'){
				  /* 비밀글일때 조건이 userId와 쿠키와 가으면 generalHtml로 만들어줌 */
				  if(v.userId == loginId){
					  newHtml += generalHtml.replace('{number}', i+1)
						 .replace('{subject}', v.subject+'[비밀글]')
						 .replace('{userId}', v.userId)
						 .replace('{regdate}', v.regdate)
						 .replace('{content}', v.content);
				  }else {
					  newHtml += secretHtml.replace('{number}', i+1)
						 .replace('{subject}', v.subject+'[비밀글]')
						 .replace('{userId}', v.userId)
						 .replace('{regdate}', v.regdate)
						 .replace('{content}', v.content);
				  }
	
			  }
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
     </script>
</body>
</html>
<%@ include file="reviewModal.jsp" %>
<%@ include file="qnaModal.jsp" %>
<%@ include file="cart/cartDupModal.jsp" %>
<%@ include file="cart/cartSuccessModal.jsp" %>
