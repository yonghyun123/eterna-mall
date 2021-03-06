<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="cart-dup-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body"">
          <form role="form" class="text-left" method="post" action="/cart.mall">
            <div class="form-group">
            	<p>이미 담겨있는 상품이 있습니다. 장바구니로 이동하시겠습니까?</p>
            </div>
			  <input type="hidden" name="userId" id="cart-dup-userId">
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>장바구니로 이동</button>
          </form>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>아니요</button>
        </div>
      </div>
    </div>
  </div> 
 </div>