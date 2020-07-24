<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        .container{
            margin: 0;            
            height: auto;
            padding: 32px;
            max-width: none;
            width: 100%;
        }
        div{
            border: 1px solid black;            
        }
        .row{
            margin: 0;
        }
        /* 상품 이미지 */
        .img-group{
            padding: 0px;
            height: 100%;
        }
        .pd-top{
            height: 77%;            
        }
        .img1, .img2{
            margin: 0;
            height: 40%;
            justify-content: center;       
        }
        .pd-img{
            width: calc(50% - 2px);
        }

        /* 옵션 선택 */
        .pd-option{
            padding: 0 28px 60px 60px;
            position: relative;
        }
        .color-select{
            margin: 30px 0;
        }
        input[type="radio"] {            
            display:none;
        }
        .form-check-label{
            cursor: pointer;    
        }
        .form-check input:checked +.form-check-label{
            border: 1px solid red;
        }
        .color-carousel-item{
            text-align: center;
        }
        .color-img{
            width: 60px;
        }
        .size-list{
            margin-bottom: 30px;
        }
        .add-cart{
            width: 100%;
            height: 45px; 
        }
        

        .pd-desc{
            margin: 0;
            height:20%;
        }

        /* 상품 정보 푸터 */
        .pd-footer{
            height: 3%;            
            position: sticky;
            bottom: 0;
            background-color: white;
        }
        .footer1-box{
            max-width: calc(100vw - 505px);
            width: calc(66vw - 2 * 40px);
            padding: 0 40px;
            margin: auto 0;
        }
        .footer1-nav a{            
            color: black;
            
        }
        .footer1-nav a:hover{
            text-decoration: none;                  
        }
        .footer1-nav{            
            justify-content: center;
            align-items: center;            
        }
        .pd-recommand{
            height: 20% ;
        }

        /* 사이드 푸터 내용 */        
        .sidepanel  {
        width: 0;
        position: fixed;
        z-index: 1100;
        height: 100%;
        top: 0;
        right: 0;
        background-color: #111;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
        }

        .sidepanel span {
        padding: 8px 32px 8px 32px;
        text-decoration: none;
        font-size: 17px;
        color: #818181;
        display: block;
        transition: 0.3s;
        }

        .sidepanel a, .sidepanel a:hover {
            text-decoration: none;
            color: #f1f1f1;
        }

        .sidepanel .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        }

        /* 추천 */
        .recommand-box{
            margin: 0 auto;
        }
        .recommand-item{
            width: 296px;
            height: 506px;
        }
        .carousel-control-prev {
            margin-left: -100px;
            background-color: black;
        }

        .carousel-control-next {
            margin-right: -100px;
            background-color: black;
        }
    </style>
  </head>
  <body>
    <div class="container pd-page-wrap">
        <!-- 상품 설명 -->
        <div class="row pd-top">
            <div class="col-md-8 img-group">
                <!-- 상품 설명 사진1 -->
                <div class="row img1">
                	<c:forTokens items="${pd_dto.pd_img }" var="img" delims="," end="0">
                        <img src="/images/${img}" alt="">
                    </c:forTokens>
                    <!-- <img class="pd-img main-img" src="./hmgoepprod1.jpg" alt=""> -->
                </div>
                <!-- 상품 설명 글 -->
                <div class="row pd-desc">

                </div>
                <!-- 상품 설명 사진1 -->
                <div class="row img2">

                </div>
            </div>
            <!-- 상품 옵션 -->
            <div class="col-md-4 pd-option">
                <div class="option-box sticky-top">
                    <form action="">
                        <h1>상품명</h1>
                        <h1>가격</h1>
                        <div class="color-select">
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                  <div class="carousel-item active color-carousel-item">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1"><img src="./color-1.png" class="color-img" alt="..."></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2"><img src="./color-1.png" class="color-img" alt="..."></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                        <label class="form-check-label" for="inlineRadio3"><img src="./color-1.png" class="color-img" alt="..."></label>
                                    </div>
                                  </div>
                                  <div class="carousel-item color-carousel-item">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1"><img src="./color-1.png" class="color-img" alt="..."></label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                        <label class="form-check-label" for="inlineRadio2"><img src="./color-1.png" class="color-img" alt="..."></label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                        <label class="form-check-label" for="inlineRadio3"><img src="./color-1.png" class="color-img" alt="..."></label>
                                    </div>                              
                                  </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="pd-select-buttons">
                            <select class="form-control form-control-lg size-list">
                                <option>S</option>
                                <option>M</option>
                                <option>L</option>                                
                            </select>
                            <button class="add-cart" type="submit">
                                <span>담기</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- 상품 설명 footer -->
        <div class="row pd-footer">
            <div class="col-xs-6 footer1-box">
                <ul class="nav footer1-nav">
                    <li class="nav-item">
                      <a class="nav-link sidebarCollapse" href="#" onclick="openNav()">세부 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link sidebarCollapse" href="#" onclick="openNav()">배송 및 결제</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link sidebarCollapse" href="#" onclick="openNav()">제품 배경</a>
                    </li>                    
                </ul>                
            </div>
            <div class="col-xs-6 footer2-box"></div>
        </div>
        <!-- 상품 추천 -->
        <div class="row pd-recommand">
            <div class="col-xs-12 recommand-box">
                <div id="carousel-recommand" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                        <img class="recommand-item" src="http://placehold.it/296x506" class="" alt="...">
                      </div>                      
                    </div>
                    <a class="carousel-control-prev" href="#carousel-recommand" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-recommand" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

        <div id="mySidepanel" class="sidepanel">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
            <span>
                H&M의 모든 제품은 독립된 공급업체에서 제작되며, 경우에 따라 우리의 존재가 진정한 차이를 만들 수 있는 개발 도상국에서 만들어지기도 합니다. H&M의 사업은 특히 여성들을 위한 일자리 창출과 독립을 지원하며, 결과적으로 그들이 경제적 어려움을 이겨내도록 돕고 경제 성장에 이바지합니다. 또한 H&M은 사람과 환경을 중시하는 우리의 이념을 공유하고 관행 개선을 위해 노력할 의사가 있는 업체와만 협력합니다. 모든 공급업체와 공장은 모든 근로자를 위한 공정한 임금과 좋은 노동 환경에 대한 요구 사항이 포함된 엄격한 지속가능성 약속에 서명해야 합니다. 우리는 전세계 생산 사무실에 헌신적이고 지속가능한 인력을 고용하도록 최선의 노력을 기울이고 있습니다.
패션 리사이클러가 되세요!
여러분도 환경 보호를 돕고 더욱 지속 가능한 패션을 만들 수 있습니다. 불필요한 옷이나 가정용 직물을 H&M 매장에 가지고 오면 다시 입을 수 있는 옷을 만드는 데 사용되거나 재사용 또는 재활용됩니다.
            </span>
        </div>       
        
        <div class="overlay"></div>
    </div>
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <script>
        $('#exampleModal').appendTo("body") 
    </script>
    <script>
        // 사이드 푸터 내용
        function openNav() {
            document.getElementById("mySidepanel").style.width = "450px";
        }

        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }

        $('.carousel').carousel({
          interval: false
        })
    </script>
  </body>
</html>