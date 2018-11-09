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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<script type="text/javascript">
$(document).ready(function() {
    eventRegist();
 })

 function eventRegist() {
    $("button[data-target='#myModal']").on("click", function() {
       viewOrderListDetails(this);
       var id = $(this).closest("tr").find(".orderId").text();
        document.getElementById("orderIdH").value = id;
        var status = $(this).closest("tr").find(".status").text();
        document.getElementById("orderFlag").value = status;
        statusChange(status);
    })

    document.getElementById("saveB").onclick = function() {
       updateStatus();
    }
 }
 
 function statusChange(status){
    if(status == '배송전'){
       document.getElementById("orderFlag").value = 0;
    }
    if(status == '배송중'){
       document.getElementById("orderFlag").value = 1;
    }
    if(status == '배송완료'){
       document.getElementById("orderFlag").value = 2;
    }

 }
 /* 상세보기 클릭 시 데이터를 받음*/
function viewOrderListDetails(value) {
    var orderNum = $(value).closest("tr").find(".orderId").text();
    $.ajax({
       url : "/admin/orderview.mall",
       type : "get",
       data : {
          orderNum : orderNum
       },
       dataType : "text",
       success : function(data) {
          var jsonDetailData = JSON.parse(data);
          modalview(jsonDetailData);
       }
    });
 }

 /* 템플릿에 데이터 넣음*/
 function modalview(detailData) {
     var templateHtml = document.querySelector('#template').innerHTML;
     var originHtml = document.querySelector('#insertTbody');
     var newHtml = '';
     detailData.forEach(function(v,i){
        console.log(v);
        newHtml += templateHtml.replace('{order Number}', v.id)
                           .replace('{product}', v.productDescription)
                           .replace('{product Image}', v.fileName)
                           .replace('{count}', v.count);
     });
     originHtml.innerHTML = newHtml;
 }

 /* 배송 상태 orderFlag를 controller에 전달해줌*/
 function updateStatus() {
    var orderFlag = document.getElementById("orderFlag").value;
    var id = document.getElementById("orderIdH").value;
    location.href = "/admin/orderupdate.mall?orderFlag="
          + orderFlag + "&id=" + id;
 }


</script>

<script id="template" type="text/template">
  <tr class="insertTr">
<td>{order Number}
</td>
<td>{product}
</td>
<td>{product Image}
</td>
<td>{count}
</tr>
</script>

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
    <!-- 상세정보 modal -->
    <jsp:include page="../include/admin_side.jsp" />
    <script type="text/javascript">
      document.getElementById("orderMngBtn").classList.add('active');
   </script>

    <!-- content-wrapper -->
    <div id="content-wrapper">
      <!-- DataTables Example -->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fas fa-table"></i>주문 관리
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable"
              width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>OrderNum</th>
                  <th>UserId</th>
                  <th>BuyerName</th>
                  <th>BuyerTel</th>
                  <th>ReceiverName</th>
                  <th>ReceiverAddress</th>
                  <th>ReceiverTel</th>
                  <th>OrderStatus</th>
                  <th>Details</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>OrderNum</th>
                  <th>UserId</th>
                  <th>BuyerName</th>
                  <th>BuyerTel</th>
                  <th>ReceiverName</th>
                  <th>ReceiverAddress</th>
                  <th>ReceiverTel</th>
                  <th>OrderStatus</th>
                  <th>Details</th>
                </tr>
              </tfoot>
              <tbody>
                <c:choose>
                  <c:when test="${not empty list}">
                    <c:forEach var="order" items="${list}"
                      varStatus="status">
                      <tr>
                        <td class="orderId">${order.id }</td>
                        <td>${order.userId }</td>
                        <td>${order.buyerName }</td>
                        <td>${order.buyerTel }</td>
                        <td>${order.receiverName}</td>
                        <td>${order.receiverAddress}</td>
                        <td>${order.receiverTel}</td>
                        <c:choose>
                          <c:when test="${order.orderFlag == 0}">
                           <td class="status">배송전</td>
                          </c:when>
                          <c:when test="${order.orderFlag == 1}">
                            <td class="status">배송중</td>
                          </c:when>
                          <c:when test="${order.orderFlag == 2}">
                            <td class="status">배송완료</td>
                          </c:when>
                        </c:choose> 
                        <td>
                        <button type="button" data-toggle="modal" data-target="#myModal">주문상세</button>
                        </td>
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
      <!-- /.container-fluid -->
      <jsp:include page="../include/admin_footer.jsp" />
    </div>
    <!-- content-wrapper -->
  </div>
  <!-- /#wrapper -->
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog" style="max-width: 600px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">주문 상세</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <input type="hidden" id="orderIdH">
        <table style="text-align: center;">
        <tr>
          <th>order Number</th>
          <th>product</th>
          <th>product image</th>
          <th>count</th>
        </tr>
        <tbody id="insertTbody">
        </tbody>
        </table>
        <select id="orderFlag">
          <option value=0>배송전
          <option value=1>배송중
          <option value=2>배송완료
        </select>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-default" id="saveB">Save</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

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