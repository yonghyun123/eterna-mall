<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="kr.or.kosta.eterna.user.domain.User"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.eterna.user.service.UserServiceImpl"%>
<%@page import="kr.or.kosta.eterna.user.service.UserService"%>
<%@page import="kr.or.kosta.eterna.common.factory.XMLObjectFactory"%>
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
               <form role="form" class="text-left" id="join-form"
                  action="/join.mall">
                  <div class="form-group">
                     <label for="usrid"><span class="glyphicon glyphicon-user"></span>
                        ID<span id="putId"></span></label> <input type="text"
                        class="form-control" name="user-id" id="user-id"
                        placeholder="Enter ID" required>
                  </div>

                  <div class="form-group">
                     <label for="usrname"><span
                        class="glyphicon glyphicon-user"></span> Name<span id="putName"></span></label>
                     <input type="text" class="form-control" name="user-name"
                        id="user-name" placeholder="Enter Name" required>
                  </div>

                  <div class="form-group">
                     <label for="psw"><span
                        class="glyphicon glyphicon-eye-open"></span> Password<span
                        id="putPw"></span></label> <input type="password" class="form-control"
                        name="passwd" id="passwd" placeholder="Enter password" required>
                  </div>

                  <div class="form-group">
                     <label for="psw"><span
                        class="glyphicon glyphicon-eye-open"></span> Check Password<span
                        id="putCheckPw"></span></label> <input type="password"
                        class="form-control" name="passwd-check" id="passwd-check"
                        placeholder="Check password" required>
                  </div>

                  <div class="form-group">
                     <label for="email"><span
                        class="glyphicon glyphicon-eye-open"></span> Email<span
                        id="putEmail"></span></label> <input type="email" class="form-control"
                        name="user-email" id="user-email" placeholder="Enter Email"
                        required>
                  </div>

                  <div class="form-group">
                     <label for="tel"><span
                        class="glyphicon glyphicon-eye-open"></span> Tel<span
                        id="putTel"></span></label> <input type="text" class="form-control"
                        name="tel" id="tel" placeholder="EX)01012341234" maxlength="11" required>
                  </div>

                  <div class="form-group">
                     <label for="zip-code"><span
                        class="glyphicon glyphicon-eye-open"></span>Zip code</label> <input
                        type="text" class="form-control" name="zip-code" id="zip-code"
                        placeholder="우편번호" required> <input type="button"
                        class="btn btn-success" onclick="execDaumPostcode()"
                        value="search"><br>
                  </div>
                  <div class="form-group">
                     <label for="street-address"><span
                        class="glyphicon glyphicon-eye-open"></span>Street address</label> <input
                        type="text" id="street-address" name="street-address"
                        class="form-control" placeholder="주소" required> <input
                        type="text" id="detail-address" name="detail-address"
                        class="form-control" placeholder="상세주소" required>
                  </div>
                  <button type="button" class="btn btn-success btn-block" id="join">
                     <span class="glyphicon glyphicon-off"></span>Signup
                  </button>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
<%XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
UserService userService = (UserService) factory.getBean(UserServiceImpl.class);
List<User> list = userService.listAll();
%>

