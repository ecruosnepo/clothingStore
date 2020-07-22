package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.dto.CategoryDto;

@Mapper
public interface CategoryDao {
	public List<CategoryDto> getAllCatDao();
	public String getCatDao(int catId);	
}
