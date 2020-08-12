<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>    
    <style>
        .list-wrap {
            display : grid;
            grid-template-areas: 
            "aside description"
            "aside article"
            "aside article";
            grid-template-rows: 10% 70% 20%;
            grid-template-columns: 200px 1fr;
            grid-gap: 10px;            
            margin: 0;
            background-color: #FAF9F8;            
        }
        a{            
            text-decoration: none;
            color: black;
        }
        a:hover{ 
            color: #d6001c;             
        }        
        #catDesc{
            grid-area: description;
            width:760px;            
            padding: 0;
            overflow: hidden;
        }
        #catDesc h1{
        	margin-bottom:10px;
        	font-weight:600;
        }
        #catDesc p{
        	margin:10px 0;
        	font-size:13px;
        	font-weight:bold;
        }
        
        .dropdown-title{
        	font-size:14px;
        }
        li{
            list-style: none;
        }
        #filter{
        	padding-bottom:18px;
        }
        #filterList > li{
            display: inline;
        }
        .sticky-top{
            background-color: #FAF9F8;
        }
        
        #productsList{
            grid-area: article;
            padding: 0;           
            padding-right: 32px;
        }
        .row-cols-4>*{
        	flex:0 0 calc(25% - 4px);
        }
        .row-cols-3>*{
        	flex:0 0 calc(33.333333% - 4px);
        }
        #products{
        	grid-column-gap: 4px;
        }
        #products > *{
            padding: 0;
        }
        .container{
            margin:0;
            max-width: 100%;
        }
        .productInfo{
        	height:auto;
        	margin-bottom:20px;
        }
        .productImg > img{
            width: 100%;
        }
        .pd_info{        	
        	magin-top:10px !important;
        }
        .pd_name, .pd_price{
        	margin-bottom:0;
        	font-weight:bold;
        	font-size:13px;
        }        
        #sideNav{
            grid-area: aside;
            padding: 10px;
        }
        .cat-list-box, .cat-list-box > *{
        	background-color: #FAF9F8;
        }
        .card-header{
            padding: 0;
            background-color: unset;
            border:unset;
        }
        .card-body{
            padding: 0 15px;
        }
        .main-cat, .sub-cat{
        	font-weight:bold;        	
            color: black;
            padding: 0;
        }
        .sub-cat-box{
        	padding:5px 0;
        }
        .sub-cat{
        	font-size:13px;
        	font-weight:600;
        }
        .main-cat:hover, .sub-cat:hover{
            color:#d6001c;
        }
        .cat-box{
            border: unset;
        }
        .pl-dropdown-menu{
			padding:0;        
        }
        .pl-dropdown-menu > .form-check{
            padding: 10px 40px;
        }
        .nav-pills .show > .nav-link {
            color: #d6001c;
            background-color: unset;
        }        
        .main-cat{
            padding-bottom: 0;
        }
        .main-cat:focus{
        	color: #d6001c;
        	box-shadow:none;
        	text-decoration:none;
        }

    </style>
