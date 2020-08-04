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
	  body{
	  	background-color:#FAF9F8;
	  }
      section a{text-decoration: none; color: black; margin: 5px;}
      #adv h4{
      	text-align: center;
      	margin-bottom: 30px;
      }
      #goods{
          width: 980px;
          margin: 0 auto;
          font-family: sans-serif;
      }
      #goods div{
          width: 900px;
          margin: 20px;
      }
      .text-center{
          height: 700px;
          position: relative
      }
      .card-body{
          position: absolute;
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
      
      .bottom-con{
      	width: 60%;
      	margin:0 auto;
      	text-align:center;
      }
      
      .bottom-img-group{
          width: 980px;
          margin: 0 auto;          
      }
      
      .bottom-img-group .image{
          margin:0 auto;          
      }
      
      .image{
          margin: 10px;
          width: 90%;
      }
      #main1{
         background-image: url('/mainImages/main_women.jpg');
      }
      #main2{
         background-image: url('/mainImages/main_man.jpg');
      }
      #main3{
         background-image: url('/mainImages/main_kids.jpg');
      }
      #main4{
         background-image: url('/mainImages/main_story.jpg');
      }
    
</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />
	<section id="goods">
	     <div id="main1" class="card text-center">
	         <div class="card-body">
	             <h5 class="card-title">여성 의류</h5>
	             <p class="card-text">올 여름에 유행하는 필수 아이템</p>
	             <a href="#" class="btn btn-primary">Go somewhere</a>
	         </div>
	     </div>
	         <div id="main2" class="card text-center">
	             <div class="card-body">
	                 <h5 class="card-title">남성 의류</h5>
	                 <p class="card-text">올 여름에 유행하는 필수 아이템</p>
	                 <a href="#" class="btn btn-primary">Go somewhere</a>
	             </div>
	         </div>
	     <div id="main3" class="card text-center">
	         <div class="card-body">
	             <h5 class="card-title">아동복</h5>
	             <p class="card-text">올 여름에 유행하는 필수 아이템</p>
	             <a href="#" class="btn btn-primary">Go somewhere</a>
	         </div>
	     </div>
	     <div id="main4" class="card text-center">
	         <div class="card-body">
	             <h5 class="card-title">친환경 제품</h5>
	             <p class="card-text">환경을 생각하는 친환경 의류복</p>
	             <a href="#" class="btn btn-primary">Go somewhere</a>
	         </div>
	     </div>
	</section>
	<section id="adv">
		<div class="bottom-con">
	        <br><br><br>
	        <h4><a href=#>지속가능성</a></h4>
	        <div class="row mx-auto bottom-img-group">
	            <div class="col-xs-4 col-md-4 img-box">
	              <a href="#" class="thumbnail">
	                <img class="image" src="/mainImages/story(1).jpg" >
	                <br>
	                <p style="margin: 10px"></p>
	                <b>제목</b><br>
	                Read The Story</p>
	              </a>
	            </div>
	            <div class="col-xs-4 col-md-4 img-box">
	               <a href="#" class="thumbnail">
	                 <img class="image" src="/mainImages/story(2).jpg">
	                 <br>
	                 <p style="margin: 10px">
	                 <b>제목</b><br>
	                 Read The Story</p>
	               </a>
              	</div>
              	<div class="col-xs-4 col-md-4 img-box">
	                <a href="#" class="thumbnail">
	                  <img class="image" src="/mainImages/story(3).jpg">
	                  <br>
	                  <p style="margin: 10px">
	                  <b>제목</b><br>
	                  Read The Story</p>
	                </a>
              	</div>
	          </div>
	        <br><br>
		</div>
    </section>
	<jsp:include page="footer.jsp" flush="false" />   
</body>
</html>