package com.store.service;

import java.util.List;
import java.util.Map;

import com.store.dto.ProductDto;

public interface ProductService {
	//상품 목록
	List<ProductDto> listProduct(int catId, String sortby);
	ProductDto viewProduct(int id);
	List<ProductDto> getColorList(String name);
	int getProductId(String pd_name,String pd_color);
	int regProduct(ProductDto pDto);
	int deleteProduct(String id);
	int updateProduct(Map<String, String> map);
	List<ProductDto> listProductSize(int catId, String size, String sortby);
	List<ProductDto> listSearchProduct(String keyword, String size, String sortby);	
}
