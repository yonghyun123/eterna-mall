<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="login-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" id="login-form" class="text-left" action="login.mall" method="post">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-user"></span> ID</label>
              <input type="text" class="form-control" name="inputId" id="id" placeholder="Enter ID">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="inputPasswd" id="psw" placeholder="Enter Password">
              
            </div>
            <div class="checkbox">
              <label><input type="checkbox" id="rememberId" value="">Remember me</label>
            </div>
              <button type="button" class="btn btn-success btn-block" id="login-button"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
        <div class="modal-footer text-center user-support">
          <p><a href="#">Sign Up</a></p> / 
          <p><a href="#">Forgot Password?</a></p>
        </div>
      </div>
    </div>
  </div> 
 </div>
    
 <script>
 	window.onload = function() {
 		// 아이디 저장
 		if("${cookie.rememberId}" != null) { 
  			document.getElementById("id").value = "${cookie.rememberId.value}";
 		}
 		
 		document.getElementById("login-button").onclick = function () {
 			var id = document.getElementById("id");
 			var password = document.getElementById("psw");
			var rememberId = document.getElementById("rememberId");
			var params = null;
			
			if(rememberId.checked == true) {
				params = "inputId=" + id.value + "&inputPasswd=" + password.value + "&rememberId=" + rememberId.id;
			} else {
				params = "inputId=" + id.value + "&inputPasswd=" + password.value;
			}
			
 			$.ajax({
 				url: "login.mall",
 				data: params,
 				success: function (data) {
 					setTimeout(() => {
 						if(data.trim() == 'userNone') {
 	 						/* window.location.reload(); */
 	 						$("#login-modal").modal('hide');
 	 						$("#login-fail").modal('show');
 	 					} else {
 	 						window.location.reload();
 	 					}	
 					}, 1000)
 				}
 			})
 		}
 	}
 </script>
