<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        a{
        color: black;
        }
        .row{
          width: 980px;
          margin: 0 auto;
          }
          section{
          	width: 100%;
            /* margin-left: 20%; */
           }
        section h1{
            text-align: center;
        }
        section p{
        	float: right;
        }
        .q_wrqp{
        	position: relative;
        }
        
        .sidenav {
        height: 100%;
        width: 300px;
        position: absolute;
        z-index: 1;
        /* top: 30%; */
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
        	color: #d6001c;
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
        
        @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
        }
</style>
</head>
<body>

<div class="container q_wrap">            
<div class="center-block" style="width: 100%;">
    <div class="row">
        <aside class="sidenav">
            <h3><a href="/customer">고객센터</a></h3><br>
            <h5><a href="/customerContact">회사정보</a></h5><br>
            <h5><a href="/customerInfo">배송/결제/반품</a></h5><br>
            <a href="/customerQna"><h5>Q&A</h5></a><br>
        </aside>
        
        <section>
            <h1>문의하기</h1><br><br>
            <table class="table table-hover" id="qna">
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">상태</th>
                    <th scope="col">분류</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성일</th>
                </tr>
                </thead>
                <c:forEach items="${ list }" var="dto" varStatus="idx" begin="${ startIdx }" end="${ endIdx }" >
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
                        <td><a href="boardListView?id=${ dto.id }" id="title">${dto.title}</a></td>
                        <td>${dto.regDate}</td>
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
            <button type="button" class="btn btn-primary btn-lg" onclick="location.href='/customerQnaWriteForm' ">글쓰기</button>
        </section>
    </div>
    </div>
    </div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>