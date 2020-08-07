package com.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.ProductDto;

@Mapper
public interface ProductDao {
	public List<ProductDto> listProductDao(@Param("cat_id")int cat_id, @Param("sortby")String sortby); // 게시물 목록을 가져온다 
	public ProductDto viewProductDao(int pd_id); // db에서 id와 일치하는 내용 호출
	public List<ProductDto> getColorListDao(String pd_name); // db에서 name과 일치하는 color 호출
	public int getProductIdDao(String pd_name,String pd_color);
	public int regProductDao(ProductDto pDto); // db에 입력
	public int deleteProductDao(String id); // db에서 id와 일치하는 삭제
	public int updateProductDao(Map<String,String> map);
	public List<ProductDto> listProductSizeDao(@Param("cat_id")int cat_id, @Param("size")String size, @Param("sortby")String sortby); // 해당하는 사이즈가 있는 상품만 불러옴 
	public List<ProductDto> listSearchProductDao(@Param("keyword")String keyword, @Param("size")String size, @Param("sortby")String sortby); // 해당하는 사이즈가 있는 상품만 불러옴 
	
	//관리자 페이지
	public List<ProductDto> adminListProductDao(); 
	public List<ProductDto> adminListProductDao(String search); 
	public int listPdCountDao();
	public int listPdCountDao(String search); 
	public int adminDeletePdsDao(int pd_id);
	//파일 이미지 호출
	public String adminImageDao(int pd_id);
}
