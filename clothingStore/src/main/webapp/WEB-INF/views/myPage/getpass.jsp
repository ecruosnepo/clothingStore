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
    
    .firstCenter{
      text-align: center;
    }

     .box{
      
      background-color:whitesmoke;
      text-align: left;
      padding: 5%;
      
     }
     .size{
       font-size: 24px;
       text-align: center;
     }
     .sub{
       font-size: 12px;
       color: red;
     }
     .head{
       font-size: 12px;
     }
    
   
    </style>
    </head>
  <body>
    
    <div class="container"> 
      <div class="row ">
        <div class="center-block" style="width: 55%;">
    <div class="firstCenter">
    <br/>
        <label class="head"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet"  style="color: black; ">내 설정</a></label>
    <br/>
    <br/><br/><br/>
        <label style="font-size: 26px;">비밀번호 찾기</label>
    
    </div>
    <br/><br/><br/><br/><br/>
    <div class="box" >
      <label class="size"></label>
      
        <div class="form-group has-success">
            <label class="control-label" for="inputSuccess1" style="color: black;">귀하의 계정을 만드는 데 사용한 이메일 주소를 입력하십시오. 
                <br/><br/>귀하의 비밀번호를 재설정할 수 있는 링크를 보내드립니다.
            </label>
            <br/><br/>
            <label style="font-size: 24px;">이메일<label style="color: red; size: 5px;">*</label></label>
          <form action="#" method="POST">
            <input type="text" class="form-control" id="inputSuccess1">
            <br/>
         </div>
    <button type="submit" class="btn btn-primary btn-lg" style="color: white; background-color: black;">비밀번호 찾기</button> 
</form>
    </div>  
  </div>
  </div>
  </div>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>