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
                <div class="float-md-left mb-4"><h2 class="text-black h5">Product<span class="text-black ml-auto" id="countS">
                <c:choose>
                  <c:when test="${not empty count }">
                  (${count })
                  </c:when>
                  </c:choose>
                </span></h2></div>
                <div id="insertCondition">
                </div>
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto" id="dropDown">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	 정렬
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item">평점</a>
                      <a class="dropdown-item">최신등록</a>
                      <a class="dropdown-item">판매수량</a>
                    </div>
                  </div>
                </div>
                 
                
              </div>
            </div>
            
            <ul class="row mb-5 product_info" id="insertUl">
            
              <c:forEach var="product" items="${productList}" varStatus="status">
            <li class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                   <div class="block-4 text-center border" style="width:220px; height:380px;">
                   <figure class="block-4-image">
                      <form id="form${status.index}" action="/detail.mall" method="post">
                         <a class="images-btn"><img src="/images/${product.thumnail}" alt="Image placeholder" class="img-fluid" style="width: 80px; height:200px;"></a>
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
  <script src="/js/shop.js"></script>
  <script id="templateList" type="text/template">
            <li class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                   <div class="block-4 text-center border" style="width:220px; height:380px;">
                   <figure class="block-4-image">
                      <form id="form{number}" action="/detail.mall" method="post">
                         <a class="images-btn"><img src="/images/{thumnail}" alt="Image placeholder" class="img-fluid" style="width: 80px; height:200px;"></a>
                         <input type="hidden" name="productId" value="{productId}">
                      </form>
                   </figure>
                   <div class="block-4-text p-4">
                    <h3><a href="shop-single.html">{productBrand}</a></h3>
                    <p class="mb-0">{productDescription}</p>
                    <p class="text-primary font-weight-bold">W{price}</p>
                   </div>
                 </div>
               </li>
</script>

 <script id="templateCount" type="text/template">
        <span class="text-black ml-auto" id="countS">
                  ({count})
                </span>
</script>

  </body>
</html>