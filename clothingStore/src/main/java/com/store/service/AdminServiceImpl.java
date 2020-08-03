package com.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.bean.PagingBean;
import com.store.dao.AddressDao;
import com.store.dao.BoardDao;
import com.store.dao.CartDao;
import com.store.dao.UserDao;
import com.store.dto.BoardDto;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	BoardDao boardDao;
	@Autowired
	UserDao userDao;
	@Autowired
	AddressDao addressDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	PagingBean pageBean;

	@Override
	public Map<String, Object> adminQnaService(int page) {
		Map<String, Object> map=new HashMap<String, Object>(); 
		pageBean=new PagingBean(page,boardDao.boardListAllCountDao(),10,3);
		
		map.put("dto", boardDao.boardListAllDao());
		map.put("page", pageBean);
		
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
	public Map<String, Object> adminQnaSearchService(int page, String search, String boardCat) {
		Map<String, Object> map=new HashMap<String, Object>(); 
		pageBean=new PagingBean(page,boardDao.boardListAllCountDao("%"+search+"%", "%"+boardCat+"%"),10,3);
		
		List<String> list=new ArrayList<String>();
		list.add("");
		list.add("배송");
		list.add("결제");
		list.add("반품");
		list.add("환불");
		list.add("기타");
		
		map.put("boardDto", boardDao.boardListAllDao("%"+search+"%", "%"+boardCat+"%"));
		map.put("boardCatList", list);
		map.put("page", pageBean);
		
		return map;
	}

	@Override
	public Map<String, Object> adminMemberListService(int page) {
		Map<String, Object> map=new HashMap<String, Object>();
		pageBean=new PagingBean(page,userDao.userListCount(),10,3);
		
		map.put("dto", userDao.userAllList());
		map.put("page", pageBean);
		return map;
	}

	@Override
	public int adminMemDelService(List<String> chArr) throws Exception {
		List<String> delList=chArr;
		
		int result=0;
		for(String email : delList) {
			result+=userDao.deleteInfoUser(email);
			addressDao.deleteInfoAddress(email);
			cartDao.deleteUserCartDao(email);
			boardDao.boardDelUserDao(email);
		}
		
		return result;
	}

	@Override
	public Map<String, Object> adminMemSearch(int page, String search) {
		Map<String, Object> map=new HashMap<String, Object>();
		pageBean=new PagingBean(page, userDao.userSearchCount("%"+search+"%"),10,3);
		
		map.put("searchList", userDao.userSearchList("%"+search+"%"));
		map.put("page", pageBean);
		
		return map;
	}
	
	

}
