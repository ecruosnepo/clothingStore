<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />
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
            margin-left: 30%;
           }
    
        section h1{
            text-align: center;
        }
        section button{
            float: right;
            margin: 10px;
        }
        .sidenav {
        height: 100%;
        width: 300px;
        position: fixed;
        z-index: 1;
        top: 30%;
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
        color: #f1f1f1;
        }
        #title{
             overflow: hidden;
              text-overflow: ellipsis;
        }
        #fat{
        	margin: 10px;
        }
        #sectionDiv{
        	border: 1px solid gray;
        }
        section p{
        	height: 150px;
        }
        
        @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
        }
        </style>
        
        <div class="container"> 
           
              <div class="center-block" style="width: 100%;">
    <div class="row">
        <aside class="sidenav">
            <a href="/customer"><h3>고객센터</h3></a><br>
            <a href="/customerContact"><h5>회사정보</h5></a><br>
            <a href="/customerInfo"><h5>배송/결제/반품</h5></a><br>
            <a href="/customerQna"><h5>Q&A</h5></a><br>
        </aside>
        
        <section>
            <h1>문의하기</h1><br><br>
       
           <nav id="navbar-example2" class="navbar navbar-light bg-light">
             <h2>제목 : ${dto.title}</h2>
           </nav>
           <div id="sectionDiv" data-spy="scroll" data-target="#navbar-example2" data-offset="0">
             <h4 id="fat">문의내용</h4>
             <c:if test="${ dto.file!='' || dto.file==null }">
             	<h6 style="float: right;">첨부파일 : <a href="/questionFile/${dto.file}">${dto.file}</a></h6>
             </c:if>
             <p>${dto.question}</p>
             <h4 id="fat">답변내용</h4>
             <p>${dto.answer}</p>
             <c:if test="${dto.b_check == '0'}">
                 <button type="button" class="btn btn-danger" onclick="location.href='/deleteCnf?id=${dto.id}' ">삭제</button>
                 <button type="button" class="btn btn-info" onclick="location.href='/updateForm?id=${dto.id}' ">수정</button>
             </c:if>
           </div>
        </section>
    </div>
    </div>
    </div>
    <jsp:include page="../footer.jsp" flush="false" />
</body>
</html>