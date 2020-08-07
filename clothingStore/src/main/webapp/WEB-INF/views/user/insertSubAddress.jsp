<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>옷가게</title>
    <style>
   .firstCenter{
    text-align: center;
   }
   .box{
    background-color:whitesmoke;
    text-align: left;
    padding: 5%;
    margin:5%;
    
   }
   .size{
     font-size: 24px;
     text-align: center;
   }
   .sub{
     font-size: 12px;
     color: red;
   }
   .head{
     font-size: 20px;
   }
  </style>
  </head>
<body>
<jsp:include page="../header.jsp" flush="false" />
  <div class="container"> 
    <div class="row">
      <div class="center-block" style="width: 55%; float:none; margin:0 auto">
	    <div class="firstCenter">  
			<p class="head"><a href="index"  style="color: black; ">HM.com</a>/<a href="MyPage"  style="color: black; ">나의 계정</a>/<a href="subAddress"  style="color: black; ">주소록</a></p>
			  <p style="font-size: 26px;">주소록</p>
			  </div>
			  <div class="box" >
			    <p class="size"><b>새 주소 추가</b></p>		     
			       <form action="insertSubAddressForm" method="post">
			         <div class="form-group has-success">
			        <p class="head">이름</p>
			          <input type="text" class="form-control" id="inputSuccess1" name="r_name">
			            <br/><br/>
		                <button type="button" onclick="DaumPostcode();" class="btn btn-info btn-lg">주소 검색</button>    
                    <p class="head">우편번호</p>
		             <input type="text" class="form-control" id="postcode" placeholder="우편번호" name="address1">
		            <p id="id_1"></p> 
		            <p class="head">주소</p>
		             <input type="text" class="form-control" id="address" placeholder="도로명 주소" name="address2">
		            <p id="id_2"></p>
		            <p class="head">아파트 명/건물 명</p>
		             <input type="text" class="form-control" id="address-name" placeholder="지번 주소" name="address3">
		            <p id="id_3"></p>
		            <p class="head">동 호수/층 수</p>
		             <input type="text" class="form-control" id="address-dong" placeholder="상세 주소"  name="address4">
		            <p id="id_4"></p>
                 </div>
               <button type="submit" class="btn btn-primary btn-lg" >세부 정보 저장</button> 
             </form>
            </div>  
          </div>
	    </div>
	  </div>
    <jsp:include page="../footer.jsp" flush="false" />
  </body>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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