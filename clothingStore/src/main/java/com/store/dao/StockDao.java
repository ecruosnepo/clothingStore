package com.store.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.StockDto;

@Mapper
public interface StockDao {
	public StockDto getStockDao(int pId);
	public int addStockDao(StockDto sDto);
	public int updateStockDao(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity, @Param("op")String op);
	//관리자 페이지
	//상품의 재고 갯수
	public int countStockDao(@Param("pd_id")int pd_id);
	//재고 삭제
	public int deleteStockDao(@Param("pd_size")String pd_size, @Param("pd_id")int pd_id);
	
}
