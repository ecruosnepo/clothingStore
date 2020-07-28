<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
    section a{text-decoration: none; color: black; margin: 5px;}
    #adv h4{text-align: center;}
    #goods{
        width: 980px;
        margin: 0 auto;
        font-family: sans-serif;
    }
    #goods div{
        width: 80%;
        margin: 0 auto;
    }
    .text-center{
        height: 700px;
        background-color: blue;
    }
    .card-body{
      bottom: 20%;
    }
    .cs2{
        background-color: bisque
    }
    .item{
        background-color: aquamarine;
        height: 400px;
        width: 300px;
        margin: 10px;
        border: 1px solid black;
    }
    #adv{ 
        width:100%;
        background-color: bisque;
    }
    .row{
        width: 980px;
        margin: 0 auto;
    }
    .image{
        margin: 10px;
        width: 90%;
    }
    .main1{
        /* 배경이미지 넣기 */
    }
    .main2{
        /* 배경이미지 넣기 */
    }
    .main3{
        /* 배경이미지 넣기 */
    }
    .main4{
        /* 배경이미지 넣기 */
    }
    
</style>
</head>
<body>

<jsp:include page="header.jsp" flush="false" />
<%if (session.getAttribute("email") == null ){%>
<section id="goods">
       <label><a href="login">로그인</a></label>
      <br/>
      <label><a href="userSignUp">회원가입</a></label>
      <br/>
       <a>
    <div id="main1" class="card text-center">
        <div class="card-body">
        </div>
    </div>
    </a>
    <a>
        <div id="main2" class="card text-center">
            <div class="card-body">
            </div>
        </div>
    </a>
    <a>
    <div id="main3" class="card text-center">
        <div class="card-body">
        </div>
    </div>
    </a>
    <a>
    <div id="main4" class="card text-center">
        <div class="card-body">
        </div>
    </div>
    </a>
</section>
<section id="adv">
    <br><br><br>
    <h4><a href=#>지속가능성</a></h4>
    <div class="row">
        <div class="col-xs-6 col-md-4">
          <a href="#" class="thumbnail">
            <img class="image" src="image/logo.png">
            <br>
            <p style="margin: 10px">
            <b>제목</b><br>
            Read The Story</p>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#" class="thumbnail">
              <img class="image" src="image/logo.png">
              <br>
              <p style="margin: 10px">
              <b>제목</b><br>
              Read The Story</p>
            </a>
          </div>
          <div class="col-xs-6 col-md-4">
            <a href="#" class="thumbnail">
              <img class="image" src="image/logo.png">
              <br>
              <p style="margin: 10px">
              <b>제목</b><br>
              Read The Story</p>
            </a>
          </div>
      </div>
    <br><br>
</section>
 <%}else {%>    
 <section id="goods"> 
${email}님 환영합니다.
 <label><a href="MyPage">MyPage</a></label>  
<form action="Logout" method="get">
   <input type="submit" value="로그아웃"> 
</form>
<%-- <%
 	session.invalidate();
 	out.println("<script>alert('로그아웃되었습니다'); history.back();</script>");
 	response.sendRedirect("index.jsp");
 %> --%>
    <a>
    <div id="main1" class="card text-center">
        <div class="card-body">
        </div>
    </div>
    </a>
    <a>
        <div id="main2" class="card text-center">
            <div class="card-body">
            </div>
        </div>
    </a>
    <a>
    <div id="main3" class="card text-center">
        <div class="card-body">
        </div>
    </div>
    </a>
    <a>
    <div id="main4" class="card text-center">
        <div class="card-body">
        </div>
    </div>
    </a>
</section>
<section id="adv">
    <br><br><br>
    <h4><a href=#>지속가능성</a></h4>
    <div class="row">
        <div class="col-xs-6 col-md-4">
          <a href="#" class="thumbnail">
            <img class="image" src="image/logo.png">
            <br>
            <p style="margin: 10px">
            <b>제목</b><br>
            Read The Story</p>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#" class="thumbnail">
              <img class="image" src="image/logo.png">
              <br>
              <p style="margin: 10px">
              <b>제목</b><br>
              Read The Story</p>
            </a>
          </div>
          <div class="col-xs-6 col-md-4">
            <a href="#" class="thumbnail">
              <img class="image" src="image/logo.png">
              <br>
              <p style="margin: 10px">
              <b>제목</b><br>
              Read The Story</p>
            </a>
          </div>
      </div>
    <br><br>
</section>

    <%} %> 
<jsp:include page="footer.jsp" flush="false" />   
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>