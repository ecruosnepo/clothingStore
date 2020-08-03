<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>옷가게</title>
  <style>
     .firstCenter{
         text-align: center;
     }		
     .box{    
        background-color: whitesmoke;
        padding:5%;
        height: 90%;            
     }
     .size{
       font-size: 24px;
       text-align: center;
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
        <div class="center-block" style="width: 65%;">
          <div class="firstCenter">
            <label class="head"><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet.html"  style="color: black; ">내 설정</a>/<a href="updateForm"  style="color: black; ">내 상세 정보 편집</a></label>
        <br/>
        <br/>
        <label style="font-size: 26px;">내 상세정보 편집</label> 
        <br/>
       </div>    
        <div class="box">
            <label class="size">내 세부정보</label>
            <br/><br/><br/>
            <form action="userUpdate" method="post">
         		<div class="form-group has-success">	
            <label class="control-label" for="inputSuccess1" style="color: black; ">이메일</label>         
            <br/>
            <label style="font-size: 20px; color: green;">${email}</label>
            <br/>
            <br/>
            <label class="control-label" for="inputSuccess1" style="color: black; ">이름</label>
            <input type="text" class="form-control" id="inputSuccess1" name="user_name" value="${u.user_name}" onfocus="this.value='${u.user_name}';"/>
            <br/>
            <label class="control-label" for="inputSuccess1" style="color: black; ">생년월일</label>
            <input type="date" class="form-control" id="inputSuccess1" name="user_birth" value="${u.user_birth}" onfocus="this.value='${u.user_birth}';"/>
            <br/>
            <label class="control-label" for="inputSuccess1" style="color: black; ">전화번호</label>
            <input type="text" class="form-control" id="inputSuccess1" name="user_phone" value="${u.user_phone}" ; onfocus="this.value='${u.user_phone}';this.style.color='red';"/>
         	</div>
	        <label>성별</label> 
	         <br/>
	         <select class="form-control" name="user_gender" >
	            <c:choose>
		            <c:when test="${ u.user_gender eq'여성'}">
		              <option value="여성" selected>여성</option>
		              <option value="남성">남성</option>
		            </c:when>
		            <c:when test="${ u.user_gender eq '남성' }">
		              <option value="여성">여성</option>
		              <option value="남성" selected>남성</option>
		            </c:when>
		           <c:otherwise>
		             <option value="남성">남성</option>
		             <option value="여성">여성</option>
		           </c:otherwise>
	            </c:choose>
	         </select>
	         <br/>
	         <br/>
	        <label>옷가게의 <a href="#" style="color: black; text-decoration: underline;">개인정보 고지사항</a>에 따라 고객의 데이터를 처리합니다.</label>
	        <br/>
	        <br/>
	        <button type="submit" class="btn btn-primary btn-lg btn-block" style="color: white; background-color: black;">저장</button>
	       	<a href="MyPageSet"> <button type="button" class="btn btn-default btn-lg btn-block">취소</button></a>
        </form>
       </div>
      </div>
    </div>
     <jsp:include page="../footer.jsp" flush="false" />
  </div>

 
  </body>
</html>
