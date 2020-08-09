<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	 min-height:400px;
     margin-left: 100px;
    }

.customer-nav-btn > .btn{
	max-width:700px;
    background-color: lightgray; 
    margin-top: 30px;
}
#sectDiv{
	margin-left: 20%;
	margin-top: 50px;
}
</style>
</head>
<jsp:include page="sideNav.jsp" flush="false" />
<body>
    <section>
    	<div id="sectDiv">
	        <h1>무엇을 도와 드릴까요?</h1>
	        <div class="customer-nav-btn">
		        <button type="button" onclick="location.href='/customerContact' " class="btn btn-default btn-lg btn-block rounded-0" >회사정보</button>
		        <button type="button" onclick="location.href='/customerInfo' " class="btn btn-default btn-lg btn-block rounded-0" >반품 및 환불</button>
		        <button type="button" onclick="location.href='/customerQna' " class="btn btn-default btn-lg btn-block rounded-0" >문의</button>
	        </div>
        </div>
    </section>
	<jsp:include page="../footer.jsp" flush="false" />
 </body>
</html>