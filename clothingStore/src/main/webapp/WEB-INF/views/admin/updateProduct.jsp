<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" flush="false" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	 body{
    	 background-color: #FAF9F8;
 	 }
 	 .addProduct-sideNav{
 	 	width:300px;	
 	 	position:absolute;
 	 	left:0; 	 	
 	 }
 	 .addProduct-row{
 	 	position:relative;
 	 	margin-bottom:50px !important;
 	 }
 	 .addProduct-content{
 	 	width: 70%;
 	 	margin:0 auto;
 	 }
     .firstCenter{
         text-align: center;
     }
     .box{
        background-color: white;
     }
     .form-header{
     	width:100%;
     	background-color:#F4E6E3;
     }
	.form-header p{
		font-size:15px;
		padding:16px 24px;
		font-weight:600;
		margin-bottom:0;
	}
     .form-content{
     	padding:30px;
     }
     .head{
       font-size: 12px;
     }
     #cencle{
	     background-color: white;
	     border: 1px solid black;
     }
     .input-size{
     	width:100% !important;
     }
     .input-size .text-size{
     	width:80%
     }
     .input-size-box{
     	padding:10px 3px;
     }
     input[type="number"]::-webkit-outer-spin-button,
	 input[type="number"]::-webkit-inner-spin-button {
	     -webkit-appearance: none;
	     -moz-appearance: none;
	     appearance: none;
	     margin: 0;
	 }
	 input[type=number] {
    	-moz-appearance: textfield;
	 }
	 .select_img{
	 	margin-top:15px;
	 }
