<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    a{
    color: black;
    }
    section{
		 min-height:400px;
	     margin-left: 200px;
	 }
    section h1{
        text-align: center;
    }
    #fat{
    	margin: 10px;
    }
    #sectionDiv{
    	border: 1px solid gray;
    }
    #sectDiv{
      	margin:0 auto;
		margin: 50px;
		margin-left: 20%;
		max-width:50%;
	}
    select{
    	text-align: center;
    	float: right;
    }
    .btn{
    	float: right;
    	margin: 10px;
    	width: 100px;
    }

</style>
</head>
<body>
	<section>
		<div id="sectDiv">
		   <h1>주문 상세보기</h1><br><br>
		   <div id="sectionDiv" data-spy="scroll" data-target="#navbar-example2" data-offset="0">
		   	<form  action=# method="post" >
			    <select id="inputState" name="boardCat" class="form-control" style="width: 200px;">
		                <option disabled selected>=== 상품현황 ===</option>
		                <option value="배송">결제완료</option>
		                <option value="결제">배송중</option>
		                <option value="교환">배송완료</option>
		                <option value="환불">환불</option>
		                <option value="기타">교환</option>
		              </select>
			     <h4 id="fat">주문번호 : ${ order.order_id }</h4>
			     <div id="detail">
			     	<b>이메일</b><br>
			     	<p>${ order.user_email }</p><br>
			     	
			     	<b>받는 사람 이름</b><br>
			     	<p>${ order.dv_name }</p><br>
			     	
			     	<b>배송주소</b><br>
			     	<p>${ order.dv_address1}<br>
			     	${ order.dv_address2}, 
			     	${ order.dv_address3}, 
			     	${ order.dv_address4}</p><br>
			     	
			     	<b>전화번호</b><br>
			     	<p>${ order.dv_phone }</p><br>
			     	
			     	<b>요청사항</b><br>
			     	<p>${ order.dv_message }</p><br>
			     	
			     	<b>상품</b><br>
			     	<c:forEach var="pd" items="${ detail }">
			     		<p>${ pd.pd_name } ${ pd.pd_price } ${ pd.pd_size } ${ pd.pd_quantity }</p>
			     	</c:forEach>
			     	
			     	<b>배송료</b><br>
			     	<p>${ order.dv_option }</p><br>
			     	<b>총 결제금액</b><br>
			     	<p>${ order.total_price }원</p><br>
			     	<b>결제방법</b><br>
			     	<p>${ order.payment_method }</p><br>
			     	<b>결제일</b><br>
			     	<p>${ order.payDate }</p><br>
			     </div>
			     <input type="submit" class="btn btn-dark" value="저장">
		     </form>
		   </div>
		</div>
	</section>
	<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>