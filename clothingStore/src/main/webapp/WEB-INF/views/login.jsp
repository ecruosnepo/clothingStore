<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>옷가게</title>
    
        
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
    input[type=submit]{
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

    <div id="login">
        <p><a href="index">Home</a>/<a href="login">로그인/등록</a></p>
        <br>
        <h3><p>로그인</p></h3>
        <br>
        <div class="input">
            <form action="LoginForm" method="post">
                <div class="form-group">
                    <h4>이메일</h4><h4 style="color: red;">*</h4><br>
                    <input type="text" class="form-control" id="exampleInputEmail1" name="user_email">
                </div>
                <div class="form-group">
                    <h4>비밀번호</h4><h4 style="color: red;">*</h4><br>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="user_password">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="saveInfo">
                    <label class="form-check-label" for="exampleCheck1" style="font-size: small;">로그인 상태 유지!</label>
                    <a id="findPass" href="updatePass" style="font-size: small; margin-left: 60px;">비밀번호를 잊으셨습니까?</a>
                </div>
                <br><br>
                <input type="submit" value="로그인">
            </form>
        </div>
        <p><a href="userSignUp">아직 계정이 없으세요? 여기서가입하세요!</a></p>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>






