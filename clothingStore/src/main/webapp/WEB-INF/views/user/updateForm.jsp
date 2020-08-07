<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
  <style>
  
  .group_p{
   padding:1%;
 
}  
     .firstCenter{
         text-align: center;
     }		
     .box{    
        background-color: whitesmoke;
        padding:5%;
        margin:5%;            
     }
     .size{
       font-size: 24px;
       text-align: center;
     }
.head{
  font-size: 23px;
}
.sub{
  font-size: 14px;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}
  </style>
</head>
<body>
 <jsp:include page="../header.jsp" flush="false" />   
  <div class="container"> 
      <div class="row ">
        <div class="center-block" style="width:55%; float:none; margin:0 auto">
          <div class="firstCenter">
            <p class="head"><a href="index"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="MyPageSet.html"  style="color: black; ">내 설정</a>/<a href="updateForm"  style="color: black; ">내 상세 정보 편집</a></p>
              <p style="font-size: 26px;">내 상세정보 편집</p> 
               </div>    
                 <div class="box">
                   <p class="size"><b>내 세부정보</b></p>
                    <form action="userUpdate" method="post">
			             <div class="form-group has-success"><br/>	
					         <div class="group_p">	
					           <p class="head">이메일</p>         
					           <p style="font-size: 20px; color: green;">${email}</p><br/>
					         </div>
					         <div class="group_p"> 
					           <p class="head">이름</p>
					           <input type="text" class="form-control" id="inputSuccess1" name="user_name" value="${u.user_name}" onfocus="this.value='${u.user_name}';"/><br/>
					         </div>
					         <div class="group_p">
					           <p class="head">생년월일</p>
					           <input type="date" class="form-control" id="inputSuccess1" name="user_birth" value="${u.user_birth}" onfocus="this.value='${u.user_birth}';"/><br/>
					         </div>
					         <div class="group_p">
					           <p class="head">전화번호</p>
					           <input type="text" class="form-control" id="inputSuccess1" name="user_phone" value="${u.user_phone}" ; onfocus="this.value='${u.user_phone}';this.style.color='red';"/><br/>
					         </div>
					    </div>
			           <p class="head">성별</p> 
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
		            <p><button type="submit" class="btn btn-primary btn-lg btn-block">저장</button></p>
			       <a href="MyPageSet"><button type="button" class="btn btn-primary btn-lg btn-block">취소</button></a>
			   </form>
            </div>
          </div>
        </div>
      </div>
    <jsp:include page="../footer.jsp" flush="false" />
  </body>
</html>