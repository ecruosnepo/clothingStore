<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
<style>
    #login a{text-decoration: none; color: black; margin: 5px;}
    input[type=checkbox]{
        float: left;
    }
    .findPass{
        float: right;
    }
    h4{
        display: inline;
    }
    input[type=submit], [type=button]{
        background-color: black;
        color: white;
        width: 350px;
        height: 40px;
    }
    input[type=text], input[type=password]{
        height: 45px;
        width: 350px;
    }
    p{
        text-align: center;
    }
    .input{
        margin-left: 40%;
    }
</style>
  </head>
<body>
<jsp:include page="../header.jsp" flush="false" />
    <div id="login">
        <p><a href="index">Home</a>/<a href="login">로그인/등록</a></p>
        <br>
        <h3><p>로그인</p></h3>
        <br>
        <div class="input">
            <form action="loginForm" method="post" name="loginFrm">
                <div class="form-group">
                    <h4>이메일</h4><h4 style="color: red;">*</h4><br>
                    <input required type="text" class="form-control" id="email" name="user_email" >
                </div> 
                <div class="form-group">
                    <h4>비밀번호</h4><h4 style="color: red;">*</h4><br>
                    <input type="password" class="form-control" id="password" name="user_password">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="saveInfo">
                   <label class="form-check-label" for="exampleCheck1" style="font-size: small;">로그인 상태 유지!</label>
                    <a id="findPass" href="sendEmail" style="font-size: small; margin-left: 60px;">비밀번호를 잊으셨습니까?</a>
                </div>
                <input type="button" value="로그인" onclick="loginBtn()" class="btn btn-primary" />
            </form>
        </div>
        <p><a href="userSignUp">아직 계정이 없으세요? 여기서가입하세요!</a></p>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  </body>
  <script type="text/javascript">
           function loginBtn(){      
                // 입력 값 체크
                if($.trim($('#email').val()) == ''){
                      alert('이메일을 입력해 주세요.');
                      $('#email').focus();
                      return;
                }else if($.trim($('#password').val()) == ''){
	           		  alert('패스워드를 입력해 주세요.');
	           		  $('#email').focus();
	           		  return; 
		        }else{
                      document.loginFrm.submit();
			    }              
                   
            };
   	</script>
   	<jsp:include page="../footer.jsp" flush="false" />
</html>