/* 유효성 체크를 위한 flag들 */
 var checkpw = 0;
 var checkid = 0;
 var checkName = 0;
 var checkconfirm = 0;
 var checkemail = 0;
 var checkTel = 0;
 var checkAddress = 0;
 
      document.getElementById('join').disabled = true;
      eventRegist();
     
     function eventRegist(){
        document.getElementById("join").onclick = function() {
         var form = document.getElementById("join-form");
         form.submit();
        }
        
        document.getElementById('user-id').onkeyup = function(){
           var val = this.value;
           idCheck(val);
           ableJoin();
        }
        
        document.getElementById('user-name').onkeyup = function(){
           var val = this.value;
           nameCheck(val);
           ableJoin();
        }
        
        document.getElementById('passwd').onkeyup = function(){
           var val = this.value;
           passwdCheck(val);
           ableJoin();
        }
        
        document.getElementById('passwd-check').onkeyup = function(){
           var val = this.value;
           confirmPasswdCheck(val);
           ableJoin();
        }
        
        document.getElementById('user-email').onkeyup = function(){
           var val = this.value;
           emailCheck(val);
           ableJoin();
        }
        
        document.getElementById('tel').onkeyup = function(){
           var val = this.value;
           telCheck(val);
           ableJoin();
        }
        
        document.getElementById('zip-code').onkeyup = function(){
           addressCheck();
           ableJoin();
        }
        
        document.getElementById('street-address').onkeyup = function(){
           addressCheck();
           ableJoin();
        }
        
        document.getElementById('detail-address').onkeyup = function(){
           addressCheck();
           ableJoin();
        }
        
     }
     
     /* id 체크 */
     function idCheck(val){
        var msg = '';
        var regId = /^(?=.*[a-zA-Z])(?=.*\d).{5,15}$/;
        if(val.length == 0){
          msg = ' ';
          chekcid = 0;
       }else if(val.length > 15 || val.length < 5 || !regId.test(val) ){
           msg = ' 아이디는 영문, 숫자 포함 5~15자 입니다.';
           document.getElementById('putId').style.color = 'red';
           chekcid=0;
        }else{
          msg = successMessage(val);
         document.getElementById('putId').style.color = 'blue';
           checkid=1;
        }
         <%
         for (User user : list) {
            String userId = user.getUserId();%>
          if(val == '<%=userId%>') {
         msg = ' 중복된 ID가 존재합니다.';
         document.getElementById('putId').style.color = 'red';
         checkid = 0;
      }
<%}%>
   document.getElementById('putId').textContent = msg;
   }

   /* 이름 유효성 체크(한글, 영문만)*/
   function nameCheck(val) {
      var msg = '';
      var regName = /(^[가-힣]{2,10}$|^[a-zA-Z]{2,10})/;
       if(val.length == 0){
             msg = ' ';
             checkName = 0;
          }
      else if (!regName.test(val)) {
         msg = ' 영문, 한글 2~10자 내로 입력 가능합니다.';
         document.getElementById('putName').style.color = 'red';
         checkName = 0;
      } else {
         msg = successMessage(val);
         document.getElementById('putName').style.color = 'blue';
         checkName = 1;
      }
      document.getElementById('putName').textContent = msg;
   }
   

   /* 비밀번호 체크 */
   function passwdCheck(val) {
      var msg = '';
      var regPasswd = /^(?=.*[a-zA-Z])(?=.*\d).{5,15}$/;
       if(val.length == 0){
             msg = ' ';
             checkpw = 0;
          }
      else if (val.length > 15 || val.lengh < 5 || !regPasswd.test(val)) {
         msg = '패스워드 길이는 영문, 숫자 포함 5~15자 입니다.'
         document.getElementById('putPw').style.color = 'red';
         checkpw = 0;
      } else {
         msg = successMessage(val);
         document.getElementById('putPw').style.color = 'blue';
         checkpw = 1;
      }
      document.getElementById('putPw').textContent = msg;

      if(val.length == 0){
         document.getElementById('putCheckPw').textContent = ' ';
      }else if (val != document.getElementById('passwd-check')) {
         document.getElementById('putCheckPw').style.color = 'red';
         checkconfirm = 0;
         document.getElementById('putCheckPw').textContent = '비밀번호와 일치하지 않습니다.';
      }
   }
   
   /* 비밀번호 일치 확인 */
   function confirmPasswdCheck(val){
      var msg = '';
      if(val.length == 0){
          msg = ' ';
          checkconfirm = 0;
       }
      else if(document.getElementById('passwd').value.length != 0 && val == document.getElementById('passwd').value){
          msg = ' 비밀번호와 일치합니다.';
         document.getElementById('putCheckPw').style.color = 'blue';
         checkconfirm =1;
       }else{
          msg = ' 비밀번호와 일치하지 않습니다.';
         document.getElementById('putCheckPw').style.color = 'red';
         checkconfirm =0;
       }
       document.getElementById('putCheckPw').textContent = msg;
   }
   
   /* 이메일 유효성, 중복 체크*/
   function emailCheck(val){
       var msg = '';
      var regEmail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
      if(val.length == 0){
         msg = ' ';
         checkemail = 0;
      }
      else if(!regEmail.test(val)){
               msg = '이메일 형식에 맞게 입력해주세요.';
               document.getElementById('putEmail').style.color = 'red';
               checkemail= 0;
               }else{
                   msg = successMessage(val);
                  document.getElementById('putEmail').style.color = 'blue';
                  checkemail=1;
               }
             <%
         for (User user : list) {
            String email = user.getUserEmail(); %>
              if(val == '<%=email%>'){
               msg = '중복된 이메일이 존재합니다.'
                  document.getElementById('putEmail').style.color = 'red';
               checkemail= 0;
              }
            <%}
            %>   
            
            document.getElementById('putEmail').textContent = msg;
   }
   
   /* 휴대번호 유효성 체크 */
   function telCheck(val){
      var msg = '';
      var regTel = /^01([0|1|6|7|8|9]?)?([0-9]{8,9})$/;
       if(val.length == 0){
             msg = ' ';
             checkTel = 0;
          }
      else if (!regTel.test(val)) {
         msg = ' 01012341234 형식으로 입력해주세요.';
         document.getElementById('putTel').style.color = 'red';
         checkTel = 0;
      } else {
         msg = successMessage(val);
         document.getElementById('putTel').style.color = 'blue';
         checkTel = 1;
      }
      document.getElementById('putTel').textContent = msg;
   }
   
   /* 사용 가능 알림 */
   var successMessage = function(val) {
      return ' 사용 가능합니다.';
   }
   
   /* 주소 공백 확인 */
   function addressCheck(){
       var zip = document.getElementById('zip-code').value;
       var street = document.getElementById('street-address').value;
       var detail = document.getElementById('detail-address').value;
       if(zip.length != 0 && street.length != 0 && detail.length != 0){
          checkAddress = 1;
       }else{
          checkAddress = 0;
       }
    }

   /* 유효성 확인 후 join 버튼 활성화 */
   function ableJoin(){
      if(checkpw == 1 && checkid == 1 && checkName == 1 && checkconfirm == 1 && checkconfirm == 1 && checkTel == 1 && checkAddress == 1){
         document.getElementById("join").disabled = false;
      }else{
         document.getElementById("join").disabled = true;
      }
   }

   // 우편번호 찾기 화면을 넣을 element
   function execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
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
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
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