<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body{
			background-color:#FAF9F8;
		}
	 	button{
		 	border:none;
		 	background:none;
		 	font-size:20px;
		}
		.cart-container{
			margin-top:40px;
		}
		.hi{
		    text-align: center;
		}
		
		.row{
		   text-align: left;
		}
		
		.cart-item{
			position:relative;
			padding-bottom: 35px;
			margin-top:35px;
			border-bottom:1px solid #d0d0d0;
		}
		
		.cart-list-box > div:first-child {
			margin-top:0px;
		}
		
		.cart-list-box > div:last-child {
			border-bottom:none;
		}
		
		.cart-img-box, .cart-desc{
			display:inline-block;
			height: 210px;
		}
		
		.cart-desc{
			vertical-align:top;
			font-weight:600;
			width:60%;
			padding:0 25px;
		}
		
		.cart-desc span{
			font-size:12px;
			display:inline-block;
			width:23%;
		}
		
		.pd_name{
			margin-bottom:0px;
			font-size: 14px;
		}
		
		.cart-img{
			height:100%;
		}
		
		.cart-img-box{
			float:left;
			overflow:hidden;
			display:inline-block;
		}
		
		#quantity{
			width:80px;
			height:48px;	
			text-align:center;
			margin-top:24px;							
		}
		
		.delete-btn{
			display:inline-block;
			position:absolute;
			right:0;
			outline:0;
		}
		
		.checkout-info{
			background-color:#FFFFFF;
			height:100%;
			padding:0;	
		}
		.checkout-info-inner{
			padding:40px;			
		}
		.checkout-btn{
			align-items: center;
			font-size:14px;
			background-color:black;
		}
		.checkout-notice{
			margin-top:30px;
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
       <div class="container cart-container">
        <div class="row">
          <div class="col-xs-5 col-sm-7 cart-list-box">
          	<c:forEach items="${cart_list }" var="cList">
          		<div class="cart-item ${cList.cart_id}">
          			<c:forTokens items="${cList.pd_img }" var="img" delims="," varStatus="status">
          				<c:if test="${status.last == true }">
          				<div class="cart-img-box">
          					<a class="cart-img-link" href="/productpage/${cList.pd_id }"><img class="cart-img" alt="" src="/images/${img}"></a>          				
          				</div>
          				</c:if>
          			</c:forTokens>
          			<div class="cart-desc">
          				<input type="hidden" value="${cList.cart_id }" name="cart_id" class="cart_id"/>
	          			<h3 class="pd_name">${cList.pd_name }</h3>
	          			<p class="pd_price">&#8361; <fmt:formatNumber value="${cList.pd_price }"/></p>
	       			    <span>상품 번호: </span><span class="pd_id">${cList.pd_id }</span>
					    <span>사이즈: </span><span class="pd_size">${cList.pd_size }</span> <br/>
					    <span>색상: </span><span class="pd_color">${cList.pd_color }</span>
					    <span>합계: &#8361; </span><span class="price_sum"><fmt:formatNumber value="${cList.pd_price * cList.pd_quantity }"/></span><br/>
					    <select name="pd_quantity" id="quantity" onchange="updateQuantity(this);">
						    <c:forEach var="x" begin="0" end="20" step="1">
	          					<c:choose>
	          						<c:when test="${cList.pd_quantity eq x}">
	          							<option value=${x } selected>${x }</option>
	          						</c:when>
	          						<c:otherwise>
		          						<option value=${x }>${x }</option>
	          						</c:otherwise>
	          					</c:choose>					    
						    </c:forEach>
          				</select>
       				</div>     			
          			<button class="delete-btn" onclick="deleteCart(this)">&#10005;</button>
          		</div>
          		<c:set var="sum" value="${sum + cList.pd_price*cList.pd_quantity }"/>
          	</c:forEach>
            <!-- <b style="font-size: 27px;">고객님의 쇼핑백이 비어 있습니다.</b><br/>
            고객님의 쇼핑백에 이미 저장된 아이템을 저장하거나 액세스하려면 로그인합니다.
            <br/><br/>
            <a href="#">로그인</a> -->
          </div>  
          	<div class="col-xs-100 col-sm-5 checkout-info">
	          	<div class="checkout-info-inner">
		            <label>할인 코드 추가</label>
		          	<form>
			            <div class="form-group">
			              <input type="text" class="form-control" id="exampleInputcard">
			            </div>
		          	</form>
		          	배송비<label class=""> 2500</label><br/><br/>
		          	합계 &#8361; <label class="total_price"><fmt:formatNumber value="${sum }"/></label><br/><br/>
			          
		          	<form action="/checkoutForm" method="post">          	
		          		<button type="submit" class="btn btn-dark btn-lg btn-block checkout-btn rounded-0" onclick="">결제 계속하기</button>          
		          	</form>
		          	<div class="checkout-notice">
			            <p>가능한 결제 수단</p>
			            <p>귀하가 결제 단계에 도달할 때까지 가격 및 배송료는 확인되지 않습니다.</p>
			            <p>30일의 반품 가능 기간, 반품 수수료 및 미수취시 발생하는 추가 배송 요금 읽어보기 반품 및 환불</p>			           	
		          	</div>
	          	</div>
	      		<div class="delivery-notice">
		            <p>5만원 이상 구매 시 무료배송!</p>
		            <p>8월 14일 택배인 리프레시데이를 맞아 8월 14일에서 16일까지 3일간 배송과 반품이 이루어지지 않습니다. 따라서 13일 23시 이전 주문건에 한해 17일부터 순차적으로 배송이 재개 됩니다. 8월 17일부터 정상 배송 및 반품 예정이오니 고객님들의 너른 이해 부탁드립니다. 감사합니다.</p>
	          	</div>
      		</div>
        </div>
    </div>
    <script>
    	function updateQuantity(obj){
	    	var form = {
	                cart_id: $(obj).parent('.cart-desc').children('.cart_id').val(),
	                pd_quantity: $(obj,'option:selected').val()
	        };		
	        
	        $.ajax({
	            url: "updateCartQuantity",
	            type: "POST",
	            dataType: "json",
	            data: form,
	            success: function(result){
	            	console.log("성공");
	            	$('.total_price').text(result['total']);
	            	$(obj).parents('.cart-desc').children('.price_sum').text(result['pd_sum']);
	            }
	        });
		};
	</script>
	<script type="text/javascript">
		function deleteCart(obj){
			$.ajax({
				url:"deleteCart",
				type:"POST",
				data: {
						cart_id: $(obj).siblings('.cart-desc').children('.cart_id').val()
					},				
				success:function(data){
					$(obj).parent().remove();
				}
			});
		};
	</script>
  </body>
  <jsp:include page="../footer.jsp" flush="false" />  
</html>