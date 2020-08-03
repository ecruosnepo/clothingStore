package com.store.service;

import java.util.List;
import java.util.Map;

import com.store.dto.BoardDto;

public interface AdminService {

	public Map<String, Object> adminQnaService(int page);
	public BoardDto adminQnaViewService(int id);
	public void adminQnaUpdateService(int id, String answer);
	public void adminQnaDeleteService(int id);
	public Map<String, Object> adminQnaSearchService(int page, String search, String boardCat);
	public Map<String, Object> adminMemberListService(int page);
	public int adminMemDelService(List<String> chArr)throws Exception;
	public Map<String, Object> adminMemSearch(int page, String search);
}
