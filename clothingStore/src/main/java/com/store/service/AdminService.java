package com.store.service;

import java.util.Map;

import com.store.dto.BoardDto;

public interface AdminService {

	public Map<String, Object> adminQnaService(int page);
	public BoardDto adminQnaViewService(int id);
	public void adminQnaUpdateService(int id, String answer);
	public void adminQnaDeleteService(int id);
	public Map<String, Object> adminQnaSearchService(int page, String search);
}
