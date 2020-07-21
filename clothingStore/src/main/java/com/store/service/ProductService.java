package com.store.service;

import java.util.List;
import java.util.Map;

import com.store.dto.ProductDto;

public interface ProductService {
	//상품 목록
	List<ProductDto> listProduct(int catId);
	ProductDto viewProduct(int id);
	int regProduct(Map<String, String> map);
	int deleteProduct(String id);
	int updateProduct(Map<String, String> map);	
}
