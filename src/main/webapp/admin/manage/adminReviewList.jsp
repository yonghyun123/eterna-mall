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
<!-- 페이지 전체 -->
<body id="page-top">

   <jsp:include page="../include/admin_nav.jsp" />

   <div id="wrapper">
      <jsp:include page="../include/admin_side.jsp" />
    <script type="text/javascript">
  document.getElementById("reviewMngBtn").classList.add('active');
  </script>
      <!-- content-wrapper -->
      <div id="content-wrapper">
         <!-- DataTables Example -->
         <div class="card mb-3">
            <div class="card-header">
               <i class="fas fa-table"></i> 후기현황
            </div>
            <div class="card-body">
               <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                     <thead>
                        <tr>
                           <th>id</th>
                           <th>userId</th>
                           <th>productId</th>
                           <th>regdate</th>
                           <th>content</th>
                           <th>score</th>
                           <th>answerFlag</th>
                        </tr>
                     </thead>
                     <tfoot>
                        <tr>
                           <th>id</th>
                           <th>userId</th>
                           <th>productId</th>
                           <th>regdate</th>
                           <th>content</th>
                           <th>score</th>
                           <th>answerFlag</th>
                        </tr>
                     </tfoot>
                     <tbody>
               <c:choose>
                  <c:when test="${not empty list}">
                    <c:forEach var="review" items="${list}" varStatus="status">
                      <tr>
                        <td class="reviewId">${review.id }</td>
                        <td>${review.userId }</td>
                        <td>${review.productId }</td>
                        <td>${review.regdate}</td>
                        <td>${review.content }</td>
                        <td>${review.score }</td>
                        <c:choose>
                        <c:when test="${review.answerFlag == 0}">
                        <td><div>답변대기</div>
                        <button type="button" data-toggle="modal" data-target="#myModal">답변 등록</button>
                        </td>
                        </c:when>
                        <c:when test="${review.answerFlag == 1}">
                        <td>답변완료</td>
                        </c:when>
                        </c:choose>
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
            <div class="card-footer small text-muted">Updated yesterday at
               11:59 PM</div>
         </div>
      <!-- /.container-fluid -->
      <jsp:include page="../include/admin_footer.jsp" />
   </div>
   <!-- content-wrapper -->
   </div>
   <!-- /#wrapper -->
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Answer Review</h4>
        </div>
        <div class="modal-body">
        <input type="hidden" id="reviewIdH">
        <textarea rows="6" cols="60" id="content">Some text..</textarea>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-default" id="submitB">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>
   <!-- 
    Logout Modal
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div> -->

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
   <script src ="../js/adminController.js"></script>
   
  
  <script>
window.onload = function(){
  eventRegist();
}

function eventRegist(){
  
  /*모달 창에 product table의 id 값을 전해줌*/
  $("button[data-target='#myModal']").on("click",function(){
    var id = $(this).closest("tr").find(".reviewId").text();
    document.getElementById("reviewIdH").value = id;
  })
  
  /*모달 창에서 submit 버튼을 눌렀을 시 controller로 전달*/
  document.getElementById("submitB").onclick = function(){
    var id = document.getElementById("reviewIdH").value;
    var content =   encodeURIComponent(document.getElementById("content").value);
    location.href = "/admin/reviewcomment.mall?id="+id+"&content="+content;
  }
}

</script>

</body>

</html>