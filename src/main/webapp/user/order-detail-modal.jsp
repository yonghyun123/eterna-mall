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
        <div class="modal-body">
          <div class="row">
            <div class="container">
              <table class="table table-hover order-table text-center">
                <thead>
                  <tr>
                    <th class="table-number">주문번호</th>
                    <th colspan="5" class="table-inform">상품정보</th>
                    <th class="table-flag">상태</th>
                  </tr>
                </thead>
                <tbody>
                  <%-- <c:choose>
                    <c:set var="arrayLength" value="${numPurchase[0].numPurchase }"/>
                    <tr>
                      <td class="order-number" id="${index }">${buyAllList[arrayLength].orderNumber }</td>
                      <!-- 상품 이름 및 이미지에 해당 상품 페이지 이동 a태그 걸기 -->
                      <c:forEach var="buy" items="${buyAllList }" begin="${arrayLength }" varStatus="x">
                      <td colspan="5" class="order-inform text-left">
                        <img alt="" class="product-thumbnail" src="../images/${buy.fileName }.png">
                        <div class="product-text"> 
                          <div class="product-name">${buy.productDescription }</div>
                          <div class="product-price-count">${buy.productPrice }원 / ${buy.count }개</div>
                        </div><br>
                      </td>
                      </c:forEach>
                      
                      <td class="order-date-flag">${buyAllList[index].orderDate } <br> ${buyAllList[index].orderFlag }</td>
                    </tr>
                  </c:choose> --%>
                </tbody>
              </table>
              <div class="row aos-init aos-animate"
                data-aos="fade-up">
                <div class="col-md-12 text-center">
                  <div class="site-block-27">
                    <ul>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
 </div>
