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
.first{
text-align: center;
}
.box{
background-color:whitesmoke;
text-align: left;
padding: 5%;
margin:5%;
}
.head{
  font-size: 25px;
}
.sub{
  font-size: 14px;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

.size{
       font-size: 25px;
       text-align: center;
 }
</style>
</head>
<body>
  <jsp:include page="../header.jsp" flush="false" />
    <div class="container"> 
      <div class="row ">
        <div class="center-block" style="width: 55%; float:none; margin:0 auto">
		   <div class="first">
		       <label><a href="#"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="address"  style="color: black; ">주소록</a></label>
		       <h2>주소록</h2>
		       <label>여기서 계정 및 구독을 관리할 수 있습니다</label>
		   </div>
			<div class="box">
			   <p class="size"><b>청구지 주소</b></p>
			  <div class="group_p">
			   <p class="head">우편번호</p>
			   <p class="sub">${user.main_address1}</p>
			  </div>
			  <div class="group_p">
			   <p class="head">주소</p>
			   <p class="sub">${user.main_address2}</p>
			  </div>
			  <div class="group_p">
			   <p class="head">아파트 명/건물 명</p>
			   <p class="sub">${user.main_address3}</p>
			  </div>
			  <div class="group_p">
			   <p class="head">동 호수/층 수</p>
			   <p class="sub">${user.main_address4}</p>
			  </div>
			   <a href="setMainAddress"><button type="button" class="btn btn-primary btn-lg" >주소 편집</button></a>
			 </div> 
			 
			<c:forEach var="add" items="${ address }"  begin="0" end="2"> 	
			 <div class="box">
			   <p class="size"><b>서브 주소</b></p>
			   <div class="group_p">
			     <p class="head">이름</p>
			     <p class="sub">${add.r_name}</p>
			   </div>
			   <div class="group_p">
			     <p class="head">우편번호</p>
			     <p class="sub">${add.address1}</p>
			   </div>
			   <div class="group_p">
			     <p class="head">주소</p>
			     <p class="sub">${add.address2}</p>
			   </div>
			   <div class="group_p">
			     <p class="head">아파트 명/건물 명</p>
			     <p class="sub">${add.address3}</p>
			  </div> 
			   <div class="group_p">
			     <p class="head">동 호수/층 수</p>
			     <p class="sub">${add.address4}</p>
			   </div>
			   <a href="updateSubAddress?address_index=${add.address_index }"><button type="button" class="btn btn-primary btn-lg" >주소 편집</button></a>
               <a href="deleteSubAddress?address_index=${add.address_index }"><button type="button" class="btn btn-danger btn-lg">주소 삭제</button></a>
			 </div>
			</c:forEach>
       </div>             
      </div>
     </div>
   <jsp:include page="../footer.jsp" flush="false" />
  </body>
</html>