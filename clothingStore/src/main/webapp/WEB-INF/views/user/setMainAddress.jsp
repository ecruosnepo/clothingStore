<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
<style>
	.setMainAddr-container{
		max-width:684px !important;
		font-weight:600 !important;		
	}	
	.sitemap{
  		margin-bottom:15px !important;
  		font-size:11px;
  		text-decoration:none;
  		font-weight:700 !important;
  	}
  	.sitemap a {
  		text-decoration:none !important;
  		margin:11px 0;  		
  	}
  	.setMainAddr-header {
  		font-weight:600;
  		text-align:center;
  		margin-bottom:40px;
  	}
  	.setMainAddr-header h1 {
  		font-size:27px;
  		font-weight:700;
  		line-height: 1.142857143;  		
  	}
	.setMainAddr-content{
	 	background-color:white;
	 	text-align: left;
	 	width:100%;
		margin-bottom:50px;	    
	}
    .box{
   	 	background-color:white;
      	text-align: left;
		padding: 0 24px !important;  
    }
    .box-title{
     	width:100%;
     	background-color:#F4E6E3;
     	margin-bottom:0;    
    }
    .box-title p{
   	 	font-size:13px;
   	 	padding:18px 24px;
    }
    .box-title a{
    	float:right;
    	font-size:13px;
    }
    .box *{
		font-weight:600 !important;
	}
	.box p{
		margin: 6px 0 7px !important;
	}
    .box-content{
		padding:24px;
    }
	.group_p{
	}  
    .firstCenter{
      	text-align: center;
    }
	.headName{
	  	font-size: 18px;
	}
    .headName{
   		color:#707070;
      	font-size: 12px;
   	}
   	.subName{
      font-size: 14px;
   	}
   	.input-text{
   		padding:14px 25px 14px 10px !important;
   	}
   	.btn-group{
   		padding-bottom:30px;
   	}
   	.default-btn {
    	background-color:#222 !important;
    	font-size:13px !important;
    	margin-right:25px;
    	padding:13px 16px !important;
    	font-weight:600 !important;
    }
    .btn-w {
    	background-color:white !important;
    	border:1px solid #222 !important;
    }
</style>
</head>
<body>
<jsp:include page="../header.jsp" flush="false" />
<div class="container setMainAddr-container"> 
	<div class="setMainAddr-header">
	    <p class="sitemap"><a href="#" style="color: black; ">HM.com</a>/<a href="MyPage.html" style="color: black; ">나의 계정</a>/<a href="newAddress.html"  style="color: black; ">주소록</a></p>
		<p style="font-size: 25px;">주소록</p>
	</div>
    <div class="row">
		<div class="setMainAddr-content">
   			<div class="box-title">
	    		<p>청구지 주소</p>    		
	    	</div>
			<div class="box" >
       			<form action="setMainAddressForm" method="post">
					<div class="form-group has-success">
						<button type="button" onclick="DaumPostcode();" class="btn btn-lg default-btn text-white rounded-0">주소 검색</button> 
						<div class="group_p">
							<p class="headName">우편번호</p>
							<input type="text" class="form-control rounded-0 input-text h-auto" id="postcode" name="main_address1"value="${address.main_address1}" onfocus="this.value='${address.main_address1}';">
							<p id="id_1"></p>
						</div>
						<div class="group_p">
						   	<p class="headName">주소</p>
						    <input type="text" class="form-control rounded-0 input-text h-auto" id="address" name="main_address2"value="${address.main_address2}" onfocus="this.value='${address.main_address2}';">
							<p id="id_2"></p>
						</div>
						<div class="group_p">
							<p class="headName">아파트 명/건물 명</p>
						 	<input type="text" class="form-control rounded-0 input-text h-auto" id="address-name" name="main_address3"value="${address.main_address3}" onfocus="this.value='${address.main_address3}';">
					   		<p id="id_3"></p>
						</div>
						<div class="group_p">
							<p class="headName">동 호수/층 수</p>
							<input type="text" class="form-control rounded-0 input-text h-auto" id="address-dong" name="main_address4" value="${address.main_address4}" onfocus="this.value='${address.main_address4}';">
					        <p id="id_4"></p> 
				        </div>
     				</div>
     				<div class="btn-group">
						<button type="submit" class="btn btn-lg rounded-0 default-btn btn-w" onclick="history.back();">취소</button>
						<button type="submit" class="btn btn-lg rounded-0 default-btn text-white">세부 정보 저장</button>
     				</div>
				</form>  	
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" flush="false" />
</body>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
</html>