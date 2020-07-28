<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>옷가게</title>
  <style>
     .box1{    
        background-color: white;
        padding:5%;
        height: 125%;            
     }
     .box2{    
        background-color: whitesmoke;
        padding:5%;
        height: 125%;            
     }
  </style>
 </head>
  <body>
   <div class="container"> 
    <div class="row">
      <div class="pull-left" style="width: 30%;">
        <div class="box1">
             <%
               session.getAttribute("email");
             %>
        <label>안녕하세요</label>
        <br/>
        <label>${email}</label>
        <br/>
        <br/>
        <b style="font-size: 15px;"><label>내 계정</label></b>
        <br/>
        <br/>
        <a href="#" class="button" style="color: black; text-decoration: underline; ">결제 설정</a>
        <br/>
        <br/>
        <a href="MyPageSet" class="button" style="color: black; text-decoration: underline;">내 설정</a>
        <br/>
        <br/>  
        <br/>
        <b style="font-size: 15px;"><label>도움이 필요하세요?</label></b>
        <br/>
        <br/>
        <a href="#" class="button" style="color: black; text-decoration: underline;">문의하기</a>
        <br/>
        <br/>
        <a href="#" class="button" style="color: black; text-decoration: underline;">로그아웃</a>  
      </div> 
    </div>
  <div>
    <div class="box2">
        <label>모든 구매 내역</label>
        <label>구매 이력 없음</label>
        <br/>
        <br/>
    <label class="button"><a href="#" style="color: black; text-decoration: underline;">TAKE ME TO THE FASHION</a></label>   
   </div> 
  </div>      
 </div>
</div>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>