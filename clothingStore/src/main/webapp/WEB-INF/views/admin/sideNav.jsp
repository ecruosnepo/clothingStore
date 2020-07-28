<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    a{
    color: black;
    }
    .row{
      width: 980px;
      margin: 0 auto;
      }
    .sidenav {
    height: 100%;
    width: 300px;
    position: fixed;
    z-index: 1;
    top: 30%;
    left: 0;
    overflow-x: hidden;
    padding-top: 20px;
    }
    
    .sidenav a {
    padding-left: 50px;
    text-decoration: none;
    font-size: 25px;
    display: block;
    color: black;
    }
    
    .sidenav a:hover {
    color: #f1f1f1;
    }
    #title{
         overflow: hidden;
          text-overflow: ellipsis;
    }
    
    @media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
    }
</style>

<div class="container">           
    <div class="center-block" style="width: 100%;">
		<div class="row">
			<aside class="sidenav">
			  <a href="/manager"><h3>관리자 페이지</h3></a><br>
			  <a href="/mgProduct"><h5>상품 등록</h5></a><br>
			  <a href="/mgQna"><h5>고객 문의 관리</h5></a><br>
			  <a href="/mgMember"><h5>고객관리</h5></a><br>
		 	</aside>
 		</div>
 	</div>
 </div>