package com.store.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.bean.PagingBean;
import com.store.dao.BoardDao;
import com.store.dto.BoardDto;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	BoardDao boardDao;
	@Autowired
	PagingBean pageBean;

	@Override
	public Map<String, Object> adminQnaService(int page) {
		Map<String, Object> map=new HashMap<String, Object>(); 
		pageBean=new PagingBean(page,boardDao.boardListCountDao(),5,3);
		
		map.put("dto", boardDao.boardListAllDao());
		map.put("startIdx", pageBean.getStartIdx());
		map.put("endIdx", pageBean.getEndIdx());
		map.put("totalPage", pageBean.getTotalPage());
		map.put("startPageIdx", pageBean.getStartPageIdx());
		map.put("endPageIdx", pageBean.getEndPageIdx());
		
		return map;
	}

	@Override
	public BoardDto adminQnaViewService(int id) {
		return boardDao.boardViewDao(id);
	}

	@Override
	public void adminQnaUpdateService(int id, String answer) {
		boardDao.boardAnswerUpdate(id, answer);
	}

	@Override
	public void adminQnaDeleteService(int id) {
		boardDao.boardDeleteListDao(id);
	}

	@Override
	public Map<String, Object> adminQnaSearchService(int page, String keyword) {
		Map<String, Object> map=new HashMap<String, Object>(); 
		pageBean=new PagingBean(page,boardDao.boardListCountDao(keyword),5,3,keyword);
		
		map.put("dto", boardDao.boardListAllDao("%"+keyword+"%"));
		map.put("keyword", pageBean.getKeyword());
		map.put("startIdx", pageBean.getStartIdx());
		map.put("endIdx", pageBean.getEndIdx());
		map.put("totalPage", pageBean.getTotalPage());
		map.put("startPageIdx", pageBean.getStartPageIdx());
		map.put("endPageIdx", pageBean.getEndPageIdx());
		
		return map;
	}
	
	

}
