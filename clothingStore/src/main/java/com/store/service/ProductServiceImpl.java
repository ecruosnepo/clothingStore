package com.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.ProductDao;
import com.store.dto.ProductDto;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	
	//상품 목록
	@Override
	public List<ProductDto> listProduct(int catId) {
		System.out.println("상품 목록");
		return dao.listProductDao();
	}

	@Override
	public ProductDto viewProduct(int id) {
		System.out.println("상품 상세");
		return dao.viewProductDao(id);
	}

	@Override
	public int regProduct(Map<String, String> map) {
		System.out.println("상품 등록");
		return dao.regProductDao(map);
	}

	@Override
	public int deleteProduct(String id) {
		System.out.println("상품 제거");
		return dao.deleteProductDao(id);
	}

	@Override
	public int updateProduct(Map<String, String> map) {
		System.out.println("상품 정보 수정");
		return dao.updateProductDao(map);
	}
}
