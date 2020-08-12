<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html> 
<head>

<title>옷가게</title>
  <style>
	.center-block{
		background-color:white;
	}
     .box1{    
        background-color: white;
        padding:5%;
          
        height: auto;
        
     }
     .left{
        text-align: left;
        padding-right: 20%;
     }
     .right{
        text-align: right;
     }
   .panel-title{
    padding: 2%;
   }
   img{
     whith:500px;
     height:500px; 
   }
   .product{
     font-family: serif;
     font-size: 18px;
     font-weight: bold;
   }
      
.wrapper{
  width:100%;
}
@media(max-width:992px){
 .wrapper{
  width:100%;
} 
}
.panel-heading {
  padding: 0;
	border:0;
}
.panel-title>a, .panel-title>a:active{
	display:block;
	padding:15px;
    color:#555;
    font-size:16px;
    font-weight:bold;
	text-transform:uppercase;
	letter-spacing:1px;
    word-spacing:3px;
	text-decoration:none;
}
.panel-heading  a:before {
   font-family: 'Glyphicons Halflings';
   content: "\e114";
   float: right;
   transition: all 0.5s;
}
.panel-heading.active a:before {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	transform: rotate(180deg);
} 
 
</style>
 </head>
  <body>
  <jsp:include page="../header.jsp" flush="false" />
   <div class="container"> 
    <div class="row">
     <div class="col-md-4"">
      <div class="box1">
       
       <p style="font-size: 20px;">안녕하세요</p>
       <p style="font-size: 17px;">${email}</p>
       <p style="font-size: 23px;"><b>계정</b></p>
       <P><a href="#" class="button" style="color: black; text-decoration: underline; font-size: 15px;">결제 설정</a></P>
       <P><a href="MyPageSet" class="button" style="color: black; text-decoration: underline; font-size: 15px; ">내 설정</a></P> 
       <P><b style="font-size: 23px;"><label>도움이 필요하세요?</label></b></P>
       <P><a href="#" class="button" style="color: black; text-decoration: underline; font-size: 15px; ">문의하기</a></P> 
       <P><a href="#" class="button" style="color: black; text-decoration: underline; font-size: 15px; ">로그아웃</a></P>  
     
      </div> 
      </div>
 
   <!--  -[wpv-post-id] -->
 <%int i=0; %>
<div class="col-md-8">
<p style="font-weight: bold; text-align: center; font-size: 29px;">모든 구매 내역</p>
<br/> 
 <c:forEach items="${oDto}" var="oDto">
<% i++; %>
<div class="wrapper center-block">
  <div class="panel-group" id="accordion<%=i%>" role="tablist" aria-multiselectable="true" >
   <div class="panel panel-default">
    <div class="panel-heading active" role="tab" id="headingOne<%=i%>">
      <h4 class="panel-title">
      <a role="button" data-toggle="collapse" data-parent="#accordion<%=i%>" href="#collapseOne<%=i%>" aria-expanded="true" aria-controls="collapseOne">
       <div style="margin-left: 73%;  color: black;">상세 구매 내역</div>
        </a><br/>
       <table>
            <tr>
	      	   <td class="left">거래 완료</td>
	           <td class="right">${oDto.payDate}</td>
	        </tr>	
	        <tr>
	           <td class="left">#${oDto.order_id}</td>
	           <td class="right">&#8361;${oDto.total_price}</td>	
	        </tr>  
 	  	 </table>
      </h4>
    </div>
    <div id="collapseOne<%=i%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
        <c:forEach items="${mDto }" var="mDto">
        <c:if test="${mDto.order_id == oDto.order_id }">
         <div class="panel-body">
	          <c:forTokens items="${mDto.pd_img}" var="img" delims="," varStatus="status">
                   <c:if test="${status.last}">
                      <img src="resources/pdImages/${img}" />
                   </c:if>
			  </c:forTokens>
			        <p class="product">${mDto.pd_name}</p>
			        <p class="product">&#8361;${mDto.pd_price}</p>
			        <p class="product">상품번호:   ${mDto.pd_id}</p>
			        <p class="product">수량:   ${mDto.pd_quantity}</p>
			        <p class="product">컬러:   ${mDto.pd_color}</p>
			        <p class="product">사이즈:   ${mDto.pd_size }</p>
			        <p class="product">합계:   &#8361;${(mDto.price_sum + mDto.pd_price) * mDto.pd_quantity}</p>
			        <c:set var="sum" value="${sum + ((mDto.price_sum + mDto.pd_price) * mDto.pd_quantity)}"/>
        	 </div>	 
	     </c:if> 
	     </c:forEach><br/>
		    	      <h1 style="margin-left: 12px;">배송주소</h1><br/>
			     	  <p class="product" style="margin-left: 13px;">${oDto.dv_name}</p>
			     	  <p class="product" style="margin-left: 13px;">${oDto.dv_address1}</p>
			     	  <p class="product" style="margin-left: 13px;">${oDto.dv_address2}</p>
			     	  <p class="product" style="margin-left: 13px;">${oDto.dv_address3}</p>
			     	  <p class="product" style="margin-left: 13px;">${oDto.dv_address4}</p> 	  
			 <div class="panel-body" >
			    <p class="product">상품 합계: &#8361;${sum}</p>
			    <p class="product">배송: &#8361;${oDto.dv_option}</p>
			    <p class="product">총 합계: &#8361;${sum + oDto.dv_option}</p>
			   <c:set var="sum" value="0"/>
			 </div>
		     </div>
		   </div>
	    </div>
	   </div>
	   </c:forEach>	
	   </div>
	  </div>	
	</div>
   <jsp:include page="../footer.jsp" flush="false" />
 </body>
 <script type="text/javascript">
 $('.panel-collapse').on('show.bs.collapse', function () {
	    $(this).siblings('.panel-heading').addClass('active');
	  });

	  $('.panel-collapse').on('hide.bs.collapse', function () {
	    $(this).siblings('.panel-heading').removeClass('active');
	  });
 </script>
</html>