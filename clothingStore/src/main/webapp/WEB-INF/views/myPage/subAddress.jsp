x<%@ page language="java" contentType="text/html; charset=UTF-8"
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
        <label class="head"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage.html"  style="color: black; ">나의 계정</a>/<a href="subAddress.html"  style="color: black; ">주소록</a></label>
    <br/>
    <br/>
        <label style="font-size: 26px;">주소록</label>
    </div>
    <div class="box" >
      <label class="size">새 주소 추가</label>
      <br/><br/><br/>
        <div class="form-group has-success">
            <label class="control-label" for="inputSuccess1" style="color: black;">이름</label>
            <input type="text" class="form-control" id="inputSuccess1">
            <br/>
            <button type="button" onclick="button1_click();" class="btn btn-primary btn-lg" style="color: white; background-color: black;">주소 검색</button> 
            <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
              function button1_click() {
                        
              new daum.Postcode({
              oncomplete: function(data) {
                      
                  }
              }).open();
             }
            </script>
             <br/><br/>
            <label class="control-label" for="inputSuccess1" style="color: black;">우편번호</label>
            <input type="text" class="form-control" id="inputSuccess1">
            <label class="sub">ex) 우편 번호를 입력합니다. 예:04177 이나135-606</label> 
            <br/><br/>
            <label class="control-label" for="inputSuccess1" style="color: black; ">도/시, 도로명 주소</label>
            <input type="text" class="form-control" id="inputSuccess1">
            <label class="sub">ex) 경기도 또는 서울 특별시</label>
            <br/><br/>
            <label class="control-label" for="inputSuccess1" style="color: black; ">상세 주소</label>
            <input type="text" class="form-control" id="inputSuccess1">
            <label class="sub">ex) 목록에서 해당 구를 찾을 수 없는 경우, '기타'를 선택하고 주소1 입력 칸에 직접 써넣으십시오.</label>
            <br/><br/>
           

         </div>
    <button type="submit" class="btn btn-primary btn-lg" style="color: white; background-color: black;">세부 정보 저장</button> 
    </div>  
    <br/>
    <br/>
    <br/>
    
    
  <br/>
  <br/>
  </div>
  </div>
  </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>