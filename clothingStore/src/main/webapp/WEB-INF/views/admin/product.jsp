<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<jsp:include page="../header.jsp" flush="false" />
 <style>
 	body{
 	background-color: #FAF9F8;
 	}
     .firstCenter{
         text-align: center;
     }
     .box{    
        background-color: whitesmoke;
        padding:5%; 
     }
     .size{
       font-size: 24px;
       text-align: center;
     }
     .head{
       font-size: 12px;
     }
     section{
       margin-left: 30%;
     }
     #cencle{
     background-color: white;
     border: 1px solid black;
     }
</style>
</head>
  <body>
<jsp:include page="sideNav.jsp" flush="false" />

    <section>
  <div class="container"> 
      <div class="row">
      <div class="col-md-12">
	        <div class="center-block" style="width: 50%">
	          <div class="firstCenter">
	            <label class="head"><a href=#  style="color: black; ">관리자 페이지</a>/<a href="/mgProduct"  style="color: black; ">상품 등록</a></label>
	        <br/>
	        <br/>
	        <label style="font-size: 26px;">상품 등록</label> 
	        <br/>
	       </div>    
	        <div class="box">
	         <label class="size">새 상품 등록하기</label>
	         <br/><br/><br/>
	         <div class="form-group has-success">
	         <form action=#  method="post" enctype="multipart/form-data">
	            <label class="control-label" for="inputSuccess1" style="color: black;">상품명</label>
	            <input type="text" class="form-control" id="inputSuccess1">
	            <br/>
	            <label class="control-label" for="inputSuccess1" style="color: black; ">가격</label>
	            <input type="text" class="form-control" id="inputSuccess1">
	            <br/>
	            <label class="control-label" for="inputSuccess1" style="color: black; ">색상</label>
	            <input type="text" class="form-control" id="inputSuccess1">
	            <br/>
	            <label class="control-label" for="inputSuccess1" style="color: black; ">설명</label>
	            <textarea class="form-control" name="question" id="inputSuccess1" rows="10" placeholder="상품 설명"></textarea>
	            <br/>
	            <label>메인 카테고리</label> 
	            <br/>
	            <select class="form-control">
	                <option value="">메인 카테고리</option>
	            </select>
	            <br/>
	            <label>서브 카테고리</label> 
	            <br/>
	            <select class="form-control">
	                <option value="">서브 카테고리</option>
	            </select>
	            <br/>
	            <label class="control-label" for="inputSuccess1" style="color: black; ">할인율</label>
	            <input type="number" class="form-control" id="inputSuccess1">
	            <br/>
	            <label class="control-label" for="inputSuccess1">이미지</label><br/>
	            <input type="file" id="inputSuccess1">
	            <br/>
	            <br/>
	            <input type="submit" class="btn btn-lg btn-block" style="color: white; background-color: black;">
	            <button id="cencle" type="button" class="btn btn-default btn-lg btn-block" >취소</button>
	       	</form>
	       </div>
	      </div>
	    </div>      
      </div>
  </div>
  </div>
  </section>
</body>
</html>
<jsp:include page="../footer.jsp" flush="false" />