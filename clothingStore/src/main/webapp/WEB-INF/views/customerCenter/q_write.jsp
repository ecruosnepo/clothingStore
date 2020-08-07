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
	<c:if test="${result==1 }">
		<script>alert('제목을 입력해 주세요.'); history.back(); </script>
	</c:if>
	<c:if test="${result==2 }">
		<script>alert('분류를 입력해 주세요.'); history.back(); </script>
	</c:if>
	<c:if test="${result==10 }">
		<script>alert('문의 감사합니다.'); location.href='/customerQna'; </script>
	</c:if>
        
  <section>
  	<div id="sectDiv">
      <h1>문의하기</h1><br><br>
      <h3>1:1문의</h3>
      
      <form action="/customerWrite" method="post" enctype="multipart/form-data">
          <div class="form-row">
              <div class="col-md-9">
                  <input type="text" name="title" class="form-control" id="inputEmail3" placeholder="제목">
              </div>
              
              <div class="form-group col-md-1">
                <select id="inputState" name="boardCat" class="form-control" style="width: 200px;">
                  <option disabled selected>=== 선택 ===</option>
                  <option value="배송">배송</option>
                  <option value="결제">결제</option>
                  <option value="반품">반품</option>
                  <option value="환불">환불</option>
                  <option value="기타">기타</option>
                </select>
              </div>
          </div>
          <div class="form-group col-md-12">
              <button type="button" class="btn btn-primary" id="order" data-toggle="modal" data-target="#exampleModal">
                주문하신 상품을 선택 해주세요
              </button>
              <br>
           </div>

              <div class="form-row">
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
                   <c:forEach items="${ orderList }" var="ods" varStatus="n">
                      <h5>주문번호 : ${ ods.id }</h5>
                      <input type='checkbox' id="order${n.index}" name='orderId' value='${ ods.id }' onclick="doOpenCheck(this);"/>
                      <label for="order${n.index}" id="orderLabel"> 상품명 : ${ ods.productName }</label>
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
                  <textarea class="form-control" name="question" id="exampleFormControlTextarea1" rows="20" placeholder="문의 내용"></textarea>
              </div>
          </div>
          <div>
              <input name="uploadFile" type="file" >
          </div><br><br>
          <input type="submit" value="확인" class="btn btn-primary btn-ms">
          <button type="button" onclick="location.href='/customerQna' " class="btn btn-secondary btn-ms">취소</button>
      </form>
     </div>
  </section>
<jsp:include page="../footer.jsp" flush="false" />

<script>
//체크박스 하나만 선택
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("orderId");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
</script>
</body>
</html>


