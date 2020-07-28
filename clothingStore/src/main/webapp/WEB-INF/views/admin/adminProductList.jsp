<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
  <thead>
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">상품명</th>
      <th scope="col">색상</th>
      <th scope="col">사이즈</th>
      <th scope="col">재고</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${pd_list }" var="pList">
	    <tr>
	      <th scope="row">${pList.pd_id }</th>
	      <td>${pList.pd_name }</td>
	      <td>${pList.pd_color }</td>
	      <td></td>
	    </tr>  	
  	</c:forEach>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
</body>
</html>