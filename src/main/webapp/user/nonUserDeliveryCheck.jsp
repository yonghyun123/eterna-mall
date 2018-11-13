<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <!-- 비회원 주문조회 modal  -->
  <div class="modal fade" id="nonUserDeliveryCheck-modal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left" action="<!-- 주문조회 할  컨트롤러 -->">
          <div><h2 style="text-align: center;">비회원 주문조회</h2></div>
            <div class="form-group">
              <label for="inputNonUserOrderNum"><span class="glyphicon glyphicon-user"></span> OrderNumber</label>
              <input type="text" class="form-control" name="inputNonUserOrderNum" id="nonUserOrderNum" placeholder="주문번호를 입력해주세요" required>
            </div>
            <div class="form-group">
              <label for="nonUserPw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="inputNonUserPw" id="nonUserPw" placeholder="비밀번호를 입력해주세요" required>
            </div>
              <button type="button" class="btn btn-success btn-block" id="nonUserConfirm-button"><span class="glyphicon glyphicon-off"></span> Confirm</button>
          </form>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
 </div>
 <div id="popup-message-nonuser-delivery-fail">일치하는 정보가 없습니다</div>
 <script>
 

 document.getElementById("nonUserConfirm-button").onclick=function(){
	 var nonUserOrderNum = document.getElementById("nonUserOrderNum").value;
	 var nonUserPw = document.getElementById("nonUserPw").value;
	 if((nonUserOrderNum == null)||(nonUserOrderNum.trim().length ==0)){
		 $("#nonUserDeliveryCheck-modal").modal('hide');
		 popup("popup-message-nonuser-delivery-fail");
	 } else {
	 var nonUserOrderNumArray = nonUserOrderNum.trim().split('A');
	 var dateNum = nonUserOrderNumArray[0];
	 var orderNumber = nonUserOrderNumArray[1];
	 if((dateNum!= null)&&(orderNumber!= null)&&(nonUserPw!= null)&&(nonUserOrderNum!= null)){
	if((nonUserOrderNumArray[1].trim().length!=0)&&(nonUserPw.trim().length!=0)) {
		var params ="dateNum=" + dateNum+ "&orderNumber=" + orderNumber +"&nonUserPw=" +nonUserPw ;
        $.ajax({
           url: '/nonUserDetail.mall',
           data: params,
           dataType:'text',
           success: function(data) {
        	   if(data.trim()=='fail'){
        		   $("#nonUserDeliveryCheck-modal").modal('hide');
        		   popup("popup-message-nonuser-delivery-fail");
        	   } else {
             var jsonDetailData = JSON.parse(data);
             var body = detailHeaderTemplate(jsonDetailData);
             detailBodyTemplate(jsonDetailData, body);
             detailSideTemplate(jsonDetailData);
             detailInformTemplate(jsonDetailData);
        	 $("#nonUserDeliveryCheck-modal").modal('hide');
        	 $("body").css("overflow","hidden");
        	 $("#order-detail-modal").css("overflow-x","hidden").css("overflow-y","auto");
        	 $("#order-detail-modal").modal('show');
        	 $("#order-detail-modal").click(function(){
        		 $("body").css("overflow","auto");
        		 });
        	   }
           }
        })
	} else {
		 $("#nonUserDeliveryCheck-modal").modal('hide');
		 popup("popup-message-nonuser-delivery-fail");
	}
	 } else {
		 $("#nonUserDeliveryCheck-modal").modal('hide');
		 popup("popup-message-nonuser-delivery-fail");
	}
	 }
	 
 }
 function detailHeaderTemplate(detailData){
	    var templateHtml = document.querySelector('#detail-header').innerHTML;
	    var originHtml = document.querySelector('#in-detail-header');
	    var body = document.querySelector('#in-detail-body');
	    var newHtml = '';
	   
	    detailData.forEach(function(v,i){
	      newHtml = templateHtml.replace('{orderDate}', v.orderDate)
	                   .replace('{orderId}', v.orderNumber );
	    });
	    originHtml.innerHTML = newHtml;
	    
	    return body;
	  }
	  
	  function detailBodyTemplate(detailData, body){
	    var templateHtml = document.querySelector('#detail-body').innerHTML;
	    var originHtml = body;
	    var newHtml = '';
	    detailData.forEach(function(v,i){
	    newHtml += templateHtml.replace('{fileName}', v.fileName)
	                 .replace('{productDescription}', v.productDescription)
	                   .replace('{productPrice}', v.productPrice)
	                   .replace('{productCount}', v.productCount);
	    });
	    
	    originHtml.innerHTML = newHtml;
	  }
	  
	  function detailSideTemplate(detailData){
	    var templateHtml = document.querySelector('#detail-side').innerHTML;
	    var originHtml = document.querySelector('#in-detail-side');
	    var newHtml = '';
	    detailData.forEach(function(v,i){
	      newHtml = templateHtml.replace('{receiveDate}', v.receiveDate)
	                   .replace('{orderFlag}', v.orderFlag);
	    });
	    originHtml.innerHTML = newHtml;
	  } 
	  
	  function detailInformTemplate(detailData){
	    var templateHtml = document.querySelector('#detail-inform').innerHTML;
	    var originHtml = document.querySelector('#in-detail-inform');
	    var newHtml = '';
	    detailData.forEach(function(v,i){
	      newHtml = templateHtml.replace('{receiverName}', v.receiverName)
	                   .replace('{receiverTel}', v.receiverTel)
	                   .replace('{receiverAddress}', v.receiverAddress)
	                   .replace('{totalProductPrice}', v.totalProductPrice)
	                   .replace('{reducePrice}', v.reducePrice)
	                   .replace('{shippingFee}', v.shippingFee)
	                   .replace('{totalPrice}', v.totalPrice);
	                   
	    });
	    originHtml.innerHTML = newHtml;
	  }
 </script>
