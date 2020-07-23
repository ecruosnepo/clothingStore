package com.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.store.dto.ProductDto;

@Mapper
public interface ProductDao {
	public List<ProductDto> listProductDao(); // 게시물 목록을 가져온다 
	public ProductDto viewProductDao(int id); // db에서 id와 일치하는 내용 호출
	public int regProductDao(ProductDto pDto); // db에 입력
	public int deleteProductDao(String id); // db에서 id와 일치하는 삭제
	public int updateProductDao(Map<String,String> map);
}