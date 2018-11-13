<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="../vendor/bootstrap/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css"
  rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="../vendor/datatables/dataTables.bootstrap4.css"
  rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin.css" rel="stylesheet">


</head>
<script type="text/javascript" src="../js/jquery-3.2.0.min.js"></script>

<style>
.nav-link, .card-footer {
  cursor: pointer;
}
</style>
<script>
  $(document).ready(function(){
    $('.details').click(function(){
      viewOrderListDetails(this);
    });
  }) 
  
  function viewOrderListDetails(value){
    var userId = $(value).parents()[1].childNodes[3].innerHTML;

      $.ajax({
         url: "/admin/userview.mall",
         type:"get",
         data: {
           userId: userId
         },
         dataType:"text",
         success: function(data){
        	 console.log(data);
           var jsonDetailData = JSON.parse(data);
           	console.log(jsonDetailData);
           modalview(jsonDetailData);
         }
        });
  }
  
  function modalview(detailDate){
      var templateHtml = document.querySelector('#modal-table').innerHTML;
      var originHtml = document.querySelector('#modal-content');
      var newHtml = '';
      newHtml += templateHtml.replace('{userId}', detailDate.userId)
       .replace('{userName}', detailDate.userName)
       .replace('{userEmail}', detailDate.userEmail)
       .replace('{userAddress}', detailDate.userAddress)
       .replace('{userTel}', detailDate.userTel)
       .replace('{tierId}', detailDate.tierId)
       .replace('{userGrade}', detailDate.userGrade)
       .replace('{userPoint}', detailDate.userPoint)
       .replace('{userRegdate}', detailDate.userRegdate)
       .replace('{rcmdOne}', detailDate.rcmdOne)
       .replace('{rcmdTwo}', detailDate.rcmdTwo)
       .replace('{rcmdThree}', detailDate.rcmdThree);
      
      originHtml.innerHTML = newHtml;
  }
</script>

  <script id="modal-table" type="text/template">
  <div class="modal-header">
     <h4 class="modal-title">회원상세</h4>
       <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
  <div class="modal-body" id="modal-body">  
<table>
      <tr>
              <th>Name</th>
              <th>Content</th>
            </tr>
            <tr>
              <td>UserId</td>
              <td>{userId}</td>
            </tr>
            <tr>
              <td>UserName</td>
              <td>{userName}</td>
            </tr>
            <tr>
              <td>UserEmail</td>
              <td>{userEmail}</td>
            </tr>
            <tr>
              <td>UserAddress</td>
              <td>{userAddress}</td>
            </tr>
            <tr>
              <td>UserTel</td>
              <td>{userTel}</td>
            </tr>
            <tr>
              <td>Tier</td>
              <td>{tierId}</td>
            </tr>
            <tr>
              <td>UserGrade</td>
              <td>{userGrade}</td>
            </tr>
            <tr>
              <td>UserPoint</td>
              <td>{userPoint}</td>
            </tr>
            <tr>
              <td>UserRegdate</td>
              <td>{userRegdate}</td>
            </tr>
            <tr>
              <td>RecommFirst</td>
              <td>{rcmdOne}</td>
            </tr>
            <tr>
              <td>RecommSecond</td>
              <td>{rcmdTwo}</td>
            </tr>
            <tr>
              <td>RecommThird</td>
              <td>{rcmdThree}</td>
            </tr>


</table>
</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default">SAVE</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
</script>
<!-- 페이지 전체 -->
<body id="page-top">

  <jsp:include page="/admin/include/admin_nav.jsp" />

  <div id="wrapper">
    <jsp:include page="/admin/include/admin_side.jsp" />
    <script type="text/javascript">
  document.getElementById("userMngBtn").classList.add('active');
  </script>
    <!-- content-wrapper -->
    <div id="content-wrapper">
      <!-- DataTables Example -->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fas fa-table"></i> User List
        </div>
        <div class="card-body">
           <jsp:include page="../include/common_modal_form_common.jsp" />
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable"
              width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Num</th>
                  <th>User ID</th>
                  <th>User Name</th>
                  <th>User Address</th>
                  <th>User Tel</th>
                  <th>User Email</th>
                  <th>User Regdate</th>
                  <th>User Tier</th>
                  <th>details</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Num</th>
                  <th>User ID</th>
                  <th>User Name</th>
                  <th>User Address</th>
                  <th>User Tel</th>
                  <th>User Email</th>
                  <th>User Regdate</th>
                  <th>User Tier</th>
                  <th>details</th>
                </tr>
              </tfoot>
              <tbody>
                <c:choose>
                  <c:when test="${not empty list}">
                    <c:forEach var="user" items="${list }"
                      varStatus="status">
                      <tr>
                        <td>${status.count}</td>
                        <td>${user.userId }</td>
                        <td>${user.userName }</td>
                        <td>${user.userAddress }</td>
                        <td>${user.userTel}</td>
                        <td>${user.userEmail }</td>
                        <td>${user.userRegdate }</td>
                        <td>${user.tierId}</td>
                        <td><button type="button" class="details" data-toggle="modal" data-target="#myModal">회원상세</button></td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="5">회원이 존재하지 않습니다.</td>
                    </tr>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated
          yesterday at 11:59 PM</div>
      </div>

      <jsp:include page="/admin/include/admin_footer.jsp" />
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
  
  <!-- 사이드 바에서 메뉴 선택시 -->
  <script src="../js/adminController.js"></script>

</body>

</html>