package com.store.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryDao {
	public String getCatDao(int catId);	
}
