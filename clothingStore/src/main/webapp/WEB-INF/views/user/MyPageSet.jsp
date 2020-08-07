<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
  <style>
     .group_p{
       padding:1.8%;
      
     }
     .first{
       text-align: center;
     }

     .box{
      background-color:whitesmoke;
      text-align: left;
      padding: 5%;
      margin: 5%;
      
     }
     .headName{
       font-size: 25px;
     }
     .subName{
       font-size: 14px;
       font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
     }
    </style>
    </head>
  <body>
  <jsp:include page="../header.jsp" flush="false" />  
    <div class="container" > 
      <div class="row" class="row text-center">
        <div class="center-block" style="width: 50%; float:none; margin:0 auto">
         <div class="first">
          <label><a href="#" style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet" style="color: black; ">내 설정</a></label>
        <h2>내 설정</h2>
      <label>여기서 계정 및 구독을 관리할 수 있습니다</label>
    </div>    
 <div class="box" >
    <p style="font-size: 25px;"><b>내 세부정보</b></p>
	   <div class="group_p">
	     <p class="headName">이메일</p>
	     <p class="subName">${user.user_email}</p>
	   </div>
	   <div class="group_p">
	     <p class="headName">이름</p>
	     <p class="subName">${user.user_name}</p>
	   </div>  
	    <div class="group_p">
	      <p class="headName">생년월일</p>
		  <p class="subName">${user.user_birth}</p>
		</div>
		<div class="group_p">   
		  <p class="headName">전화번호</p>
		  <p class="subName">${user.user_phone}</p>
		</div>
		<div class="group_p">  
		  <p class="headName">성별</p>
		  <p class="subName">${user.user_gender}</p>
	    </div>
     <a href="updateForm"><button type="submit" class="btn btn-primary btn-lg" >수정</button></a> 
 </div>  
     <div class="box" >
       <P style="font-size: 25px;"><b>내 주소</b></P>
		     <P>또한 여기서 배송 주소를 추가하고 편집할 수 있습니다.</p>
		     <P class="headName">청구지 주소</P> 	   
		     <P class="subName">${user.main_address1}</P>
		     <P class="subName">${user.main_address2}</P>
		     <P class="subName">${user.main_address3}</P>
		     <P class="subName">${user.main_address4}</P>
	         <P><a href="address"><button type="submit" class="btn btn-primary " >주소록 편집</button></a></P>
			 <p>${ message }</p> 
	 </div>
     <div class="box" >  
	   <P class="headName" style="font-size: 25px;" id="deleteID"><b>개인정보 보호</b></P>
		  <P><a href="updatePassword"><button class="btn btn-primary">비밀번호 변경</button></a></P>
		      <form action="deleteInfoUser" method="post" name="delId">	  
		      <P><input type="button" onclick="deleteId()" class="btn btn btn-danger btn-round " value="계정삭제"/></P>
		      </form>
         </div>
      </div> 
   </div>
</div>
  <jsp:include page="../footer.jsp" flush="false" />
</body>
<script>

function deleteId() {  

      if ( confirm("귀하의 계정을 삭제 하시겠습니까?") == true ) {
	      document.delId.submit();
	  }else{
          return false;
      }
 }
</script>
</html>