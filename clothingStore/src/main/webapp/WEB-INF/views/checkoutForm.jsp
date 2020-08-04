<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% session.setAttribute("email", "123@123"); %> --%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Hello, world!</title>
    <style>
    	body{
    		background-color:#FAF9F8;
    	}
    	
    	header{
    		height:72px;
    	}
    	
    	.sidebar{
			overflow:hidden;
			height:auto;	
    	}
    	
    	.header_logo{
          display: block;
          width: 68px;
          height: 44px;
          margin: 20px auto 0;
          overflow: hidden;
        }
        
        .header_logo:before{
            width: 68px;
            height: 44px;
            display: block;
            background-image: url("/icons/headerlogo.png");
            content: '';
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
            background-color: unset;
        }
    	
    	.inputContents{
    		background-color:white;
    	}
    	
        .container{
          height: 100vh;
        }
        
        p{
          margin:0;
        }
        
        .info, .sidebar{         
          width: 100%;
          padding: 0;
          margin: 0;
          background-color:white;
        }

        .container > .row {
          height: 100%;
          border: none;
        }

        .btn:hover{
          text-decoration: underline;
        }

        .user-order-form, .address-order-form, .payment-order-form{
          display:none;
        }

        .info-group{
          height: 1em;
        }

        .info{
          margin-bottom: 30px;
          padding: 30px;
          padding-bottom: 10px;
        }

        .info *{
          width: 100%;
        }
        
        .selectedAddress{
        	text-align:left;
        }
        
        .address-order-form {
        	
        }
        
        .deliveryMethodSelect{
        	height:160px;
        }
        
        .radioBox{
        	height:50%;
        	display:flex;
        	align-items: center;
        	padding: 20px 10px;
        }
        
        .radioBox *{
        	width: auto;        	
        }
        
        .radioBox:hover{
        	background-color:#F4EDDD;
        }
        
        input[type='radio']::checked {
        	background-color:#F4EDDD;
        }
        
        .selectedAddress{
        	height:60px;
        }
        
        .addressList:hover{
        	background-color:#F4EDDD;
        }
        
        button{
        	border:none;
        	background:none;
        }
        
        button:focus { 
		    outline: none; 
		}

        .address-box{
          width: 100%;
        }
        
        .submitBtn{
        	background-color:black;
        	color:white;
        	height:50px;
        	width:200px;
        	margin:20px 0;
        }
        
        .payment-list{
          text-align: center;
        }

		.card-body{
			border:none;
		}
		
		.orderDetail{
			text-align:left;
			padding:0;
		}
		
		.orderDetail:hover{
			color:#D6001C;
		}

    </style>
  </head>
  <body>
    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
    <div class="container">
    <header>
    	<a class="header_logo" href="/"></a>
    </header>
      <div class="row">
        <div class="col-md-7 info-group">
          <div class="row user-info info">
            <header>
              <h4>내 정보</h4>
            </header>
            <div class="user-readonly">
              <p>이메일</p>
              <p>${user.user_email }</p>
            </div>
            <form class="user-order-form" method="post">
              <input name="user_email" type="hidden" value="${user.user_email }"/>
              <div class="form-row">
                <div class="col-md-12 mb-3">
                  <label for="validationDefault01">이름</label>
                  <input name="user_name" type="text" class="form-control" id="validationDefault01" value="${user.user_name }" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-3 mb-3">
                  <label for="validationDefault03">우편번호</label>
                  <input name="main_address1" type="text" class="form-control" id="postcode" value="${user.main_address1 }" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-12 mb-3">
                  <label for="validationDefault03">주소</label>
                  <input name="main_address2" type="text" class="form-control" id="address" value="${user.main_address2 }" required>
                </div>                
              </div>
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label for="validationDefault03">아파트 명/건물 명</label>
                  <input name="main_address3" type="text" class="form-control" id="address-name" value="${user.main_address3 }">
                </div>
                <div class="col-md-6 mb-3">
                  <label for="validationDefault03">동 호수/층수</label>
                  <input name="main_address4"  type="text" class="form-control" id="address-dong" value="${user.main_address4 }">
                </div>                
              </div>
              <div class="form-row">                
                <div class="col-md-12 mb-3">
                  <label for="validationDefault03">전화번호</label>
                  <input name="user_phone"  type="text" class="form-control" id="address-dong" value="${user.user_phone }" required>
                </div>                
              </div>
              <input type="button" class="btn" onclick="DaumPostcode()" value="주소 검색" />
              <button  class="submitBtn" onclick="editUserInfoBtn(this)">배송 단계로 넘어가기</button>
            </form>
            <button class="user-info-btn btn" onclick="editUserInfo(this)">수정</button>
          </div>
          
          <div class="row address-info info">
            <h4>배송</h4>            
            <div class="address-readonly">
				<p>배송 종류</p>
				<p>일반 배송</p>
				
				<p>배송 주소</p>
				<p>${user.main_address1 } ${user.main_address2 } ${user.main_address3 } ${user.main_address4 }</p>
				
				<p>배송 업데이트를 위한 전화번호</p>
				<p>${user.user_phone }</p>
            </div>            
            <form class="address-order-form">
            	<h5>배송 방법</h5>
				<div class="deliveryMethodSelect inputContents">
					<div class="radioBox">
						<input type="radio" id="basicMethod" name="dv_option" checked="checked" value="2500"/>
						<label for="basicMethod">일반 배송</label>
					</div>
					<div class="radioBox">
						<input type="radio" id="fastMethod" name="dv_option" value="3000"/>
						<label for="fastMethod">특급 익일 배송</label>
					</div>
				</div>
				<h5>배송 주소</h5>
				<div class="addressSelectBox">					
					<!-- Button trigger modal -->
					<button type="button" data-toggle="modal" data-target="#exampleModal" class="selectedAddress inputContents">
					  ${user.main_address1 } ${user.main_address2 } ${user.main_address3 } ${user.main_address4 }
					</button>
					
					<!-- Modal -->
					<div class="modal fade modal-address" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg">
					    <div class="modal-content">					      
					      <div class="modal-body">
					        <c:forEach items="${address_list }" var="aList">
       						 	<div class="addressList">
					        		<button class="addressBtn">${aList.r_name },${aList.address1 },${aList.address2 },${aList.address3 },${aList.address4 }</button>
					        	</div>   
						    </c:forEach>
					      </div>					      
					    </div>
					  </div>
					</div>
				</div>
				<h6>필수 전화번호</h6>
				<div class="phoneBox">
					<input type="text" name="user_phone" value="${user.user_phone }" style="height:50px;">
				</div>
				<h6>배송업체에 전하는 메세지</h6>
				<div class="message">
					<input type="text" name="dv_message" style="height:50px;">
				</div>
				<button class="submitBtn" type="button" onclick="editAddressInfoBtn()">결제 단계로 넘어가기</button>
            </form>
            <button class="address-info-btn btn" value="수정" onclick="editAddressInfo(this)">
              수정
            </button>
          </div>
          
          <div class="row payment-info info">
            <h4>결제</h4>
            <div class="payment-readonly">

            </div>
            <form class="payment-order-form">

            </form>
            <button class="payment-info-btn btn" value="수정" onclick="">
              수정
            </button>
          </div>
          <div class="row submit-btn">
          <form action="">
          	<input type="text" value="${user.user_email }" name="user_email" id="user_email"/>
          	<input type="text" value="${user.user_name }" name="user_name" id="user_name"/>
          	<input type="text" value="${user.user_phone }" name="user_phone" id="user_phone"/>
          	<input type="text" value="미정" name="dv_option" id="dv_option"/>
			<input type="text" value="${user.main_address1 }" name="dv_address1" id="dv_address1"/>
			<input type="text" value="${user.main_address2 }" name="dv_address2" id="dv_address2"/>
			<input type="text" value="${user.main_address3 }" name="dv_address3" id="dv_address3"/>
			<input type="text" value="${user.main_address4 }" name="dv_address4" id="dv_address4"/>
			<input type="text" value="${user.user_phone }" name="dv_phone" id="dv_phone"/>
			<input type="text" value="미정" name="dv_message" id="dv_message"/>
			<input type="text" value="미정" name="pd_id" id="pd_id"/>
			<input type="text" value="미정" name="pd_size" id="pd_size"/>
			<input type="text" value="미정" name="pd_quantity" id="pd_quantity"/>
			<input type="text" value="미정" name="price_sum" id="price_sum"/>
          </form>
          </div>
          
        </div>
        <div class="col-md-5">
        <div class="sidebar info">
         	<h4>고객님의 주문</h4>         	
         	<div>
         		<table class="orderTotal">
         			<tr>
         				<th>주문 가격</th>
         				<td><span>20000</span></td>
         			</tr>
         			<tr>
         				<th>배송</th>
         				<td><span>20000</span></td>
         			</tr>
         			<tr>
         				<th>합계</th>
         				<td><span class="total_price">100</span></td>
         			</tr>
         		</table>
         	</div>
	       	<p>
			  <button class="orderDetail" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			    주문 세부 정보 보기
			  </button>
			</p>
			<div class="collapse" id="collapseExample">
			  <div class="card card-body">
		    	<!-- <div class="orderProductList"> -->
		    	<c:forEach items="${cart_list }" var="cList">
			    	<div class="cart-item ${cList.cart_id}">
	          			<c:forTokens items="${cList.pd_img }" var="img" delims="," varStatus="status">
	          				<c:if test="${status.last == true }">
		          				<div class="cart-img-box">
		          					<a class="cart-img-link" href="/productpage/${cList.pd_id }"><img class="cart-img" alt="" src="/images/${img}"></a>          				
		          				</div>
	          				</c:if>
	          			</c:forTokens>
				 		<div class="orderProduct">
	          				<input type="hidden" value="${cList.cart_id }" name="cart_id" class="cart_id"/>
		          			<span class="pd_id">상품명: ${cList.pd_name }</span><br/>
		          			<span class="pd_price">가격: ${cList.pd_price }</span><br/>
		       			    <span class="pd_id">상품 번호: ${cList.pd_id }</span>
						    <span class="pd_size">사이즈: ${cList.pd_size }</span><br/>
						    <span class="pd_color">컬러: ${cList.pd_color }</span>
						    <span class="total_price">합계:</span><br/>						    
	          			</div>
			    	</div>					                
          		</c:forEach>
			  </div>
			</div>        
        </div>
        </div>
      </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script>
        function DaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("address-name").value = extraAddr;
                    
                    } else {
                        document.getElementById("address-name").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address-dong").focus();
                }
            }).open();
        }
    </script>
    
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp64616262'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '옷가게 테스트 결제',
            amount : $(".total_price").text(),
            buyer_email : ${user.user_email},
            buyer_name : ${user.user_name},
            buyer_tel : ${user.user_phone},
            buyer_addr : ${user.main_address2}+${user.main_address3}+${user.main_address4},
            buyer_postcode : ${user.main_address1},
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/checkout", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                        user_email : ${user.user_email},
                        user_name : ${user.user_name},
                        user_phone : ${user.user_phone},
                        
                        
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='/compliteCheckout;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/order/payFail";
                alert(msg);
            }
        });
        
    });
    </script>
    
    <script>
      function editUserInfo(obj){
    	  $(obj).hide();
          $('.user-readonly').hide();
          $('.user-info').css("backgroundColor","#FAF9F8");
          $('.user-order-form').show();
      };

      function editAddressInfo(obj){
    	  $(obj).hide();
          $('.address-readonly').hide();
          $('.address-info').css("backgroundColor","#FAF9F8");
          $('.address-order-form').show();
      };

      function editPaymentInfo(obj){
    	  $(obj).hide();
          $('.payment-readonly').hide();
          $('.payment-info').css("backgroundColor","#FAF9F8");
          $('.payment-order-form').show();
      };
      
      function editUserInfoBtn(){
		var userForm = $(".user-order-form").serialize();
   	  
   		$.ajax({
			url:"updateOrderUserInfo",
			type:"POST",
			data: userForm,
			success:function(data){
				console.log("성공");
			}
		});
	  };
	  
	  function editAddressInfoBtn(obj){
		var addreeFormArray = $(".address-order-form").serializeArray(),
	    	addressFormdataObj = {};
		
		for (i=0; i<addreeFormArray.length; i++) {
			$("#"+addreeFormArray[i].name).val(addreeFormArray[i].value);
		}
		
  	    $(obj).hide();
        $('.address-readonly').show();
        $('.address-info-btn').show();        
        $('.address-info').css("backgroundColor","white");
        $('.address-order-form').hide();
	  };	  
    </script>
  </body>
</html>