<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush ="true"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            grid-template-rows: 20% 70% 20%;
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
        li{
            list-style: none;
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
        #products > *{
            padding: 0;
        }
        .container{
            margin:0;
            max-width: 100%;
        }
        .productImg > img{
            width: 100%;
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
            padding: 0 20px;
        }
        .main-cat, .sub-cat{
            color: black;
            padding: 0;
        }
        .main-cat:hover, .sub-cat:hover{
            color:#d6001c;
        }
        .cat-box{
            border: unset;
        }
        #catDesc{
            grid-area: description;
            height: 150px;
            padding: 0;
            overflow: hidden;
        }
        .dropdown-menu > .form-check{
            padding: 10px 40px;
        }
        .nav-pills .show > .nav-link {
            color: #d6001c;
            background-color: unset;
        }
        .btn{
            padding:12px 6px;
            border: unset;
        }
        .btn:focus{
            box-shadow: unset;
            color: #d6001c;
        }
        .main-cat{
            padding-bottom: 0;
        }

    </style>
</head>
<body>
	<div class="container list-wrap">
	    <!-- 사이드 네비게이션 바 -->
	    <aside id="sideNav">
	      <div class="accordion cat-list-box" id="accordionExample">
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
	              <ul class="nav flex-column">
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
	              <ul class="nav flex-column">
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
	              <ul class="nav flex-column">
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
	            <h1>Category Description</h1>
	            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque omnis tempora deleniti, quis, eius vero illo quae earum dolorum aliquid minus unde et enim, cum impedit animi maxime ratione minima.</p>
	        </div>
	    </div>    
	    <article id="productsList">
	        <div id="filter" class="sticky-top">
	            <ul class="nav nav-pills">
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">정렬 기준</a>
	                    <div class="dropdown-menu">
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                최신
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                최저가
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                최고가
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사이즈</a>
	                    <div class="dropdown-menu">
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                S
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                M
	                            </label>
	                        </div>
	                        <div class="form-check dropdown-item">
	                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
	                            <label class="form-check-label" for="exampleRadios3">
	                                L
	                            </label>
	                        </div>
	                    </div>
	                </li>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">컬러</a>
	                    <div class="dropdown-menu">
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
	            <div id="products" class="row row-cols-4">            
	        	<c:forEach items="${pd_list }" var="pd_dto">
	                <div class="productInfo col">
	                    <a class="productImg" href="/productpage/${pd_dto.pd_id }">
	                    <c:forTokens items="${pd_dto.pd_img }" var="img" delims="," varStatus="status">
		                    <c:if test="${status.last == true}">
		                        <img src="/images/${img}" alt="">
		                    </c:if>
	                    </c:forTokens>              
	                    </a>
	                    <div>
	                        <p><a href="/productpage/${pd_dto.pd_id }">${pd_dto.pd_name }</a></p>
	                        <p>&#8361; ${pd_dto.pd_price }</p>
	                    </div>
	                </div>        		
	        	</c:forEach>
		        	<!-- <div class="productInfo col">
	                    <a class="productImg" href="/productpage">
	                        <img src="/images/202007205_1207236_2.jpg" alt="">
	                    </a>
	                    <div>
	                        <p><a href="/productpage">후드</a></p>
	                        <p>20000</p>
	                    </div>
		            </div>  -->         
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
</body>
</html>