<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Dashboard</title>

<!-- Bootstrap core CSS-->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
  type="text/css">

<!-- Page level plugin CSS-->
<link href="../vendor/datatables/dataTables.bootstrap4.css"
  rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin.css" rel="stylesheet">
<c:choose>
  <c:when test="${empty flag}">
    <script type="text/javascript">
               location.href = "/admin/newinfo.mall";
            </script>
  </c:when>
</c:choose>

</head>
<script type="text/javascript" src="../js/jquery-3.2.0.min.js"></script>

<style>
.nav-link, .card-footer {
   cursor: pointer;
}
</style>
<!-- 페이지 전체 -->
<body id="page-top">

  <jsp:include page="include/admin_nav.jsp" />

  <div id="wrapper">
    <jsp:include page="include/admin_side.jsp" />
    <script type="text/javascript">
               document.getElementById("taskList").classList.add('active');
            </script>
    <!-- content-wrapper -->
    <div id="content-wrapper">
      <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">퀵메뉴</a></li>
          <li class="breadcrumb-item active">상세업무</li>
        </ol>
        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <c:choose>
                  <c:when test="${not empty orderCount}">
                    <div class="mr-5">${orderCount}개의배송대기 중 상품</div>
                  </c:when>
                </c:choose>
              </div>
              <a class="card-footer text-white clearfix small z-1"
                id="orderMngBtn" href="/admin/orderlist.mall">
                <span class="float-left">자세히 보기</span> <span
                class="float-right"> <i
                  class="fas fa-angle-right"></i>
              </span>
              </a>
            </div>
          </div>
          <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <c:choose>
                  <c:when test="${not empty stockCount}">
                    <div class="mr-5">${stockCount}개의재고 부족 상품</div>
                  </c:when>
                </c:choose>
              </div>
              <a class="card-footer text-white clearfix small z-1"
                id="stockMngBtn" href="/admin/stocklist.mall">
                <span class="float-left">자세히 보기</span> <span
                class="float-right"> <i
                  class="fas fa-angle-right"></i>
              </span>
              </a>
            </div>
          </div>
         <!-- <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <c:choose>
                  <c:when test="${not empty newUser}">
                    <div class="mr-5">${newUser}명의새로운 회원</div>
                  </c:when>
                </c:choose>
              </div>
              <a class="card-footer text-white clearfix small z-1"
                id="userMngBtn" href="/admin/userlist.mall">
                <span class="float-left">자세히 보기</span> <span
                class="float-right"> <i
                  class="fas fa-angle-right"></i>
              </span>
              </a>
            </div>
          </div>
           -->
          <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <c:choose>
                  <c:when test="${not empty newQnA}">
                    <div class="mr-5">${newQnA}개의 Q&A 답변 대기글</div>
                  </c:when>
                </c:choose>
              </div>
              <a class="card-footer text-white clearfix small z-1"
                id="qnaMngBtn" href="/admin/qnalist.mall">
                <span class="float-left">자세히 보기</span> <span
                class="float-right"> <i
                  class="fas fa-angle-right"></i>
              </span>
              </a>
            </div>
          </div>
          <div class="col-xl-4 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <c:choose>
                  <c:when test="${not empty newReview}">
                    <div class="mr-5">${newReview}개의 새로운 후기</div>
                  </c:when>
                </c:choose>
              </div>
              <a class="card-footer text-white clearfix small z-1"
                id="reviewMngBtn"
                href="/admin/reviewlist.mall"> <span
                class="float-left">자세히 보기</span> <span
                class="float-right"> <i
                  class="fas fa-angle-right"></i>
              </span>
              </a>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="include/admin_footer.jsp" />
    </div>
    <!-- content-wrapper -->
  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top"> <i
    class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="../vendor/chart.js/Chart.min.js"></script>
  <script src="../vendor/datatables/jquery.dataTables.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="../js/demo/datatables-demo.js"></script>
  <script src="../js/demo/chart-area-demo.js"></script>

  <script src="../js/adminController.js"></script>

</body>

</html>