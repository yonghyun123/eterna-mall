<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/shop.css">
    <link rel="stylesheet" href="/css/header.css">
    <jsp:include page="/includes/header.jsp"></jsp:include>
    
    <script id="template" type="text/template">
            <li class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                   <div class="block-4 text-center border">
                   <figure class="block-4-image">
                      <form id="form{number}" action="/detail.mall" method="post">
                         <a class="images-btn"><img src="/images/{thumnail}" alt="Image placeholder" class="img-fluid"></a>
                         <input type="hidden" name="productId" value="{productId }">
                      </form>
                   </figure>
                   <div class="block-4-text p-4">
                    <h3><a href="shop-single.html">{productBrand}</a></h3>
                    <p class="mb-0">{productDescription }</p>
                    <p class="text-primary font-weight-bold">W{price}</p>
                   </div>
                 </div>
               </li>
</script>

<script type="text/javascript">

$(document).ready(function() {
    eventRegist();
 })
 
 function eventRegist(){
	$("#searchC").on("click", function() {
		searchByCondition();
	    })
}
 
function searchByCondition(){
	
	// 체크박스에 선택된 값들 배열에 담기
	var ageValues = [];
	$("input[name='ages']:checked").each(function(i){
		ageValues.push($(this).val());
	});
	console.log(ageValues);
	ageValues = JSON.stringify(ageValues);
	
	var productValues = [];
	$("input[name='productKind']:checked").each(function(i){
		productValues.push($(this).val());
	});
	productValues = JSON.stringify(productValues);
	
	var minAmount = document.getElementById("minAmount").value;
	var maxAmount = document.getElementById("maxAmount").value;
	var type = $('input[name="type"]').val();	
	$.ajax({
		url:"/conditions.mall",
		type:"post",
		data:{
			ages : ageValues,
			productKind : productValues,
			minAmount : minAmount,
			maxAmount : maxAmount,
			type : type
		},
		dataType : "text",
		success : function(data){
			var jsonListData = JSON.parse(data);
			console.log(jsonListData);
		}
	})
}


</script>
  </head>
  <body>
  
  <div class="site-wrap">


    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-0">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Product<span class="text-black ml-auto">
                
                <c:choose>
                  <c:when test="${not empty count }">
                  (${count })
                  </c:when>
                  </c:choose>
                </span></h2></div>
                <c:choose>
                   <c:when test="${not empty productSex }">
                      &nbsp;${productSex } >
                   </c:when>
                </c:choose>
                <c:choose>
                  <c:when test="${not empty array }">
                  <c:forEach items="${array }" var="item">
                     &nbsp;${item }대 
                  </c:forEach>
                  >
                  </c:when>
                  </c:choose>
                  <c:choose>
                     <c:when test="${not empty  minAmount}">
                        &nbsp;${minAmount }원 ~ ${maxAmount }원 > 
                     </c:when>
                  </c:choose>
                  <c:choose>
                     <c:when test="${not empty  productType}">
                        &nbsp;${productType } > 
                     </c:when>
                  </c:choose>
                  
                  <c:choose>
                     <c:when test="${empty minAmount }">
                     <c:choose>
                     <c:when test="${empty productSex}">
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      정렬
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item" href="#">평점</a>
                      <a class="dropdown-item" href="#">최신등록</a>
                      <a class="dropdown-item" href="#">판매수량</a>
                    </div>
                  </div>
                </div>
                   </c:when>
                   </c:choose>
                     </c:when>
                  </c:choose>
                
              </div>
            </div>
            
            <ul class="row mb-5 product_info">
            
              <c:forEach var="product" items="${productList}" varStatus="status">
            <li class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                   <div class="block-4 text-center border">
                   <figure class="block-4-image">
                      <form id="form${status.index}" action="/detail.mall" method="post">
                         <a class="images-btn"><img src="/images/${product.thumnail}" alt="Image placeholder" class="img-fluid"></a>
                         <input type="hidden" name="productId" value="${product.productId }">
                      </form>
                   </figure>
                   <div class="block-4-text p-4">
                    <h3><a href="shop-single.html">${product.productBrand}</a></h3>
                    <p class="mb-0">${product.productDescription }</p>
                    <p class="text-primary font-weight-bold">W${product.price}</p>
                   </div>
                 </div>
               </li>
              </c:forEach>
              
            </ul>
         
          </div>
        <jsp:include page="/includes/side.jsp"></jsp:include>  
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
  <script src="/js/ajax.js"></script>
  <script type="text/javascript">
  
 
  $('.product_info').paginathing({
      // Limites your pagination number
      // false or number
      limitPagination: 5,
      perPage: 9,
      // Pagination controls
      prevNext: true,
      firstLast: true,
      prevText: '&laquo;',
      nextText: '&raquo;',
      firstText: 'First',
      lastText: 'Last',
      firstClass: 'test_page',
      ulClass: 'pagination custom_pagination',
      liClass: 'test_page page',
      activeClass: 'active',
      disabledClass: 'disabled',
      insertAfter: '.product_info'
    });  
  var imagesBtn = document.querySelectorAll('.images-btn');
  
  imagesBtn.forEach(function(v){
     v.addEventListener('click',function(e){
       console.log(e.target.parentNode.parentNode.id);
       $("#"+e.target.parentNode.parentNode.id).submit();
     })
  })
  </script>
  </body>
</html>