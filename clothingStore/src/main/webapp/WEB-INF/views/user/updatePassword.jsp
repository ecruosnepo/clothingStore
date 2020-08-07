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

        <label class="head"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet"  style="color: black; ">내 설정</a></label>

        <p style="font-size: 26px;"><b>비밀번호 변경</b></p>
    </div>
  
    <div class="box" >
      <label class="size"></label>
        <div class="form-group has-success">
            <label class="control-label" for="inputSuccess1" style="color: black;">
                 변경하실 비밀번호를 입력 해주세요.
                <br/><br/>
            </label>
            <br/><br/>
            <form action="updatePasswordForm" method="post" name="delId">
            <label style="font-size: 21px;">변경 비밀번호</label>
            <input type="password" class="form-control" id="password" onkeyup="pwCheckFunction();" name="updatePassword1">
             <br/>
            <label style="font-size: 21px;">변경 비밀번호 확인</label>
           <input type="password" class="form-control" id="password2" onkeyup="pwCheckFunction();" name="updatePassword2">
           <p id="pwCheckMessage"></p>
           <input type="button" onclick="update()" class="btn btn-primary btn-lg" value="비밀번호 변경"/> 
          </form> 
          </div>
           </div>  
         </div>  
     </div>
    </div>
   <jsp:include page="../footer.jsp" flush="false" />  
  </body> 
<script>      
 function pwCheckFunction(){ // 비밀번호 확인
	    var userPW1 = $('#password').val();
	    var userPW2 = $('#password2').val();
	    if(userPW1.length < 8) $('#pwCheckMessage').html('비밀번호는 8자리 수 이상이어야 합니다').css('color', 'red').css('font-size', '16px');
	    else if(userPW1 == "" || userPW2 == "") $('#pwCheckMessage').html('');
	    else if(userPW1 != userPW2) $('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다').css('color', 'red').css('font-size', '16px');
	    else $('#pwCheckMessage').html('비밀번호가 서로 일치합니다').css('color','blue');
	  }

 function update(){
     if ( confirm("귀하의 비밀번호를 변경 하시겠습니까?") == true ) {
	      document.delId.submit();
	  }else{
        location.href='MyPageSet';
      }
};
 </script> 
</html>