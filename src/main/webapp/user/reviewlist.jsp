<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>리뷰 목록</h2>
<table border="1">
  <tr>
    <th>번호</th>
    <th>아이디</th>
    <th>제품아이디</th>
    <th>등록일</th>
    <th>내용</th>
    <th>평점</th>
  </tr>
  
  <c:choose>
    <c:when test="${not empty list}">
      <c:forEach var="review" items="${list }" varStatus="status">
       <tr>
        <td>${status.count}</td>
        <td>${review.userId }</td>
        <td>${review.productId }</td>
        <td>${review.regdate }</td>
        <td>${review.content }</td>
        <td>${review.score }</td>
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