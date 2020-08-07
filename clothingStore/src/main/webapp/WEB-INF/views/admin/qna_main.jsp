<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#boardCat{
		margin: 5px;
	}
	#titleHd{
	width: 40%;
	}
	#titleN{
		width: 10%
	}
</style>
</head>
<body>
<jsp:include page="sideNav.jsp" flush="false" />
      <section>
      	<div id="sectDiv">
          <h1>문의 관리</h1><br><br>
<<<<<<< HEAD
            <div class="form-check mb-2 mr-sm-2" style="float:right; ">
            	<form action="/adminQnaSearch" method="get" class="form-inline" >
	              <select id="boardCat" name="boardCat" class="form-control" style="width: 150px; ">
	                <option value="">모두 보기</option>
	                <option value="배송">배송</option>
	                <option value="결제">결제</option>
	                <option value="반품">반품</option>
	                <option value="환불">환불</option>
	                <option value="기타">기타</option>
	              </select>
	              <input type="text" class="form-control" name="search" id="inlineFormInputGroupUsername2" placeholder="Email" >
	          	  <input type="submit" class="btn btn-primary" value="검색" style="margin:5px;">
	           </form>
			</div>
=======
          <form action="/adminQnaSearch" method="get" class="form-inline" style="float:left;">
              <div class="input-group mb-2 mr-sm-2">
                <input type="text" class="form-control" name="keyword" id="inlineFormInputGroupUsername2" placeholder="Email or Name">
              </div>
              <input type="submit" class="btn btn-primary mb-2" value="검색">
           </form>
            <div class="form-check mb-2 mr-sm-2" style="float:right;">
              <select id="inputState" name="boardCat" class="form-control" style="width: 200px;">
                <option selected>== 분류 ==</option>
                <option value="배송">배송</option>
                <option value="결제">결제</option>
                <option value="반품">반품</option>
                <option value="환불">환불</option>
                <option value="기타">기타</option>
              </select>
            </div>

>>>>>>> 65991e0a8eb195f023ebe53009a565cdcd439121
            <table class="table table-hover" id="qna">
                <thead>
                <tr>
                    <th scope="col"  id="titleN">번호</th>
                    <th scope="col">상태</th>
                    <th scope="col">분류</th>
                    <th scope="col" id="titleHd">제목</th>
                    <th scope="col">이메일</th>
                    <th scope="col">작성일</th>
                </tr>
                </thead>
                <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ page.startIdx }" end="${ page.endIdx }" >
                    <tr>
                        <td scope="row"><a href="adminQnaView?id=${ dto.id }">${idx.index+1}</a></td>
                        <td>
                            <c:if test="${dto.b_check == '0'}">
                                미확인
                            </c:if>
                            <c:if test="${dto.b_check == '1'}">
                                완료
                            </c:if>
                        </td>
                        <td>${dto.boardCat}</td>
                        <td><a href="adminQnaView?id=${ dto.id }" id="title">${dto.title}</a></td>
                        <td>${dto.user_email}</td>
                        <td>${dto.regDate}</td>
                    </tr>
               </c:forEach>
            </table>
            <div> <p>${ page.thisPage }/${ page.totalPage } pages</p> </div><br>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                		<c:if test="${page.startPageIdx > 1}">
                   			<button type="button" class="btn btn-secondary" onclick="location.href='/adminQna?page=${page.thisPage-1}' ">prev</button>
                   		</c:if>
                 <c:forEach varStatus="num" begin="${page.startPageIdx}" end="${ page.endPageIdx }" >
		         	<button type="button" class="btn btn-secondary" onclick="location.href='/adminQna?page=${num.index}' ">${num.index}</button>
		         </c:forEach>
                   <c:if test="${page.totalPage > page.endPageIdx}">
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/adminQna?page=${page.thisPage+1}' ">next</button>
                   </c:if>
                </div>
            </div>
        </div>
     </section>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>