<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    .btn{
        float: right;
        margin: 10px;
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
    #sectDiv{
		margin: 50px;
		margin-left: 10%;
		max-width:60%;
	}
</style>
</head>
<body>
	<section>
		<div id="sectDiv">
		    <h1>문의 내용</h1><br><br>
		
		   <nav id="navbar-example2" class="navbar navbar-light bg-light">
		     <h2>제목 : ${dto.title}</h2>
		   </nav>
		   <div id="sectionDiv" data-spy="scroll" data-target="#navbar-example2" data-offset="0">
		     <h4 id="fat">문의내용</h4>
		     <c:if test="${ dto.file!='' || dto.file==null }">
		     	<h6 style="float: right;">첨부파일 : <a href="/questionFile/${dto.file}">${dto.file}</a></h6><br>
		     </c:if>
		     <c:if test="${ dto.orderId!=0 || dto.orderId==null }">
		     	<h6 style="float: right;"><a href=#>주문번호 : ${dto.orderId}</a></h6>
		     </c:if>
		     <p>${dto.question}</p>
		     <h4 id="fat">답변내용</h4>
		     <form action="/adminQnaUpdate?id=${dto.id}" method="post" >
			     <div class="form-group">
	                  <textarea class="form-control" name="answer" id="exampleFormControlTextarea1" rows="10" placeholder="답변 작성">${dto.answer}</textarea>
	             </div>
		         <button type="button" class="btn btn-danger" onclick="deleteClick();">삭제</button>
		         <input type="submit" class="btn btn-info">
		   		</form>
		   </div>
		</div>
	</section>
	<jsp:include page="../footer.jsp" flush="false" />
	
<c:if test="${result==1 }">
	<script>alert('내용을 입력해주세요.'); history.back(); </script>
</c:if>
<c:if test="${result==10 }">
	<script>
	alert('답변이 등록 되었습니다.'); 
	location.href='/adminQna';
	</script>
</c:if>
<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}	
	
	var boardId=getParameterByName('id');
	console.log(boardId);
	/* 삭제버튼 클릭시 */
	function deleteClick(){
		var del=confirm('해당 게시물을 삭제하시겠습니까?');
		if(del){
			location.href="/adminQnaDelete?id="+boardId;
		}
	}
</script>

</body>
</html>