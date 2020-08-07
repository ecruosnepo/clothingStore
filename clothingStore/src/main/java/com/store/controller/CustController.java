package com.store.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.dto.BoardDto;
import com.store.dto.OrderDto;
import com.store.service.DefaultService;
import com.store.service.BoardService;

@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=1024*1024*50)
@Controller
public class CustController {
	
	@Autowired
	private BoardService service;
	@Autowired
	private DefaultService defaultservice;
	
	
	@RequestMapping(value="/customer", method=RequestMethod.GET)
	public String cusCenter(Model model) {
		return "customerCenter/main"; 
	}
	
	@RequestMapping("/customerInfo")
	public String cusInfo() {
		return "customerCenter/information"; 
	}
	
	@RequestMapping("/customerContact")
	public String cusContact() {
		return "customerCenter/contact"; 
	}
	
	@RequestMapping("/customerQna")
	public String qnaMain(HttpSession session, @RequestParam(defaultValue="1") int page, Model model) {
		
		String userId = (String) session.getAttribute("email");
		int checkLogin=0;
		System.out.println(userId);
		
		//로그인 유무 확인
		if(!(userId==null)) {
			//로그인된 회원일 경우 QnA페이지 이동
			Map<String, Object> map=service.boardListService(userId,page);
			model.addAttribute("list", map.get("dto"));
			model.addAttribute("page", map.get("page"));
		
			checkLogin=1;
		}
		
		model.addAttribute("checkLogin", checkLogin);
		
		return "customerCenter/q_main"; 
	}
	
	
	@RequestMapping("/customerQnaWriteForm")
	public String qnaWrite(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("email");
		List<OrderDto> order=service.boardOrderViewService(userId);
		model.addAttribute("orderList", order) ;
		return "customerCenter/q_write"; 
	}
	
	@RequestMapping("/customerWrite")
	public String qnaWrite(BoardDto bDto, @RequestParam(name="orderId", defaultValue="0")Integer orderId, 
			HttpServletRequest req, HttpSession session, Model model) {
		
		String user_email = (String) session.getAttribute("email");
		System.out.println(bDto.getTitle());
		
		//게시판 글쓰기 확인 값  1:제목미기재 2:분류미선택 10:글쓰기 성공
		int result=10;
		
		if(bDto.getTitle()==null || bDto.getTitle().trim().length()==0) {
			//제목을 입력 안했을 경우
			result=1;
			
		}else if(bDto.getBoardCat()==null || bDto.getBoardCat().trim().length()==0) {
			//게시판의 분류를 선택 안했을 경우
			result=2;
			
		}else {
			//정상적으로 모두 입력 되었을 때
			
			//첨부파일 받기
			Part filePart=null;
			String realPath="";
			
			try {
				filePart = req.getPart("uploadFile");
				realPath=req.getServletContext().getRealPath("/resources/questionFile");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
			int b_check=0;
			//파일 저장
			String fileName=service.boardFileUploadService(filePart, realPath);
			
			//입력 실행
			service.boardWriteService(b_check, user_email, bDto, fileName,orderId);
		}
		model.addAttribute("result", result);
		
		return "customerCenter/q_write";
	}
	
	@RequestMapping(value="/boardListView")
	public String listView(@RequestParam("id")int id, Model model) {
		BoardDto dto=service.boardListViewService(id);
		
		model.addAttribute("dto",dto);
		return "customerCenter/q_view";
	}
	
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("id")int id) {
		System.out.println("문의 삭제");
		service.boardDeleteService(id);
		return "redirect:customerQna"; 
	}
	@RequestMapping(value="/boardUpdateForm", method = RequestMethod.GET)
	public String updateForm(@RequestParam("id")int id, Model model) {
		
		Map<String,Object> map=service.boardUpdateFormService(id);
		model.addAttribute("dto", map.get("dto"));
		model.addAttribute("otherCatList", map.get("otherCatList"));
		model.addAttribute("orderList", map.get("orderList"));
		return "customerCenter/q_update";
	}
	
	@RequestMapping("/boardUpdate")
	public String update( BoardDto bDto, HttpServletRequest req, Model model) {
		
		//게시판 글쓰기 확인 값  1:제목미기재 10:글쓰기 성공
		int result=10;
		
		//제목을 입력 안했을 경우
		if(defaultservice.check(bDto.getTitle())) {
			result=1;
			model.addAttribute("result", result);
			return "customerCenter/q_update";
		}
		
		//첨부 파일 받기
		Part filePart=null;
		String realPath="";
		
		try {
			filePart = req.getPart("uploadFile");
			realPath=req.getServletContext().getRealPath("/resources/questionFile");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		String fileName=service.boardFileUploadService(filePart, realPath);
		
		//boardDto에 file이름 추가
		bDto.setFile(fileName);
		service.boardUpdateService(bDto);
		
		model.addAttribute("result", result);
		
		return "customerCenter/q_update"; 
	}
	
}
