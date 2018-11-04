<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>구매 목록</h2>
<table border="1">
  <tr>
    <th>번호</th>
    <th>아이디</th>
    <th>보내는사람</th>
    <th>보내는 사람 주소</th>
    <th>보내는 사람 전화번호</th>
    <th>받는 사람</th>
    <th>받는 사람 주소</th>
    <th>받는 사람 전화번호</th>
    <th>제품 브랜드</th>
    <th>제품명</th>
    <th>제품수량</th>
    <th>파일이름</th>
  </tr>
  
  <c:choose>
    <c:when test="${not empty list}">
      <c:forEach var="buy" items="${list }" varStatus="status">
       <tr>
        <td>${status.count}</td>
        <td>${buy.userId }</td>
        <td>${buy.buyerName }</td>
        <td>${buy.buyerAddress }</td>
        <td>${buy.buyerTel }</td>
        <td>${buy.receiverName }</td>
        <td>${buy.receiverAddress }</td>
        <td>${buy.receiverTel }</td>
        <td>${buy.productBrand }</td>
        <td>${buy.productDescription }</td>
        <td>${buy.count }</td>
        <td>${buy.fileName }</td>
      </tr>
    </c:forEach>
    </c:when>
    <c:otherwise>
      <tr>
        <td colspan="5">회원이 존재하지 않습니다.</td>
      </tr>
    </c:otherwise>
  </c:choose>
</table>

</body>
</html>