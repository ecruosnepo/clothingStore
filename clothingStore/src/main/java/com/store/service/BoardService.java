package com.store.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.store.dto.BoardDto;
import com.store.dto.OrderDto;

public interface BoardService {

	public Map<String, Object> boardListService(String userId,int page);
	public void boardWriteService(int b_check, String userId, String title, String question, String boardCat, String fileName, int orderId);
	public List<OrderDto> boardOrderViewService(String userId);
	public BoardDto boardListViewService(int id); 
	public void boardDeleteService(int id);
	public Map<String,Object> boardUpdateViewService(int id);
	public void boardUpdateService(int id, String title, String question, String boardCat, String fileName, int orderId);
	public String boardFileUploadService(Part filePart, String realPath);
}
