<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>장바구니 목록</h2>
<table border="1">
  <tr>
    <th>번호</th>
    <th>아이디</th>
    <th>제품아이디</th>
    <th>제품 브랜드</th>
    <th>제품명</th>
    <th>제품수량</th>
    <th>제품가격</th>
    <th>파일이름</th>
  </tr>
  
  <c:choose>
    <c:when test="${not empty list}">
      <c:forEach var="cart" items="${list }" varStatus="status">
       <tr>
        <td>${status.count}</td>
        <td>${cart.userId }</td>
        <td>${cart.productId }</td>
        <td>${cart.productBrand }</td>
        <td>${cart.productDescription }</td>
        <td>${cart.count }</td>
        <td>${cart.price }</td>
        <td>${cart.fileName }</td>
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