</head>
<body>
	<div class="container list-wrap">
	    <!-- 사이드 네비게이션 바 -->
	    <aside id="sideNav">
	      <div class="accordion cat-list-box" id="accordionExample">
            <a class="btn btn-link btn-block text-left collapsed main-cat" href="" type="button" data-toggle="collapse" data-target="" aria-expanded="false" aria-controls="">
              모두보기
            </a>        
	        <div class="card cat-box">
	          <div class="card-header" id="headingOne">
	            <h2 class="mb-0">
	              <a class="btn btn-link btn-block text-left collapsed main-cat" href="" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
	                티셔츠&탱크탑
	              </a>
	            </h2>
	          </div>	      
	          <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
	            <div class="card-body">
	              <ul class="nav flex-column sub-cat-box">
	                <li class="nav-item">
	                  <a class="nav-link active sub-cat" href="#">Active</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link sub-cat" href="#">Link</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link sub-cat" href="#">Link</a>
	                </li>
	              </ul>
	            </div>
	          </div>
	        </div>
	        <div class="card cat-box">
	          <div class="card-header" id="headingTwo">
	            <h2 class="mb-0">
	              <a class="btn btn-link btn-block text-left collapsed main-cat" href="" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	                후디&스웨터셔츠
	              </a>
	            </h2>
	          </div>
	          <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
	            <div class="card-body">
	              <ul class="nav flex-column sub-cat-box">
	                <li class="nav-item">
	                  <a class="nav-link active sub-cat" href="#">Active</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link sub-cat" href="#">Link</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link sub-cat" href="#">Link</a>
	                </li>
	              </ul>
	            </div>
	          </div>
	        </div>
	        <div class="card cat-box">
	          <div class="card-header" id="headingThree">
	            <h2 class="mb-0">
	              <a class="btn btn-link btn-block text-left collapsed main-cat" href="" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	                베이직
	              </a>
	            </h2>
	          </div>
	          <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
	            <div class="card-body">
	              <ul class="nav flex-column sub-cat-box">
	                <li class="nav-item">
	                  <a class="nav-link active sub-cat" href="#">Active</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link sub-cat" href="#">Link</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link sub-cat" href="#">Link</a>
	                </li>
	              </ul>
	            </div>
	          </div>
	        </div>
	      </div>
	    </aside>
	
	    <!-- 상품 목록 -->
	    <div id="catDesc">
	        <div>
	            <h1>남성 티셔츠 & 베스트</h1>
	            <p>H&M 온라인에서 남성 티셔츠와 베스트를 만나보세요. 여러분의 개성을 드러낼 수 있는 트렌디한 모티프와 패턴의 프린트 티셔츠로 일상 룩을 업그레이드해 보세요. 레귤러 핏과 슬림 핏의 다양한 클래식 컬러 코튼 티셔츠와 베스트로 기본 아이템을 준비하세요. 헬스클럽에 가는 길이신가요? H&M 스포츠 베스트의 쇼트 & 롱 슬리브 스타일로 완벽한 운동복을 준비해보세요.</p>
	        </div>
	    </div>    
	    <article id="productsList">
	        <div id="filter" class="sticky-top">
	            <ul class="nav nav-pills">
	                <li class="nav-item dropdown dropdown-title">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="padding-left:0;">정렬 기준</a>
	                    <div class="dropdown-menu pl-dropdown-menu">
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="sortbyprice" id="sortbyprice" value="new" checked>
	                            <label class="form-check-label" for="sortbyprice">
	                                최신
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="sortbyprice" id="sortbyprice" value="low_price">
	                            <label class="form-check-label" for="sortbyprice">
	                                최저가
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="sortbyprice" id="sortbyprice" value="high_price">
	                            <label class="form-check-label" for="sortbyprice">
	                                최고가
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item dropdown dropdown-title">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사이즈</a>
	                    <div class="dropdown-menu pl-dropdown-menu">
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="sizeview" id="sizeview" value="S">
	                            <label class="form-check-label" for="sizeview">
	                                S
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="sizeview" id="sizeview" value="M">
	                            <label class="form-check-label" for="sizeview">
	                                M
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="sizeview" id="sizeview" value="L">
	                            <label class="form-check-label" for="sizeview">
	                                L
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item dropdown dropdown-title">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">컬러</a>
	                    <div class="dropdown-menu pl-dropdown-menu">
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                빨강
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                노랑
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                초록
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item ml-auto">
	                    <button class="btn bigbtn">크게</button> 
	                    <button class="btn smallbtn">작게</button>
	                </li>
	            </ul>
	        </div>
	        <div class="product-container">
	            <div id="products" class="row row-cols-4 mx-0">            
	        	<c:forEach items="${pd_list }" var="pd_dto">
	                <div class="productInfo col">
	                    <a class="productImg" href="/productpage/${pd_dto.pd_id }">
	                    <c:forTokens items="${pd_dto.pd_img }" var="img" delims="," varStatus="status">
		                    <c:if test="${status.last == true}">
		                        <img src="/images/${img}" alt="">		                        
		                    </c:if>
	                    </c:forTokens>              
	                    </a>
	                    <div class="pd_info" style="margin-top:20px;">
	                        <p class="pd_name"><a href="/productpage/${pd_dto.pd_id }">${pd_dto.pd_name }</a></p>
	                        <p class="pd_price">&#8361; <fmt:formatNumber value="${pd_dto.pd_price }"/></p>
	                    </div>
	                </div>        		
	        	</c:forEach>      
	            </div>
	        </div>
	    </article>
	
	    <!-- 페이지 확장 버튼 -->
	</div>
	
    <script>
        $(".bigbtn").click(function(){
            $('#products').removeClass('row-cols-4').addClass('row-cols-3');
        });
        $(".smallbtn").click(function(){
            $('#products').removeClass('row-cols-3').addClass('row-cols-4');
        });
        $(".main-cat").collapse({
            hide:true
        });        
    </script>
    <script>
    	$(function(){
    		$("input:radio").change(function(){
    			var sortby = $("input:radio[name='sortbyprice']:checked").val();
    			var size = $("input:radio[name='sizeview']:checked").val();
    			var cate = ${cat_id};
    			
    			$.ajax({
                    url: "/productList/"+cate,
                    type: 'GET',                    
                    data: {
                    	size : size,
                    	sortby : sortby                 
                    },
                    success:function(pd_list){
                    	var result = $(pd_list).find('.product-container');
                    	$('.product-container').html(result);
        			}
                });
    		});    		
    	});
    </script>
</body>
</html>