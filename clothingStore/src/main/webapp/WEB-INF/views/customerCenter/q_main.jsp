<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	if ( session.getAttribute("email") == null && session.getAttribute("manager") == null ){   
%>
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요.");
	    history.back();
	</script>
<%
	}
%>
<style>
	.customerManage{
		min-height:500px;
	}
     a{
     color: black;
     }
	section{
		 min-height:400px;
	     margin-left: 200px;
	 }
     section h1{
         text-align: center;
     }
     section p{
     	float: right;
     }
     #title{
          overflow: hidden;
          text-overflow: ellipsis;
     }
	.btn-secondary {
	    color: black;
	    border: none;
	    background: none;
	}
     .btn-toolbar{
     	justify-content: center;
     }
     #sectDiv{
		margin: 50px;
		margin-left: 10%;
		max-width:70%;
	}
	#titleHd{
	width: 40%;
	}
	#titleN{
		width: 10%
	}
</style>
</head>
<jsp:include page="sideNav.jsp" flush="false" />
<body>
	<section  class="customerManage">
		<div id="sectDiv">
		    <h1>문의하기</h1><br><br>
		    <table class="table table-hover" id="qna">
		        <thead>
		        <tr>
		            <th scope="col" id="titleN">번호</th>
		            <th scope="col" >상태</th>
		            <th scope="col" >분류</th>
		            <th scope="col" id="titleHd">제목</th>
		            <th scope="col" >작성일</th>
		        </tr>
		        </thead>
		        <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ page.startIdx }" end="${ page.endIdx }" >
		          <tr>
		              <td scope="row"><a href="boardListView?id=${ dto.id }">${idx.index+1}</a></td>
		              <td>
		                  <c:if test="${dto.b_check == '0'}">
		                      미확인
		                  </c:if>
		                  <c:if test="${dto.b_check == '1'}">
		                      완료
		                  </c:if>
		              </td>
		              <td>${dto.boardCat}</td>
		              <td style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
		              	<a href="boardListView?id=${ dto.id }" id="title"><c:out value="${dto.title}" /></a>
		              </td>
		              <td>${dto.regDate}</td>
		          </tr>
		         </c:forEach>
		  </table>
		  <div> <p>${ page.thisPage }/${ page.totalPage } pages</p> </div><br>
		  <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		      <div class="btn-group mr-2" role="group" aria-label="First group">
		      		<c:if test="${page.startPageIdx > 1}">
		         		<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${page.thisPage-1}' ">prev</button>
		         	</c:if>
		      	<c:forEach varStatus="num" begin="${page.startPageIdx}" end="${ page.endPageIdx }" >
		         	<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${num.index}' ">${num.index}</button>
		         </c:forEach>
		         <c:if test="${page.totalPage > page.endPageIdx}">
		         	<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${page.thisPage+1}' ">next</button>
		         </c:if>
		      </div>
		  </div>
		  <button type="button" class="btn btn-primary btn-lg" onclick="location.href='/customerQnaWriteForm' ">글쓰기</button>
		</div>
	</section>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>