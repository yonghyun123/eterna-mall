<%@page import="kr.or.kosta.eterna.buy.domain.Buy"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
  <script src="https://www.gstatic.com/charts/loader.js"></script>
<title>SB Admin - Dashboard</title>

<!-- Bootstrap core CSS-->
<link href="../../vendor/bootstrap/css/bootstrap.min.css"
  rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="../../vendor/fontawesome-free/css/all.min.css"
  rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="../../vendor/datatables/dataTables.bootstrap4.css"
  rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../css/sb-admin.css" rel="stylesheet">
<script type="text/javascript">
   
window.onload = function(){
   $.ajax({
      url:"/admin/salesamount.mall",
      type:"get",
      dataType:"text",
      success: function(data){
         var jsonSalesData = JSON.parse(data);
          drawVisualization(jsonSalesData);
      }
   });
   eventRegist();
}

google.charts.load('current',{'packages':['corechart']});

function eventRegist(){
   var category = document.getElementById("categoryS");
   category.onchange=function(){
      $.ajax({
         url:"/admin/salesmanage.mall?category="+category.value,
          type:"get",
          dataType:"text",
          success: function(data){
             var jsonSalesData = JSON.parse(data);
             salesTemplate(jsonSalesData);
          }
        });
   }
}

function salesTemplate(salesData){
     var array = [];
    
     array.push(['Product','sum']);
     var temp = [];
     temp.push(['Product','sum']);
     
     salesData.forEach(function(v,i){
        array.push([v.productDescription, Number(v.count)]);
        temp.push([v.productDescription,0]);
     })
      var tempData = google.visualization.arrayToDataTable(
           temp
           );
     var data2 = google.visualization.arrayToDataTable(
         array
     );
     var options = {
            title : '월별 판매량',
            //vAxis : {title : 'Amount'},
            hAxis : {title : 'Product'},
            seriesType : 'line',
            animation:{
               //startup:true,
               duration:1000,
               easing: "out"
            },
            vAxis: {minValue:0, maxValue:100}
            
      }
      
      var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div2'));
      chart2.draw(tempData,options);
      setTimeout(function(){chart2.draw(data2,options); }, 500);
   
}

function drawVisualization(salesData){
    var array = [];
    var temp = [];
     array.push(['Month','sum']);
     temp.push(['Month','sum']);

     salesData.forEach(function(v,i){
        array.push([v.date, v.amount]);
        temp.push([v.date,0]);
     })
     var tempData = google.visualization.arrayToDataTable(
           temp
           );
      var data = google.visualization.arrayToDataTable(
         array
     );
     var options = {
            title : '월별 판매액',
            hAxis : {title : 'Month'},
            seriesType : 'bars',
            animation:{
                 duration: 1000,
                 easing: 'out',
               },
               vAxis: {minValue:0, maxValue:3000000}
      }
    
      
      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
      chart.draw(tempData,options);
      setTimeout(function(){chart.draw(data,options); }, 500);
   
}


</script>

</head>
<script type="text/javascript" src="../../js/jquery-3.2.0.min.js"></script>

<style>
.nav-link, .card-footer {
   cursor: pointer;
}
</style>
<!-- 페이지 전체 -->
<body id="page-top">

  <jsp:include page="/admin/include/admin_nav.jsp" />

  <div id="wrapper">
    <jsp:include page="/admin/include/admin_side.jsp" />
    <script type="text/javascript">
   document.getElementById("salesMngBtn").classList.add('active');
   </script>
    <!-- content-wrapper -->
    <div id="content-wrapper">
    
    
    <table style="margin-top:70px">
    <tr>
    <td><div id="chart_div" style="width: 600px; height: 400px; margin-top:25px"></div></td>
    <td><div>카테고리
    <select id="categoryS">
    <option>------</option>
    <option>립제품</option>
    <option>스킨</option>
    <option>로션</option>
    <option>클렌징</option>
    <option>선케어</option>
    </select></div>
    <div id="chart_div2" style="width: 600px; height: 400px" ></div></td>
    </tr>
    </table>
     
     

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
  <script src="../../vendor/jquery/jquery.min.js"></script>
  <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="../../vendor/chart.js/Chart.min.js"></script>
  <script src="../../vendor/datatables/jquery.dataTables.js"></script>
  <script src="../../vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="../../js/demo/datatables-demo.js"></script>
  <script src="../../js/demo/chart-area-demo.js"></script>
  
  <!-- 사이드 바에서 메뉴 선택시 -->
  <script src="../../js/adminController.js"></script>

</body>

</html>