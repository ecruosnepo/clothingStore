<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
  <style>
     .box1{    
        background-color: white;
        padding:5%;
        height: 100%;            
     }
     .box2{    
        background-color: whitesmoke;
        padding:5%;
        height: 100%;            
     }
  </style>
 </head>
  <body>
  <jsp:include page="../header.jsp" flush="false" />
   <div class="container"> 
    <div class="row">
      <div class="pull-left" style="width: 24%;">
        <div class="box1">
        <label style="font-size: 20px;">안녕하세요</label>
        <br/>
        <label style="font-size: 17px;">${email}</label>
        <br/>
        <br/>
        <b style="font-size: 23px;"><label>내 계정</label></b>
        <br/>
        <br/>
        <a href="MyPageSet" class="button" style="color: black; text-decoration: underline; font-size: 15px; ">내 설정</a>
        <br/>
        <br/>  
        <br/>
        <b style="font-size: 23px;"><label>도움이 필요하세요?</label></b>
        <br/>
        <br/>
        <a href="#" class="button" style="color: black; text-decoration: underline; font-size: 15px; ">문의하기</a>
        <br/>
        <br/>
        <a href="#" class="button" style="color: black; text-decoration: underline; font-size: 15px; ">로그아웃</a>  
      </div> 
    </div>
  <div>
  <br/>
  <label style="font-size: 20px;">모든 구매 내역</label>
    <div class="box2" style="width:600%; height: 50%">
        <label  style="font-size: 17px; color: gray;" >구매 이력 없음</label>
        <br/>
        <br/>
    <label class="button"><a href="index" style="color: black; text-decoration: underline;">TAKE ME TO THE FASHION</a></label>   
   </div> 
  </div>      
 </div>
</div>
<jsp:include page="../footer.jsp" flush="false" />
  </body>
</html>