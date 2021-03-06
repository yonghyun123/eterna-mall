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
          <form role="form" class="text-left" action="login.mall">
            <div class="form-group">
              <label><span class="glyphicon glyphicon-user"></span> ID</label>
              <input type="text" class="form-control" name="inputId" id="id" placeholder="Enter ID" required>
            </div>
            <div class="form-group">
              <label><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="inputPasswd" id="psw" placeholder="Enter Password" required>
              
            </div>
            <div class="checkbox" id="nonUserBody">
              
            </div>
              <button type="button" class="btn btn-success btn-block" id="login-bt"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal" id="btn-cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
        <div class="modal-footer text-center user-support">
          <p><a href="#">Sign Up</a></p> / 
        </div>
      </div>
    </div>
  </div> 
 </div>
 <script type="my-template" id="login-body">
 <label><input type="checkbox" id="rememberId" value="">Remember me</label>
 </script>
 <script type="my-template" id="nonUser-body">
 <label><input type="checkbox" id="rememberId" value="">Remember me</label>
              <span style="float: right;"><a id="orderNonUser">비회원으로 주문하기</a></span>
 </script>
 <script>
 
	if("${cookie.rememberId}" != null) { 
			document.getElementById("id").value = "${cookie.rememberId.value}";	
	} 
	
	document.getElementById("login-bt").onclick = function () {
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
			url: "/login.mall",
			data: params,
			success: function (data) {
				setTimeout(() => {
					if(data.trim() == 'userNone') {
 						$("#login-modal").modal('hide');
 						$("#login-fail").modal('show');
 						
 					} else {
						if(document.location.pathname == '/index.jsp') {
							location.href = "/eterna.mall";
						} else {
							window.location.reload();
						}
 					}	
				}, 500)
			}
		})
		
	}
 </script>