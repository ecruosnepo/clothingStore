<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
  <style>
     .row{
       align-self : unset;
       
     }
     .first{
       text-align: center;
     }
 
     .box{
      background-color:whitesmoke;
      text-align: left;
      padding: 5%;
     }
     .headName{
       font-size: 20px;
     }
     .subName{
       font-size: 13px;
       font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
     }
   
    </style>
    </head>
  <body>
  <%
   session.getAttribute("email");
  %>
 
  <jsp:include page="../header.jsp" flush="false" />
    <br/>  

    <div class="container"> 
      <div class="row ">
        <div class="center-block" style="width: 55%;">
    <div class="first">
        <label><a href="#" style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet" style="color: black; ">내 설정</a></label>
   
    <h2>내 설정</h2>
    <div>
      <label>여기서 계정 및 구독을 관리할 수 있습니다</label>
    </div>
  </div>
    <br/>
    <div class="box" >
      <label style="font-size: 25px;">내 세부정보</label>
    <br/>
    <br/>
    <br/>
     <label class="headName">이메일</label>
     <br/>
     <label class="subName">${u.user_email}</label>
     <br/>
     <br/>
     <label class="headName">이름</label>
     <br/>
     <label class="subName">${u.user_name}</label>
     <br/>
     <br/>
     <label class="headName">생년월일</label>
     <br/>
     <label class="subName">${u.user_birth}</label>
     <br/>
     <br/>
     <label class="headName">전화번호</label>
     <br/>
     <label class="subName">${u.user_phone}</label>
     <br/>
     <br/>
     <label class="headName">성별</label>
     <br/>
     <label class="subName">${u.user_gender}</label>
     <br/>
     <br/>
     <br/>
     <a href="updateForm"><button type="submit" class="btn btn-primary btn-lg" style="color: aqua; background-color: black;">수정</button></a>
    
     
    </div>  
    <br/>
    <br/>
    <br/>
    <div  class="box" >
      <label style="font-size: 25px;">내 주소</label>
      <br/>
      <br/>
      <label>또한 여기서 배송 주소를 추가하고 편집할 수 있습니다.</label>
      <br/>
      <br/>
      <br/>
      <label class="headName">청구지 주소</label> 
     <br/>
     <br/>
     <label class="subName">04177</label>
     <br/>
     <label class="subName">포천시 학동로47</label>
     <br/>
     <label class="subName">한신아파트 101동 1403호</label>
    <br/>
    <br/>
    <br/>
    <a href="address"><button type="submit" class="btn btn-primary btn-lg" style="color: aqua; background-color: black;">수정</button></a>
   </div>
   <br/>
   <br/>
   <br/>
    <div class="box" >
    <label class="headName">개인정보 보호</label>
    <br/>
    <br/>
    <br/>
    <a href="getpass.html" style="color: black; text-decoration: underline;">비밀번호 변경</a>
    <br/>
    <br/>
    <a href="#" style="color: black; text-decoration: underline;">계정 삭제</a>
  </div>
  <br/>
  <br/>
    </div> 
  </div>
</div>

<jsp:include page="../footer.jsp" flush="false" />
  </body>
</html>