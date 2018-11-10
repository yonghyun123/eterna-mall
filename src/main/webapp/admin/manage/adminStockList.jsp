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
div{
  padding-right: 0px;
}
.nav-link, .card-footer {
	cursor: pointer;
}
.mt-5, .my-5 {
    margin-top: 0.1rem!important;
    margin-bottom:0.1rem!important;
}
.card-footer {
    padding: .75rem 13rem;
    background-color: rgba(0,0,0,.03);
    border-top: 1px solid rgba(0,0,0,.125);
}
</style>
<script>
	
  $(document).ready(function(){
    $('.details').click(function(){
      viewOrderListDetails(this);
    });
   $('#registProduct').click(function(){
	   productRegist();
   });
   
   $('#minAgeSelector').change(function(){
	   console.log('fuck');
	   createMaxAge(this);
   });
   
   $('input[type=file]').change(function(e){
	   $(this).next().text($(this).get(0).files[0].name);
	});
  }) 
  
  function viewOrderListDetails(value){
    var productId = $(value).parents()[1].childNodes[1].innerHTML;
      $.ajax({
         url: "/admin/productview.mall",
         type:"get",
         data: {
        	 productId: productId
         },
         dataType:"text",
         success: function(data){
           var jsonDetailData = JSON.parse(data);
           console.log(jsonDetailData);
           modalview(jsonDetailData);
         }
        });
  }
  /**최대연령 출력기능*/
  function createMaxAge(selector){
	  var defalut =$("<option value='' selected disabled hidden>"+"MaxAge"+"</option>");
	  var teen =$("<option>"+10+"</option>");
	  var twenty = $("<option>"+20+"</option>");
	  var thirty = $("<option>"+30+"</option>");
	  var fourty = $("<option>"+40+"</option>");
	  var fifty = $("<option>"+50+"</option>");
	  var Array = [teen, twenty, thirty, fourty, fifty]
	  var val = $(selector).val();
	  $('#maxAgeSelector').empty();
	  $('#maxAgeSelector').append(defalut);
		$.each(Array, function(index, item){
		if((index+1)>=(val/10)){
			$('#maxAgeSelector').append(item);
		}
	})  
  }
  /**제품등록*/
  function productRegist(){
	  var categorySelector =  $('#categorySelector').val();
	  var inputBrand =  $('#inputBrand').val();
	  var sexSelector =  $('#SexSelector').val();
	  var inputProduct =  $('#inputProduct').val();
	  var productStock =  $('#productStock').val();
	  var minAgeSelector =  $('#minAgeSelector').val();
	  var maxAgeSelector =  $('#maxAgeSelector').val();
	  var inputThumnail = $('#inputThumnail').get(0).files[0].name;
	  var inputMainImg = $('#inputMainImg').get(0).files[0].name;
	  var inputSideImg = $('#inputSideImg').get(0).files[0].name;
	 
	  var InputPrice =  $('#InputPrice').val();
	  $.ajax({
	         url: "/admin/productregist.mall",
	         type:"get",
	         data: {
	        	 categorySelector: categorySelector,
	        	 inputBrand: inputBrand,
	        	 sexSelector: sexSelector,
	        	 inputProduct: inputProduct,
	        	 productStock: productStock,
	        	 InputPrice: InputPrice,
	        	 minAgeSelector: minAgeSelector,
	        	 maxAgeSelector: maxAgeSelector,
	        	 inputThumnail: inputThumnail,
	        	 inputMainImg: inputMainImg,
	        	 inputSideImg: inputSideImg
	         },
	         dataType:"text",
	         success: function(data){
	           var jsonDetailData = JSON.parse(data);
	           console.log(jsonDetailData);
	         }
  });
  }
  
  function modalview(detailDate){
      var templateHtml = document.querySelector('#modal-table').innerHTML;
      var originHtml = document.querySelector('#modal-content');
      var newHtml = '';
      newHtml += templateHtml
       .replace('{categoryType}', detailDate.categoryType)
       .replace('{productBrand}', detailDate.productBrand)
       .replace('{productSex}', detailDate.productSex)
       .replace('{productDescription}', detailDate.productDescription)
       .replace('{productStock}', detailDate.productStock)
       .replace('{createDate}', detailDate.createDate)
       .replace('{modifyDate}', detailDate.modifyDate)
       .replace('{minAge}', detailDate.minAge)
       .replace('{maxAge}', detailDate.maxAge)
       .replace('{price}', detailDate.price.toLocaleString())
       .replace('{thumNail}', detailDate.thumNail)
       .replace('{main}', detailDate.MainIMG)
       .replace('{side}', detailDate.sideIMG);
      originHtml.innerHTML = newHtml;
  }
  
  
