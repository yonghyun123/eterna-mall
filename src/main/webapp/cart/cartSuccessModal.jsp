<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="cart-succ-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left" method="post" action="/cart.mall">
            <div class="form-group">
           		<h3>장바구니에 등록했습니다 장바구니로 이동하시겠습니까?</h3>
            </div>
			<input type="hidden" name="userId" id="cart-succ-userId">
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>이동하기</button>
          </form>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>아니요</button>
        </div>
      </div>
    </div>
  </div> 
 </div>