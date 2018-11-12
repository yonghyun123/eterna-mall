<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
  <div class="modal fade" id="personalInfo-modal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
        <div class="title">
        <h2>개인정보 수집 이용 동의(필수)</h2>
            </div>
        <table id="info-table">
        <thead>
        <tr>
        <th>수집 목적</th>
        <th>수집 항목</th>
        <th>보유 기간</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>온라인 쇼핑 구매자에 대한 상품 결제 및 배송</td>
        <td>결제정보, 수취인명, 휴대전화번호,수취인 주소</td>
        <td>회원 탈퇴 후 30일 내 <br> (단, 타 법령에 따라 법령에서 규정한 기간동안 보존)</td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
        <td colspan="3">* 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.</td>
        </tr>
        </tfoot>
        </table>
        <button type="submit" class="btn btn-primary btn-lg py-2 " data-dismiss="modal" id="okInfoBtn">
		 확인 </button>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


</script>
