package com.store.service;

import java.util.List;
import java.util.Map;

import com.store.dto.ProductDto;

public interface ProductService {
	//상품 목록
	List<ProductDto> list();
	ProductDto view(String id);
	int registry(Map<String, String> map);
	int delete(String id);
	int update(Map<String, String> map);	
}
