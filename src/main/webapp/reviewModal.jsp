<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" href="/css/shop_single.css">
<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="review-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body"">
          <form role="form" class="text-left" method="post" action="/reviewCreate.mall">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-user"></span>글제목</label>
              <input type="text" class="form-control" id="review-subject" name="subject" placeholder="글 제목">
              
              <label for="id"><span class="glyphicon glyphicon-user"></span> 리뷰 내용</label>
              <textarea class="review" name="content" id="review-contetn" rows="6" maxlength="200" placeholder="리뷰내용"></textarea>
            </div>
            <p>제품 평가하기</p>
            <div class="starRev">
			  <span class="starR1 on">0.5</span>
			  <span class="starR2">1.0</span>
			  <span class="starR1">1.5</span>
			  <span class="starR2">2.0</span>
			  <span class="starR1">2.5</span>
			  <span class="starR2">3.0</span>
			  <span class="starR1">3.5</span>
			  <span class="starR2" id="star4">4.0</span>
			  <span class="starR1">4.5</span>
			  <span class="starR2">5.0</span>
			</div>
			<div class="row">
			 <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>리뷰 등록하기</button>
			</div>
			<p></p>
			<input type="hidden" name="score" value="0.5" id="hidden-score">
			<input type="hidden" name="productId" id="review-modal-productId">
			<input type="hidden" name="userId" id="review-modal-userId">
             
          </form>
        </div>
      </div>
    </div>
  </div> 
 </div>
 
 <script>
 
 
 /** ------------review Modal JS -------------------*/
 
 $('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  var score = $(this).addClass('on').text();
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $('#hidden-score').val(score);
	  
	  return false;
 });
 $('#review-modal-userId').val(loginId);
 $('#review-modal-productId').val(productId);
 
 
 /** ----------------------------------------- */

 //$('#star4').addClass('on').prevAll('span').addClass('on');
 
 </script>