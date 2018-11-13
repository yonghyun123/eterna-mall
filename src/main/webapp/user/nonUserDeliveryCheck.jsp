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
              <label for="nonUserTel"><span class="glyphicon glyphicon-user"></span> Telephone</label>
              <input type="text" class="form-control" name="inputNonUserTel" id="nonUserTel" placeholder="등록했던 휴대폰  번호를 입력해주세요" required>
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
