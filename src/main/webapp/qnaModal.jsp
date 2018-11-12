<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" href="/css/shop_single.css">
<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="qna-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body"">
          <form role="form" class="text-left" method="post" action="/qnaCreate.mall">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-user"></span>Q&A제목</label>
               <input type="text" class="form-control" id="qna-subject" name="subject" placeholder="Q&A 제목" required="required">
              <label for="id"><span class="glyphicon glyphicon-user"></span> Q&A내용</label>
              <textarea class="review" name="content" id="qna-contents" rows="6"  maxlength="200" required="required"></textarea>
            </div>
			<div class="checkbox">
              <label><input type="checkbox" id="secret-flag" value="1" name="secret-flag">비밀글로 저장하기</label>
            </div>
			<input type="hidden" name="productId" id="qna-modal-productId">
			<input type="hidden" name="userId" id="qna-modal-userId">
            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Q&A 등록하기</button>
          </form>
        </div>
      </div>
    </div>
  </div> 
 </div>
 
 <script>
 $('#qna-modal-userId').val(loginId);
 $('#qna-modal-productId').val(productId);
 
 </script>
