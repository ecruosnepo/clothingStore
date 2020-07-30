<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.setAttribute("email", "123@123"); %>
<!Doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Hello, world!</title>
    <style>
        .container{
          height: 100vh;
        }
        p{
          margin:0;
        }
        .info, .sidebar{
          border: 1px solid black;            
          width: 100%;
          padding: 0;
          margin: 0;
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

        .payment-list{
          text-align: center;
        }

        .address-box{
          width: 100%;
        }
    </style>
  </head>
  <body>
    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
    <div class="container">
      <div class="row">
        <div class="col-md-8 info-group">
          <div class="row user-info info">
            <header>
              <h4>내 정보</h4>
            </header>
            <div class="readonly">
              <p>이메일</p>
              <p>test@test.com</p>
            </div>
            <form class="user-order-form" action="/updateOrderUserInfo" method="post">
              <input name="user_email" type="hidden" value="<%=session.getAttribute("email")%>"/>
              <div class="form-row">
                <div class="col-md-12 mb-3">
                  <label for="validationDefault01">이름</label>
                  <input name="user_name" type="text" class="form-control" id="validationDefault01" value="" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-3 mb-3">
                  <label for="validationDefault03">우편번호</label>
                  <input name="main_address1" type="text" class="form-control" id="postcode" required>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-12 mb-3">
                  <label for="validationDefault03">주소</label>
                  <input name="main_address2" type="text" class="form-control" id="address" required>
                </div>                
              </div>
              <div class="form-row">
                <div class="col-md-6 mb-3">
                  <label for="validationDefault03">아파트 명/건물 명</label>
                  <input name="main_address3" type="text" class="form-control" id="address-name" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="validationDefault03">동 호수/층수</label>
                  <input name="main_address4"  type="text" class="form-control" id="address-dong" required>
                </div>                
              </div>
              <div class="form-row">                
                <div class="col-md-12 mb-3">
                  <label for="validationDefault03">전화번호</label>
                  <input name="user_phone"  type="text" class="form-control" id="address-dong" required>
                </div>                
              </div>
              <input type="button" class="btn" onclick="DaumPostcode()" value="주소 검색" />
              <button class="btn" type="submit">배송 단계로 넘어가기</button>
            </form>
            <button class="user-info-btn btn" click="">수정</button>
          </div>
          <div class="row address-info info">
            <h4>배송</h4>
            <div class="readonly">

            </div>
            <form class="address-order-form">

            </form>
            <button class="address-info-btn btn" value="수정" click="">
              수정
            </button>
          </div>
          <div class="row payment-info info">
            <h4>결제</h4>
            <div class="readonly">

            </div>
            <form class="payment-order-form">

            </form>
            <button class="payment-info-btn btn" value="수정" click="">
              수정
            </button>
          </div>
          <div class="row submit-btn">
  
          </div>
        </div>
        <div class="col-md-4 sidebar" style="height: 600px;">
          
        </div>
      </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        $('.user-info-btn').on("click",function(){
          $(this).hide();
          $('.readonly').hide();
          $('.user-order-form').show();
        })
      });
    </script>
  </body>
</html>