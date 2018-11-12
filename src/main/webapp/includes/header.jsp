<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% int countOfCart = 0;
int countOfAnswer = 0;
if(request.getAttribute("cartCount") != null){
	countOfCart = (int)request.getAttribute("cartCount");
}
if(request.getAttribute("answerCount") != null){
	countOfAnswer = (int)request.getAttribute("answerCount");
}
%>
<header class="site-navbar" role="banner">
  <div class="site-navbar-top">
    <div class="container">
      <div class="row align-items-center">   
        <div class="col-6 col-md-4 order-2 order-md-1">         
        </div>
        <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
            <a href="/eterna.mall" class="js-logo-clone"><img src="/images/logo1.png" style="width: 250px;"></a>
        </div>

        <div class="col-6 col-md-4 order-3 order-md-3 text-right">
          <div class="site-top-icons">
            <ul>
              <li><a href="/user/myPage.mall"><span class="icon icon-person">
              <%if(countOfAnswer != 0){%>
            	 <img src="/images/new-tag.png" style="margin-left: -30px; margin-top: -55px;">
              <%} %>
              </span>
              </a>
              </li>
              
              <li>
              	<c:choose>
              	
              	<c:when test="${loginId != null }">
                <a href="/cart.mall" class="site-cart">
                  <span class="icon icon-shopping_cart"></span>
                  <span class="count"><%=countOfCart %></span>
                </a>
                </c:when>
           		<c:otherwise>
           		  <a href="/nonUserCartList.mall" class="site-cart">
                  <span class="icon icon-shopping_cart"></span>
                  <span class="count"><%=countOfCart %></span>
                </a>
           		 </c:otherwise>
            </c:choose>  
              </li> 
              <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
            </ul>
          </div> 
        </div>

      </div>
    </div>
  </div> 
  <nav class="site-navigation text-right text-md-center" role="navigation">
    <div class="container">

      <ul class="site-menu js-clone-nav d-none d-md-block" id="topList">
        <li id="homeL"><a href="/eterna.mall">Home</a></li>
        <li id="productsL"><a href="/product.mall">Products</a></li>
        <li id="faqL"><a href="/notice.jsp">FAQ</a></li>
        <c:choose>
          <c:when test="${!empty cookie.loginId.value}">
              <li><a id="logout-btn">Logout</a></li>
          </c:when>
          <c:otherwise>
            <li id="signupL"><a id="signup-btn">Join</a></li>
            <li id="loginL"><a id="login-btn">Login</a></li>
          </c:otherwise>
        </c:choose>
        <li>
          <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left search">
            <form action="" class="site-block-top-search">
              <span class="icon icon-search2"></span>
              <input type="text" class="form-control border-0 search-input" placeholder="Search">
            </form>
          </div>              
        </li>
      </ul>
    </div>
    
    <script>
      	var logout = document.getElementById("logout-btn");
      	var login = document.getElementById("login-button");
      	if(logout) {
        	logout.onclick = function() {
          		window.location.href="/logout.mall"; 
        	} 
      	}     	

    </script>
    <%@ include file="/user/login.jsp"%>
    <%@ include file="/user/signup.jsp"%>
    <%@ include file="/user/modal.jsp"%>
    <%@ include file="/user/order-detail-modal.jsp"%>
  </nav>
</header>

