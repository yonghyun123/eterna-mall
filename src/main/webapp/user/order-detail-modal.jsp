<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="order-detail-modal" role="dialog">
    <div class="detail-modal-dialog modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="detail-modal-body">
          <div class="row">
            <div class="container">
              <div id="in-detail-header">
              </div>
               <table class="table table-hover order-detail-table">
                <tbody>
                  <tr class="order-list-row">
                    <td colspan="5" class="order-inform text-left" id="in-detail-body">
                    
                    </td>
                    <td id="in-detail-side">
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div>
          <table class="detail-inform-table text-center">
            <tbody id="in-detail-inform">
              
            </tbody>
          </table>
          </div>
        </div>
      </div>
    </div>
  </div> 
 </div>
  <!-- 주문상세 template -->
  <script type="my-template" id="detail-header">
  <span class="text-left"><h2>주문 상세</h2></span>
  <div class="text-left">주문일 : <h4 class="detail-order-date">{orderDate}</h4>   주문번호 : <h4 class="detail-order-id">{orderId}</h4></div>
  </script>

  <script type="my-template" id="detail-body">
  <img alt="" class="product-thumbnail" src="/images/{fileName}">
  <div class="product-text"> 
    <div class="product-name">{productDescription}</div>
    <div class="product-price-count">{productPrice}원 / {productCount}개</div>
  </div><br>
  </script>
  
  <script type="my-template" id="detail-side">
  <div class="order-detail-flag">
    <div class="product-price-count"><h4>{orderFlag}!</h4></div> 
    <div class="product-name">{receiveDate}</div>
  </div><br>
  </script>
  
  <script type="my-template" id="detail-inform">
    <tr>
      <th class="order-detail-tr" colspan="4" width="50%">받는사람 정보</th>
      <th class="order-detail-tr" colspan="4" width="50%"> 결제 정보 </th>
              </tr>
              <tr>
                <td class="inform-td" colspan="2">받는 사람</td>
                <td colspan="2">{receiverName}</td>
                <td class="inform-td" colspan="2">총 상품 가격</td>
                <td colspan="2">{totalProductPrice}</td>
              </tr>
              <tr>
                <td class="inform-td" colspan="2">연락처</td>
                <td colspan="2">{receiverTel}</td>
                <td class="inform-td" colspan="2">할인금액</td>
                <td colspan="2">{reducePrice}</td>
              </tr>
              <tr>
                <td class="inform-td" colspan="2">주소</td>
                <td colspan="2">{receiverAddress}</td>
                <td class="inform-td" colspan="2">배송비</td>
                <td colspan="2">{shippingFee}</td>
              </tr>
              <tr>
                <td colspan="4"></td>
                <td class="inform-td" colspan="2">총 결제금액</td>
                <td colspan="2"><h5>{totalPrice}</h5></td>
    </tr>
  </script>
