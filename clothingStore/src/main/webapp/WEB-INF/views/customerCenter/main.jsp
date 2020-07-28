<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />
<style>
.row{
      width: 980px;
      margin: 0 auto;
}
section{
     margin-left: 20%;
    }

 .sidenav {
 height: 100%;
 width: 300px;
 position: fixed;
 z-index: 1;
 top: 30%;
 left: 0;
 overflow-x: hidden;
 padding-top: 20px;
 }

.sidenav a {
padding-left: 50px;
text-decoration: none;
font-size: 25px;
display: block;
color: black;
}

.sidenav a:hover {
color: #f1f1f1;
}
.btn{
    background-color: lightgray; 
    margin-top: 20px;
}

@media screen and (max-height: 450px) {
.sidenav {padding-top: 15px;}
.sidenav a {font-size: 18px;}
}
</style>

<div class="row">
    <aside class="sidenav">
        <a href="/customer"><h3>고객센터</h3></a><br>
        <a href="/customerContact"><h5>회사정보</h5></a><br>
        <a href="/customerInfo"><h5>배송/결제/반품</h5></a><br>
        <a href="/customerQna"><h5>Q&A</h5></a><br>
    </aside>
    
    <section>
        <h1>무엇을 도와 드릴까요?</h1>
        <div>
        <button type="button" onclick="location.href='/customerContact' " class="btn btn-default btn-lg btn-block" >회사정보</button>
        <button type="button" onclick="location.href='/customerInfo' " class="btn btn-default btn-lg btn-block" >반품 및 환불</button>
        <button type="button" onclick="location.href='/customerQna' " class="btn btn-default btn-lg btn-block" >문의</button>
        </div>
    </section>
</div>
<jsp:include page="../footer.jsp" flush="false" />
 </body>
</html>