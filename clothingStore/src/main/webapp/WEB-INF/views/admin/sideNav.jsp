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
    .q_wrqp{
	   	position: relative;
	   	height:100%;
	   	display:inline-block;
	   }
	   
   .sidenav {
	   /* height: 100%;  */
	   width: 300px;
	   position: absolute;
/* 	   z-index: 1; */
	   left: 0;
	   overflow-x: hidden;
	   padding-top: 20px;
   }
    .sidenav a {
    padding-left: 50px;
    text-decoration: none;
    /* font-size: 25px; */
    display: block;
    color: black;
    }
    
    .sidenav a:hover {
    color: #d6001c;
    }

</style>
<% 
	if ( session.getAttribute("manager") == null ){
%>
	<script type="text/javascript">
		alert("관리자만 이용 가능한 페이지 입니다.");
	    history.back();
	</script>
<%
	}
%>
<div class="container q_wrap">           
    <div class="center-block" style="width: 100%;">
		<div class="row">
			<aside class="sidenav">
				<h3><a href="/admin">관리자 페이지</a></h3><br>
				<h5><a href="/adminMember">고객관리</a></h5><br>
				<h5><a href="/adminQna">고객 문의 관리</a></h5><br>
				<h5><a href="/adminPdList">상품 관리</a></h5><br>
				<h5><a href="/adminProduct">상품 등록</a></h5><br>
			 	<h5><a href="adminOrderList">주문현황</a></h5><br>
		 	</aside>
 		</div>
 	</div>
 </div>