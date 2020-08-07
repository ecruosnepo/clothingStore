<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
  <style>
    
    .firstCenter{
      text-align: center;
    }

     .box{
      
      background-color:whitesmoke;
      text-align: left;
      padding: 5%;
      margin:5%;
      
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
    <jsp:include page="../header.jsp" flush="false" />
    <div class="container"> 
      <div class="row ">
        <div class="center-block" style="width: 55%; float:none; margin:0 auto">
    <div class="firstCenter">
    <br/>
        <label class="head"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet"  style="color: black; ">내 설정</a></label>
    <br/>
        <label style="font-size: 26px;">비밀번호 찾기</label>
    </div>
    <div class="box" >
      <label class="size"></label>
      
        <div class="form-group has-success">
            <label class="control-label" for="inputSuccess1" style="color: black;">귀하의 계정을 만드는 데 사용한 이메일 주소를 입력하십시오. 
                <br/><br/>임시 비밀번호를 보내 드립니다 로그인 후 변경 해주세요.
            </label>
            <br/><br/>
            <label style="font-size: 24px;">이메일<span style="color: red; size: 5px;">*</span></label>
            <form action="sendEmailForm" method="post">
            	<input type="text" class="form-control" id="inputSuccess1" name="email">
            <br/>
           <button type="submit" class="btn btn-primary btn-lg" >비밀번호 찾기</button> 
          </form> 
          </div>  
    </div>  
  </div>
  </div>
  </div>
  <jsp:include page="../footer.jsp" flush="false" />
  </body>
</html>