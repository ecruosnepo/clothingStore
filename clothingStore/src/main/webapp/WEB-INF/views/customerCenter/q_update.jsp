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
      section{
		 min-height:400px;
	     margin-left: 100px;
	 }
      section h1{
          text-align: center;
      }
     .form-group{
          width: 100%;
      }
      
      section button, .btn-primary{
          width: 100px;
      }
      #order{
        width: 100%;
      }
      .form-row{
        width: 100%;
      }
      #sectDiv{
      	margin:0 auto;
		margin: 50px;
		margin-left: 20%;
		max-width:50%;
	}
	</style>
</head>

<body>
    <section>
    	<div id="sectDiv">
	        <h1>문의 글 수정</h1><br><br>
	        <h3>1:1문의</h3>
	        <form action="/boardUpdate?id=${ dto.id }" method="post" enctype="multipart/form-data">
	            <div class="form-row">
	                <div class="col-md-8">
	                    <input type="text" name="title" class="form-control" id="inputEmail3" placeholder="제목" value="${dto.title}">
	                </div>
	                <div class="form-group col-md-1">
	                  <select id="inputState" name="boardCat" class="form-control" style="width: 200px;">
	                      <!-- 기존 선택한 boardcat -->
	                    <option value="${ dto.boardCat }" selected>${ dto.boardCat }</option>
	                    <!-- 선택하지 않은 boardcat 리스트 -->
	                    <c:forEach var="boardCat" items="${ otherCatList }">
	                      <option value="${ boardCat }" >${ boardCat }</option>
	                    </c:forEach>
	                  </select>
	                </div>
	                   <div class="form-group col-md-12">
	                      <button type="button" class="btn btn-primary" id="order" data-toggle="modal" data-target="#exampleModal">
	                        주문하신 상품을 선택 해주세요
	                      </button>
	                      <br>
	                    </div>
	
	                      <!-- Modal -->
	                      <div class="modal fade" id="exampleModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                        <div class="modal-dialog">
	                          <div class="modal-content">
	                            <div class="modal-header">
	                              <h5 class="modal-title" id="exampleModalLabel">주문 내역</h5>
	                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                <span aria-hidden="true">&times;</span>
	                              </button>
	                            </div>
	                            
	                            <div class="modal-body">
	  	                          <c:forEach items="${ orderList }" var="ods" > 
		                          	<h5>주문번호 : ${ ods.id }</h5>
	 	                          	<c:choose> 
	 								    <c:when test="${ods.id == dto.orderId }"> 
		                          		<!-- 선택된 주문번호 -->
				                            <input type='checkbox' name='orderId' value='${ ods.id }' onclick="doOpenCheck(this)" checked/> 상품명 : ${ ods.productName } 
	 								    </c:when> 
	 								    <c:otherwise> 
									    <!-- 선택안된 주문번호 출력 -->
				                             <input type='checkbox' name='orderId' value='${ ods.id }' onclick="doOpenCheck(this)"/> 상품명 : ${ ods.productName }
	 								    </c:otherwise>
									</c:choose> 
									<hr>
	 	                          </c:forEach> 
	                            </div>
	                            
	                            <div class="modal-footer">
	                              <button type="button" class="btn btn-primary" data-dismiss="modal">선택</button>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                <div class="form-group">
	                    <textarea class="form-control" name="question" id="exampleFormControlTextarea1" rows="20" placeholder="문의 내용">${dto.question}</textarea>
	                </div>
	            </div>
	            <div>
	                <input name="file" type="file">
	            </div><br><br>
	            <input type="submit" class="btn btn-primary btn-ms" value="수정">
	            <button type="button" onclick="location.href='/boardListView?id=${dto.id}' " class="btn btn-secondary btn-ms">취소</button>
	        </form>
	    </div>
    </section>
<jsp:include page="../footer.jsp" flush="false" />

<script>
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("orderId");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }	

	var boardId=getParameterByName('id');
</script>
<c:if test="${result==1 }">
	<script>alert('제목을 입력해 주세요.'); history.back(); </script>
</c:if>
<c:if test="${result==10 }">
	<script>
	alert('해당 게시물이 수정되었습니다.'); 
	location.href='/boardListView?id='+boardId;
	</script>
</c:if>

</body>
</html>

