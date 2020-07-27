<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		 
		.hi{
		    text-align: center;
		}
		
		.row{
		   text-align: left;
		}
		
		.cart-item{
			position:relative;
			padding-bottom: 30px;
			border-bottom:1px solid black;
		}
		
		.cart-img-box, .cart-desc{
			display:inline-block;
			height: 210px;
		}
		
		.cart-desc{
			vertical-align:top;
		}
		
		.cart-img{
			height:100%;
		}
		
		.delete-btn{
			display:inline-block;
			position:absolute;
			right:0;
			outline:0;
		}
		
	</style>    
</head>
<body>
    <div class="hi">
        <label><a href="like.html">HM.com</a>/<a href="bag.html">쇼핑백</a></label>
 
      <br/>
      <br/>
      <br/>
       <div>
           <label><b>LAST CHANCE</b>,전 상품 무료배송<b>(~7/13 17:00)!</b></label>
       </div>
       <br/>
       <br/>
       <h1 style="font-size: 2.5em;">쇼핑백</h1>
      </div>
       <div class="container">
        <div class="row">
          <div class="col-xs-5 col-sm-7">
          	<c:forEach items="${cart_list }" var="cList">
          		<div class="cart-item">
          			<c:forTokens items="${cList.pd_img }" var="img" delims="," varStatus="status">
          				<c:if test="${status.last == true }">
          				<div class="cart-img-box">
          					<a class="cart-img-link" href="/productpage/${cList.pd_id }"><img class="cart-img" alt="" src="/images/${img}"></a>          				
          				</div>
          				</c:if>
          			</c:forTokens>
          			<div class="cart-desc">
	          			상품명: ${cList.pd_name } <br/>
	          			가격: ${cList.pd_price } <br/>
	       			    상품 번호: ${cList.pd_id }
					    사이즈: ${cList.pd_size } <br/>
					    컬러: ${cList.pd_color }
					    합계: <br/>
					    <select name="pd_quantity">
	          				<%
	          					for(int i=1; i<=20; i++){
	          				%>
	          					<option value=<%=i %>><%=i %></option>
	          				<%
	          					}
	          				%>
          				</select>
          			</div>
          			
          			
          			
          			<button class="delete-btn">&#10006;</button>
          		</div>
          	</c:forEach>
            <!-- <b style="font-size: 27px;">고객님의 쇼핑백이 비어 있습니다.</b><br/>
            고객님의 쇼핑백에 이미 저장된 아이템을 저장하거나 액세스하려면 로그인합니다.
            <br/><br/>
            <a href="#">로그인</a> -->
          </div>  
          <div class="col-xs-100 col-sm-3">
            <label>할인 코드 추가</label>
          <form>
            <div class="form-group">
              <input type="text" class="form-control" id="exampleInputcard">
            </div>
          </form>
          
          
          <br/>
          <br/>
          <label>합계  </label><br/><br/>
          
          <form action="/orderForm" method="post">
          	<%-- <input type="hidden" value="${ }" > --%>
          	<button type="button" class="btn btn-primary btn-lg">결제 계속하기</button>          
          </form>
           
           
           <br/><br/>
           <label>
            가능한 결제 수단<br/><br/>
            귀하가 결제 단계에 도달할 때까지 가격 및 배송료는 확인되지 않습니다.<br/><br/>
            30일의 반품 가능 기간, 반품 수수료 및 미수취시 발생하는 추가 배송 요금 읽어보기 반품 및 환불<br/>
           </label>
          </div>
         <br/>
         <button class="btn btn-default" type="submit">추가</button> 


          

         
         <br/><br/><br/>
         
         
        </div>
    </div>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  </body>
</html> 