</style>
</head>
<body>
<section class="addProduct-wrap">
  <div class="container-fluid addProduct-inner mx-0 px-0"> 
	  <div class="addProduct-sideNav">
		<jsp:include page="sideNav.jsp" flush="false" />
	  </div>
      <div class="row addProduct-row">
      	<div class="col-md-12">
      	<div class="addProduct-content">
       		<div class="center-block">
				<div class="firstCenter">
		            <label class="head"><a href=#  style="color: black; ">관리자 페이지</a>/<a href="/mgProduct"  style="color: black; ">상품 등록</a></label>
			        <br/>
			        <br/>
			        <label style="font-size: 26px;">상품 수정</label> 
			        <br/>
		       </div>    
		       <div class="box">
		       		<div class="form-header">
						<p class="size">상품 수정</p>
		       		</div>
		         	<div class="form-group has-success form-content">
			        	<form action="/updateProduct"  method="post" enctype="multipart/form-data">
			        		<input type="hidden" name="pd_id" value="<%=request.getParameter("pd_id")%>">
				            <label class="control-label" for="pd_name" style="color: black;">상품명</label>
				            <input type="text" name="pd_name" class="form-control rounded-0" id="pd_name" value="${pDto.pd_name }">
				            <br/>
				            <label class="control-label" for="pd_price" style="color: black; ">가격</label>
				            <input type="number" name="pd_price" class="form-control rounded-0" id="pd_price" value="${pDto.pd_price }">
				            <br/>
				            <label class="control-label" for="pd_color" style="color: black; ">색상</label>
				            <input type="text" name="pd_color" class="form-control rounded-0" id="pd_color" value="${pDto.pd_color }">
				            <br/>
				            <label class="control-label" for="pd_desc" style="color: black; ">설명</label>
				            <textarea name="pd_desc" class="form-control rounded-0" id="pd_desc" rows="10">${pDto.pd_desc }</textarea>
				            <br/>
				            <label>메인 카테고리</label> 
				            <br/>
				            <select class="form-control category1 rounded-0">
				                <option value="">메인 카테고리</option>
				            </select>
				            <br/>
				            <label>서브 카테고리</label> 
				            <br/>
				            <select class="form-control category2 rounded-0" name="cat_id">
				                <option value="">서브 카테고리</option>
				            </select>
				            <br/>
				            <div class="input-size row">
					            <div class="col-sm input-size-box">
					            	<input type="checkbox" name="size" id="size_S" class="size-check" value="S"/>
										<label for="size_s">S</label>
									<input type="text" name="stock" class="input_S text-size" disabled>
					            </div>
					            <div class="col-sm input-size-box">
					            	<input type="checkbox" name="size" id="size_M" class="size-check" value="M"/>
										<label for="size_m">M</label>
									<input type="text" name="stock" class="input_M text-size" disabled>
					            </div>
					            <div class="col-sm input-size-box">
					            	<input type="checkbox" name="size" id="size_L" class="size-check" value="L"/>
										<label for="size_l">L</label>
									<input type="text" name="stock" class="input_L text-size" disabled>
					            </div>
				            </div>
				            <label class="control-label" for="discount" style="color: black; ">할인율</label>
				            <input type="number" name="discount" class="form-control rounded-0" id="discount" value="${pDto.discount }">
				            <br/>
				            <label class="control-label" for="img">이미지</label><br/>
				            <input multiple="multiple" type="file" name="img" id="img">
				            <div class="select_img">
				            	<c:forTokens items="${pDto.pd_img }" var="img" delims=",">
									<img src="/images/${img }" style="width:130px;"/>
				            	</c:forTokens>
							</div>
							<input type="hidden" name="preImg" value="${pDto.pd_img }" />
				            <br/>
				            <br/>
				            <input type="submit" class="btn btn-lg btn-block rounded-0" value="상품 수정" style="color: white; background-color: black;">
				            <button id="cencle" type="button" class="btn btn-default btn-lg btn-block rounded-0" >취소</button>
			       		</form>
		       		</div>
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
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	var pd_cat = '${pDto.cat_id}';
	var pd_cat_ref = '${pDto.cat_id_ref}';
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
		if(cate1Arr[i].cat_id == pd_cat_ref){
			cate1Select.append("<option value='" + cate1Arr[i].cat_id + "'selected>"
					+ cate1Arr[i].cat_name + "</option>");
		}else{
			cate1Select.append("<option value='" + cate1Arr[i].cat_id + "'>"
							+ cate1Arr[i].cat_name + "</option>");	
		}
	}

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

		
	var selectVal = $(".category1 option:selected").val();  // 현재 선택한 cate1Select의 값을 저장

	cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
	
	// cate2Arr의 데이터를 cate2Select에 추가
	for(var i = 0; i < cate2Arr.length; i++) {
		
		// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
		if(selectVal == cate2Arr[i].cat_id_ref) {
			if(cate2Arr[i].cat_id == pd_cat){
				cate2Select.append("<option value='" + cate2Arr[i].cat_id + "'selected>"
									+ cate2Arr[i].cat_name + "</option>");
			}else{
				cate2Select.append("<option value='" + cate2Arr[i].cat_id + "'>"
						+ cate2Arr[i].cat_name + "</option>");
			}
		}
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
<script>
	$("input[name=size]").each(function(){
		var stockJson = ${pd_stock};
		for(var i = 0; i < stockJson.length; i++) {
			if(stockJson[i].pd_size == $(this).val()) {  // 레벨이 1인 데이터가 있다면 
				$(".input_"+stockJson[i].pd_size).val(stockJson[i].pd_stock);
				$("#size_"+stockJson[i].pd_size).prop("checked",true);
				$(".input_"+stockJson[i].pd_size).attr("disabled",false);
			}
		}
	});
	
	$(function(){	
		$("#size_S").change(function() {
			if($("#size_S").prop("checked")){
				$(".input_S").attr("disabled",false);
			}else{
				$(".input_S").attr("disabled",true);
			}    	
		});
		$("#size_M").change(function() {
			if($("#size_M").prop("checked")){
				$(".input_M").attr("disabled",false);
			}else{
				$(".input_M").attr("disabled",true);
			}    	
		});	
		$("#size_L").change(function() {
			if($("#size_L").prop("checked")){
				$(".input_L").attr("disabled",false);
			}else{
				$(".input_L").attr("disabled",true);
			}    	
		});	
	});
	
	$("#img").change(function(){
		if(this.files && this.files[0]) {
			var fileList = this.files;
			$(".select_img").empty();
			for(var i = 0 ; i<fileList.length; i++){
				var filereader = new FileReader;
				let $img=jQuery.parseHTML("<img src='' style='width:130px;'>");
	            filereader.onload = function(){
	                $img[0].src=this.result;
	            };
	            filereader.readAsDataURL(this.files[i]);
	            $(".select_img").append($img);
			};
		}
	});
</script>
</body>
</html>
<jsp:include page="../footer.jsp" flush="false" />