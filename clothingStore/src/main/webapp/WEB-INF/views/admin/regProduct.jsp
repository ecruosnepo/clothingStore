<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>

</head>
<body>
<form action="/regProduct" method="post" enctype="multipart/form-data">
	상품명 <input type="text" name="pd_name"/><br/>
	가격 <input type="number" name="pd_price"/><br/>
	색상 <input type="text" name="pd_color"/><br/>
	설명 <input type="text" name="pd_desc"/><br/>
	
	메인 카테고리
	<select class="category1">
		<option value="">전체</option>
	</select>
	<br/>
	
	서브 카테고리
	<select class="category2" name="cat_id">
		<option value="" >전체</option>		
	</select>
	<br/>
	
	할인율 <input type="number" name="discount" value="NULL"/><br/>
	이미지 <input multiple="multiple" type="file" name="img"/><br/>
	
	<input type="submit" value="등록">
</form>

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