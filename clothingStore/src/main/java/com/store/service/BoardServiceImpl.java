package com.store.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.bean.PagingBean;
import com.store.dao.BoardDao;
import com.store.dao.OrderDao;
import com.store.dto.BoardDto;
import com.store.dto.OrderDto;

@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=1024*1024*50)
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao dao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	PagingBean pageBean;

	@Override
	public Map<String, Object> boardListService(String userId, int page) {
		
		Map<String, Object> map=new HashMap<String, Object>(); 
		pageBean=new PagingBean(page,dao.boardListCountDao(),5,3);
		
		map.put("dto", dao.boardListDao(userId));
		map.put("startIdx", pageBean.getStartIdx());
		map.put("endIdx", pageBean.getEndIdx());
		map.put("totalPage", pageBean.getTotalPage());
		map.put("startPageIdx", pageBean.getStartPageIdx());
		map.put("endPageIdx", pageBean.getEndPageIdx());
		
		return map;
	}
	@Override
	public List<OrderDto> boardOrderViewService(String userId){
		List<OrderDto> orderDto= orderDao.userOrderListDao(userId);
		return orderDto;
	}
	@Override
	public void boardWriteService(int b_check, String userId, String title, String question, String boardCat, 
			String fileName, int orderId) {
		
		dao.boardWriteDao(b_check, userId, title, question, boardCat,fileName,orderId);
	}

	@Override
	public BoardDto boardListViewService(int id) {
		BoardDto dto=dao.boardViewDao(id);
		return dto;
	}

	@Override
	public void boardDeleteService(int id) {
		dao.boardDeleteListDao(id);
	}

	@Override
	public Map<String,Object> boardUpdateViewService(int id) {
		Map<String,Object> map=new HashMap<String,Object>();
		BoardDto dto=dao.boardViewDao(id);
		List<OrderDto> order=orderDao.userOrderListDao(dto.getUser_email());
		
		ArrayList<String> list=new ArrayList<String>();
		list.add("배송");
		list.add("결제");
		list.add("반품");
		list.add("환불");
		list.add("기타");
		
		for (int i = 0; i < list.size(); i++) {
			if(dto.getBoardCat().equals(list.get(i))) {
				list.remove(i);
			}
		}
		map.put("dto",dto);
		map.put("otherCatList", list);
		map.put("orderList", order);
		
		return map;
	}

	@Override
	public void boardUpdateService(int id, String title, String question, String boardCat, String fileName, int orderId) {
		
		dao.boardUpdateDao(id, title, question, boardCat,fileName,orderId);
	}

	//파일 올려주고 filename 리턴 메소드
	@Override
	public String boardFileUploadService(Part filePart, String realPath) {
		
		String fileName="";
		try {
			fileName=filePart.getSubmittedFileName();
			//파일이 없을 경우 공백 리턴
			if(fileName==null || fileName.equals("")) {
				return "";
			}
			
			//기존 저장된 파일이름 불러오기
			List<String> oFileNames=dao.boardFileNameListDao();
			//파일이름 중복 제거
			for(int i=0; i<oFileNames.size();i++) {
				int n=1;
				if(fileName.equals(oFileNames.get(i))) {
					fileName="("+n+")"+fileName;
					n++;
				}
			}
			
			//파일 업로드
			InputStream fis=filePart.getInputStream();
			
			String filePath=realPath + File.separator + fileName;
			FileOutputStream fos=new FileOutputStream(filePath);
			
			byte[] buf=new byte[1024];
			int size=0;
			while((size=fis.read(buf)) != -1) {
				fos.write(buf,0,size);
			}
			
			fos.close();
			fis.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
}


