<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% session.setAttribute("email", "test"); %> --%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">	
	
	<!-- slick -->
    <title>메인</title>

    <style>        
        .header-wrap{
          max-width: 100%;
          background-color: #FAF9F8;
          padding: 0;          
        }
        .header_global{
          padding-top: 34px;
          position: relative;
          left: 0;
          top: 0;
        }
        .menu{
          position: relative;
          min-height: 151px;
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
        .header-wrap .dropdown:hover > .dropdown-menu {
            display: block;
        }
        .header-wrap .dropdown > .dropdown-toggle:active {            
            pointer-events: none;
        }
        .navbar{
          background-color: #FAF9F8;
          padding: 25px 0 0 0;          
        }
        .header-wrap .nav-link:hover{
          text-decoration: underline;
        }
        .navbar-light .navbar-nav .nav-link {
            color: rgb(0, 0, 0);
        }
        .header-wrap .nav-item > .dropdown-menu{
          width: 100%;
          text-align: center;
          padding-top:38px;
          border: 0;
          background-color: #FAF9F8;
        }
        .header-wrap .dropdown-item,.nav-link{
          font-weight: bold;
        }
        .header-wrap .dropdown-toggle::after {
            display:none;
        }
        .searchbox{
          position: absolute;
          right: 45px;
          bottom: 10px;
        }
        .searchbar{
          padding: 10px 20px 8px 30px;
          border-top: 0;
          border-left: 0;
          border-right: 0;
          border-bottom: 1px solid black;
          border-radius: 0;
          background-color: #FAF9F8;
          font-size: small;
          font-weight: bold;          
        }
        .searchbar:focus{
          box-shadow: none;
          background-color: unset;
          border: none;
          border-bottom: 1px solid black;
        }
        .searchbtn{
          display: block;
          left: -3px;
          padding: 0;
          position: absolute;
          top: 3px;
          border: 0;
          background-color: unset;
        }
        .searchbtn:before{          
          background-image: url("/icons/icon_search.png");
          background-position: center center;
          background-repeat: no-repeat;
          background-size: 24px;
          content: '';
          display: block;
          height: 30px;
          width: 30px;
        }
        .menu_service{
          display: inline-block;
          letter-spacing: -4px;
          position: absolute;
          text-align: left;
          top: -20px;
          left: 28px;
          visibility: visible;          
        }
        .menu_service > a{
          color: black;
          text-decoration: none;
          letter-spacing:normal;
          font-weight: bold;
          font-size: small;
        }
        .menu_login_cart{
          position: absolute;
          right: 30px;
          top: -20px;
        }
        .btn-group > a{
          width: auto;
          font-size: small;
          font-weight: bold;
        }
        .btn-group > .cart:before{
          width: 20px;
          height: 20px;
          background-image: url("/icons/icon_bag.png");
          background-size: 24px;
          content: '';
          display: block;
          float: left;
          background-size: contain;
          background-position: center center;
          background-repeat: no-repeat;
          margin: 0 5px;
        }
        .btn-group > .login:before{
          width: 20px;
          height: 20px;
          background-image: url("/icons/icon_user.png");
          background-size: 24px;
          content: '';
          display: block;
          float: left;
          background-size: contain;
          background-position: center center;
          background-repeat: no-repeat;
          margin: 0 5px;
        }
        .header-wrap .nav-item:hover > .dropdown-menu{
          display:block;
        }
        .header-wrap .btn-group:hover > .dropdown-menu{
          display: block;
        }
    </style>
  </head>
  <body>
    <div class="container header-wrap">
      <header class="header_global">
          <div class="menu">
              <!-- 로고 -->
              <a class="header_logo" href="/"></a>
              <!-- 로그인 / 장바구니 -->
              <div class="menu_login_cart">
                <div class="btn-group">
                  <a type="button" class="btn dropdown-toggle login" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    로그인
                  </a>
                  <div class="dropdown-menu dropdown-menu-right">
                    <form class="px-4 py-3">
                      <div class="form-group">
                        <label for="exampleDropdownFormEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                      </div>
                      <div class="form-group">
                        <label for="exampleDropdownFormPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                      </div>
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" class="form-check-input" id="dropdownCheck">
                          <label class="form-check-label" for="dropdownCheck">
                            Remember me
                          </label>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary">Sign in</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">New around here? Sign up</a>
                    <a class="dropdown-item" href="#">Forgot password?</a>
                  </div>
  
                  <a type="button" class="btn cart" href="/cart">
                    장바구니
                  </a>
                  <div class="dropdown-menu dropdown-menu-right">
                    <form class="px-4 py-3">
                      <div class="form-group">
                        <label for="exampleDropdownFormEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                      </div>
                      <div class="form-group">
                        <label for="exampleDropdownFormPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                      </div>
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" class="form-check-input" id="dropdownCheck">
                          <label class="form-check-label" for="dropdownCheck">
                            Remember me
                          </label>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary">Sign in</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">New around here? Sign up</a>
                    <a class="dropdown-item" href="#">Forgot password?</a>
                  </div>
                </div>
              </div>
              <!-- 고객센터 -->
              <div class="menu_service">
                <a href="">고객 서비스</a>
              </div>
              <!-- 네비게이션 바 -->
              <nav class="navbar navbar-expand-lg navbar-light bg-light">                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto mr-auto">                    
                    <li class="nav-item">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        여성
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/men/">셔츠&블라우스</a>
                        <a class="dropdown-item" href="#">드레스</a>                        
                        <a class="dropdown-item" href="#">탑&티셔츠</a>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        남성
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/productList/200/202">티셔츠&탱크탑</a>
                        <a class="dropdown-item" href="#">후디&스웨트셔츠</a>
                        <a class="dropdown-item" href="#">셔츠</a>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        유아동
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">신생아</a>
                        <a class="dropdown-item" href="#">여아</a>
                        <a class="dropdown-item" href="#">남아</a>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">지속가능성</a>
                    </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0 searchbox">
                    <input class="form-control searchbar" type="search" placeholder="제품 검색" aria-label="Search">
                    <button class="searchbtn" type="submit"></button>
                  </form>
                </div>
              </nav>
          </div>  
      </header>
    </div>    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<!-- 카트 버튼 -->
	<script type="text/javascript">
		$(.cart).click(function(e){
	
	        e.target
	
		})
	</script>
  </body>
</html>