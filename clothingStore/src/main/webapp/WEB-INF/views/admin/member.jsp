<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
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
	#titleHd{
	width: 40%;
	}
	#titleN{
		width: 10%
	}
</style>
</head>
<body>
   <section class="customerManage">
   		<div id="sectDiv">
          <h1>고객 관리</h1><br><br>
			
          <form class="form-inline">
              <div class="input-group mb-2 mr-sm-2">
                <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Email or Name">
              </div>
            
              <button type="submit" class="btn btn-primary mb-2">검색</button>
            </form>

            <table class="table table-hover" id="qna">
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">이메일</th>
                    <th scope="col">이름</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">가입날짜</th>
                </tr>
                </thead>
                <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ startIdx }" end="${ endIdx }" >
                    <tr>
                        <td scope="row"><a href="listView?id=${ dto.id }">번호</a></td>
                        <td scope="row"><a href="listView?id=${ dto.id }">이메일</a></td>
                        <td><a href="listView?id=${ dto.id }">이름</a></td>
                        <td><a href="listView?id=${ dto.id }" id="title">전화번호</a></td>
                        <td><a href="listView?id=${ dto.id }">가입날짜</a></td>
                    </tr>
                    </c:forEach>
            </table>
            <div> <p>${ thisPage }/${ totalPage } pages</p> </div><br>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                		<c:if test="${startPageIdx > 1}">
                   			<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${thisPage-1}' ">prev</button>
                   		</c:if>
                	<c:forEach varStatus="page" begin="${startPageIdx}" end="${ endPageIdx }" >
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${page.index}' ">${page.index}</button>
                   </c:forEach>
                   <c:if test="${totalPage > endPageIdx}">
                   		<button type="button" class="btn btn-secondary" onclick="location.href='/customerQna?page=${thisPage+1}' ">next</button>
                   </c:if>
                </div>
            </div>
    	</div>
    </section>
</body>
</html>
<jsp:include page="../footer.jsp" flush="false" />