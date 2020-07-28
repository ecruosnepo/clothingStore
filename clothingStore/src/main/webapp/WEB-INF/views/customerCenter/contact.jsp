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
    width: 50%;
    }
 .sidenav {
height: 100%;
width: 20%;
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
display: block;
color: black;
}

.sidenav a:hover {
color: #f1f1f1;
}

@media screen and (max-height: 450px) {
.sidenav {padding-top: 15px;}
.sidenav a {font-size: 18px;}
}
iframe{
    display: inline;
    width: 80%;
    height: 70%;
}
#mapSide{
    float: right;
    width: 50%;
    margin-right: 10%;
}

</style>

<div class="row">
    <aside class="sidenav">
        <a href="/customer"><h3>고객센터</h3></a><br>
        <a href="/customerContact"><h5>회사정보</h5></a><br>
        <a href="/customerInfo"><h5>배송/결제/반품</h5></a><br>
        <a href="/customerQna"><h5>Q&A</h5></a><br>
    </aside>
    <section >
        <h1>매장 찾기</h1>
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12663.534316198635!2d127.0529089!3d37.4870736!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xaf48ea7b213c59a4!2z7IK87ISx7YOA7JuM7Yyw66as7IqkM-ywqA!5e0!3m2!1sko!2skr!4v1594374064530!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </section>
    <section>
        <p style="font-size: medium;">
            <b>문의</b>
            <br/>
            언제든지 연락 주십시오.
            <br/><br/>
            <b>고객센터 운영시간</b>
            <br/>
            월요일~일요일: 9am ~ 9pm  
            <br/>
            (연중무휴)
            <br/>
            <br/>
            <b>전화 연락:</b> 
            <br/>
            012-345-6789
            <br/>
            <br/>
            무료전화
            <br/>
            <br/>
            <b>우편주소</b> 
            <br/>
            <br/>
            고객서비스 담당자 앞
            <br/>
            서울특별시 종로구 종로51
            <br/>
            종로타워17층
            <br/>
            03161
            <br/>
            <br/>
            <b>반품 주소</b> 
            <br/>
            <br/>
            옷가게 헤네스엔모리츠 온라인 물류센터
            <br/>
            경기도 이천시 마장면 억만리로 130
            <br/>
            17382
          </p>
    </section>
</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>