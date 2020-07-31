<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
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
iframe{
    display: inline;
    width: 80%;
    height: 500px;
}
.sectDiv{
	margin-left: 20%;
	margin-top: 50px;
}
#mapSide{
    float: right;
    width: 50%;
    margin-right: 10%;
}

</style>
</head>
<body>
    <section >
    	<div class="sectDiv">
	       	<h1>매장 찾기</h1>
	       	<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12663.534316198635!2d127.0529089!3d37.4870736!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xaf48ea7b213c59a4!2z7IK87ISx7YOA7JuM7Yyw66as7IqkM-ywqA!5e0!3m2!1sko!2skr!4v1594374064530!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
   		</div>
   	</section>
    <section>
    	<div class="sectDiv">
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
	    </div>
    </section>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>