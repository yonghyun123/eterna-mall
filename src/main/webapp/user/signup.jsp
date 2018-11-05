<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="signup-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Id</label>
              <input type="text" class="form-control" id="userId" placeholder="Enter ID">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="passwd" placeholder="Enter password">
            </div>
            
			<div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Check Password</label>
              <input type="password" class="form-control" id="passwd-check" placeholder="Check password">
            </div>
            
			<div class="form-group">
              <label for="email"><span class="glyphicon glyphicon-eye-open"></span> Email</label>
              <input type="email" class="form-control" id="userEmail" placeholder="Enter Email">
            </div>
            
           	<div class="form-group">
         	  <label for="zip-code"><span class="glyphicon glyphicon-eye-open"></span>Zip code</label>
         	  <input type="text" id="zip-code" class="form-control" placeholder="우편번호">
         	  <input type="button" class="btn btn-success" onclick="execDaumPostcode()" value="search"><br>
           	</div>
            <div class="form-group">
              <label for="street-address"><span class="glyphicon glyphicon-eye-open"></span>Street address</label>
  			  <input type="text" id="street-address" class="form-control" placeholder="주소">
  			  <input type="text" id="detail-address" class="form-control" placeholder="상세주소">
			</div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Signup</button>
          </form>
        </div>
      </div>
    </div>
  </div> 
 </div>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip-code').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('street-address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detail-address').focus();
            }
        }).open();
    }
</script>
