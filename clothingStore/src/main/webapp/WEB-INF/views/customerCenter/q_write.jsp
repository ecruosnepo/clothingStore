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
      .row{
            width: 980px;
            margin: 0 auto;
          }
          section{
          margin-left: 20%;
          width: 100%;
          }
      section h1{
          text-align: center;
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
      
      @media screen and (max-height: 450px) {
      .sidenav {padding-top: 15px;}
      .sidenav a {font-size: 18px;}
      }
      </style>
      
      <div class="row">
          <aside class="sidenav">
              <a href="/customer"><h3>고객센터</h3></a><br>
              <a href="/customerContact"><h5>회사정보</h5></a><br>
              <a href="/customerInfo"><h5>배송/결제/반품</h5></a><br>
              <a href="/customerQna?userId=1"><h5>Q&A</h5></a><br>
          </aside>
        
          <section>
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
	                          <c:forEach items="${ orderList }" var="ods" >
	                             <h5>주문번호 : ${ ods.id }</h5>
	                             <input type='checkbox' name='orderId' value='${ ods.id }' onclick="doOpenCheck(this)";/> 상품명 : ${ ods.productName }
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
                      <input name="file" type="file" >
                  </div><br><br>
                  <input type="submit" value="확인" class="btn btn-primary btn-ms">
                  <button type="button" onclick="location.href='/customerQna' " class="btn btn-secondary btn-ms">취소</button>
              </form>
          </section>
          
      </div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>

<script type="text/javascript">
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("orderId");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
</script>