<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		         <form action="/regProduct"  method="post" enctype="multipart/form-data">
		            <label class="control-label" for="pd_name" style="color: black;">상품명</label>
		            <input type="text" name="pd_name" class="form-control" id="pd_name">
		            <br/>
		            <label class="control-label" for="pd_price" style="color: black; ">가격</label>
		            <input type="number" name="pd_price" class="form-control" id="pd_price">
		            <br/>
		            <label class="control-label" for="pd_color" style="color: black; ">색상</label>
		            <input type="text" name="pd_color" class="form-control" id="pd_color">
		            <br/>
		            <label class="control-label" for="pd_desc" style="color: black; ">설명</label>
		            <textarea name="pd_desc" class="form-control" id="pd_desc" rows="10" placeholder="상품 설명"></textarea>
		            <br/>
		            <label>메인 카테고리</label> 
		            <br/>
		            <select class="form-control category1">
		                <option value="">메인 카테고리</option>
		            </select>
		            <br/>
		            <label>서브 카테고리</label> 
		            <br/>
		            <select class="form-control category2" name="cat_id">
		                <option value="1">서브 카테고리</option>
		            </select>
		            <br/>
		            <label class="control-label" for="discount" style="color: black; ">할인율</label>
		            <input type="number" name="discount" class="form-control" id="discount">
		            <br/>
		            <label class="control-label" for="img">이미지</label><br/>
		            <input multiple="multiple" type="file" name="img" id="img">
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
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	// 컨트롤러에서 데이터 받기
	var jsonData = ${allcat};
	// 필요한 배열과 오브젝트 변수 생성
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].cat_id%10 == "0") {  // 레벨이 1인 데이터가 있다면 
			cate1Obj = new Object();  // 초기화
			
			// cate1Obj에 cat_id와 cat_name를 저장
			cate1Obj.cat_id = jsonData[i].cat_id; 
			cate1Obj.cat_name = jsonData[i].cat_name;
			
			// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
			cate1Arr.push(cate1Obj);
		}
	}
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	for(var i = 0; i < cate1Arr.length; i++) {
		// cate1Arr에 저장된 값을 cate1Select에 추가
		cate1Select.append("<option value='" + cate1Arr[i].cat_id + "'>"
							+ cate1Arr[i].cat_name + "</option>");	
	}
	// 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
	$(document).on("change", "select.category1", function(){
		
		// 필요한 배열과 오브젝트 변수를 생성
		var cate2Arr = new Array();
		var cate2Obj = new Object();
		
		// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
			
			if(jsonData[i].cat_id%10 != "0") {  // 레빌이 2인 데이터가 있다면
				cate2Obj = new Object();  // 초기화
				
				// cate2Obj에 cat_id, cat_name, cat_id_ref를 저장
				cate2Obj.cat_id = jsonData[i].cat_id;
				cate2Obj.cat_name = jsonData[i].cat_name;
				cate2Obj.cat_id_ref = jsonData[i].cat_id_ref;
				
				// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
				cate2Arr.push(cate2Obj);
			} 
		}
		
		var cate2Select = $("select.category2");
		
		/*
		for(var i = 0; i < cate2Arr.length; i++) {
				cate2Select.append("<option value='" + cate2Arr[i].cat_id + "'>"
									+ cate2Arr[i].cat_name + "</option>");
		}
		*/
		
		// cate2Select의 값을 제거함(초기화)
		cate2Select.children().remove();
	 
		// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
		$("option:selected", this).each(function(){
			
			var selectVal = $(this).val();  // 현재 선택한 cate1Select의 값을 저장
		
			cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
			
			// cate2Arr의 데이터를 cate2Select에 추가
			for(var i = 0; i < cate2Arr.length; i++) {
				
				// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
				if(selectVal == cate2Arr[i].cat_id_ref) {
					cate2Select.append("<option value='" + cate2Arr[i].cat_id + "'>"
										+ cate2Arr[i].cat_name + "</option>");
				}
			}		
		});		
	});
</script>
</body>
</html>
<jsp:include page="../footer.jsp" flush="false" />