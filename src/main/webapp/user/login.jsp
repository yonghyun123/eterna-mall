<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="login-modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body"">
          <form role="form" class="text-left">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-user"></span> ID</label>
              <input type="text" class="form-control" id="id" placeholder="Enter ID">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter Password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
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
    