</script>

  <script id="modal-table" type="text/template">
	<div class="modal-header">
       <h4 class="modal-title">재고상세</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
	<div class="modal-body" id="modal-body">
  <table>
      <tr>
              <th>Name</th>
              <th>Content</th>
            <tr>
              <td>Category</td>
              <td>{categoryType}</td>
            </tr>
            <tr>
              <td>Brand</td>
              <td>{productBrand}</td>
            </tr>
            <tr>
              <td>Sex</td>
              <td>{productSex}</td>
            </tr>
            <tr>
              <td>Description</td>
              <td>{productDescription}</td>
            </tr>
            <tr>
              <td>Stock</td>
              <td>{productStock}</td>
            </tr>
            <tr>
              <td>CreateDate</td>
              <td>{createDate}</td>
            </tr>
            <tr>
              <td>ModifyDate</td>
              <td>{modifyDate}</td>
            </tr>
            <tr>
              <td>MinAge</td>
              <td>{minAge}</td>
            </tr>
            <tr>
              <td>MaxAge</td>
              <td>{maxAge}</td>
            </tr>
            <tr>
              <td>Price</td>
              <td>&#x20a9;{price}</td>
            </tr>
            <tr>
			<tr>
              <td>ThumNail</td>
              <td>{thumNail}</td>
            </tr>
            <tr>
			<tr>
              <td>MainImg</td>
              <td>{main}</td>
            </tr>
            <tr>
			<tr>
              <td>SideImg</td>
              <td>{side}</td>
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

	<jsp:include page="../include/admin_nav.jsp" />

	<div id="wrapper">
		<jsp:include page="../include/admin_side.jsp" />
		<!-- content-wrapper -->
		<div id="content-wrapper">
			<!-- DataTables Example -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 재고현황
                    <button type="button" class="register" data-toggle="modal" data-target="#registModal">제품등록</button>
				</div>
				<div class="card-body">
                    <jsp:include page="../include/common_modal_form_common.jsp" />
                    <jsp:include page="../include/register.jsp" />
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>ProductId</th>
									<th>CategoryId</th>
									<th>ProductBrand</th>
									<th>ProductSex</th>
									<th>ProductDescription</th>
									<th>MinAge</th>
									<th>MaxAge</th>
									<th>ProductStock</th>
                                    <th>Details</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ProductId</th>
									<th>CategoryId</th>
									<th>ProductBrand</th>
									<th>ProductSex</th>
									<th>ProductDescription</th>
									<th>MinAge</th>
									<th>MaxAge</th>
									<th>ProductStock</th>
                                    <th>Details</th>
								</tr>
							</tfoot>
							<tbody>
					<c:choose>
                  <c:when test="${not empty list}">
                    <c:forEach var="product" items="${list}" varStatus="status">
                      <tr>
                        <td>${product.productId }</td>
                        <td>${product.categoryType }</td>
                        <td>${product.productBrand }</td>
                        <td>${product.productSex}</td>
                        <td>${product.productDescription }</td>
                        <td>${product.minAge }</td>
                        <td>${product.maxAge }</td>
                        <td>${product.productStock }
                        </td>
                        <td><button type="button" class="details" data-toggle="modal" data-target="#myModal">상세</button>
                        <br>
                        <button type="button" class="details" data-toggle="modal" data-target="#myModal">삭제</button>
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
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
		<!-- /.container-fluid -->
		<jsp:include page="../include/admin_footer.jsp" />
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
	<script src ="../js/adminController.js"></script>


</body>

</html>