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
.first{
text-align: center;
}
.box{
background-color:whitesmoke;
text-align: left;
padding: 5%;
}
.sub{
font-size: 12px;
font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}
.head{
font-size: 20px;
}
.size{
       font-size: 25px;
       text-align: center;
     }
    </style>
    </head>
  <body>
    <div class="container"> 
      <div class="row ">
        <div class="center-block" style="width: 55%;">
    <div class="first">
        <label><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="address"  style="color: black; ">주소록</a></label>
        <h2>주소록</h2>
        <label>여기서 계정 및 구독을 관리할 수 있습니다</label>
     </div>
    <br/>
    <div class="box">
    <label class="size">청구지 주소</label>
    <br/>
    <br/>
    <br/>
     <label class="head">우편번호</label>
    <br/>
    <label class="sub">04117</label>
    <br/>
    <br/>
    <label class="head">도/시, 도로명 주소</label>
    <br/> 
    <label class="sub">경기도 @@시 학동로@@</label>
    <br/>
    <br/>
    <label class="head">상세 주소</label>
    <br/>
    <label class="sub">@@아파트 @@@동 ####호</label>
    <br/>
    <br/>
    <br/>
    <a href="newAddress"><button type="button" class="btn btn-primary btn-lg" style="color: white; background-color: black;">주소 편집</button></a>
    <a href="subAddress"><button type="button" class="btn btn-primary btn-lg" style="color: white; background-color: brown;">새 주소 추가</button></a>    
     </div>  
    </div>
  </div>
 </div>
    
    
    
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>