<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="site-navbar" role="banner">
  <div class="site-navbar-top">
    <div class="container">
      <div class="row align-items-center">   
        <div class="col-6 col-md-4 order-2 order-md-1">         
        </div>
        <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
          <div class="site-logo">
            <a href="/eterna.mall" class="js-logo-clone">Shoppers</a>
          </div>
        </div>

        <div class="col-6 col-md-4 order-3 order-md-3 text-right">
          <div class="site-top-icons">
            <ul>
              <li><a href="/user/myPage.mall"><span class="icon icon-person"></span></a></li>
              <li>
                <a href="/cart.mall" class="site-cart">
                  <span class="icon icon-shopping_cart"></span>
                  <span class="count">2</span>
                </a>
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
      <ul class="site-menu js-clone-nav d-none d-md-block">
        <li class="has-children active">
          <a href="/eterna.mall">Home</a>
        </li>
        <li><a href="/product.mall">Products</a></li>
        <li><a href="/notice.jsp">FAQ</a></li>
        <c:choose>
          <c:when test="${!empty cookie.loginId.value}">
              <li><a id="logout-btn">Logout</a></li>
          </c:when>
          <c:otherwise>
            <li><a id="signup-btn">Join</a></li>
            <li><a id="login-btn">Login</a></li>
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
  </nav>
</header>

