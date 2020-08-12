package com.store.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.StockDao;
import com.store.dto.StockDto;

@Service
public class StockServiceImpl implements StockService {
	@Autowired
	StockDao stockDao;

	@Override
	public StockDto getStock(int pId) {
		System.out.println("재고 정보 가져오기");
		return stockDao.getStockDao(pId);
	}
	
	@Override
	public int addStock(StockDto sDto) {
		System.out.println("재고 입력");
		return stockDao.addStockDao(sDto);
	}
	@Override
   public int updateStock(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity) {
      System.out.println("재고 수정");
      System.out.println(pd_quantity);
      return stockDao.updateStockDao(pd_id, pd_size, pd_quantity);
   }
	
}
