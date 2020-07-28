package com.store.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String qnaMain(@RequestParam(name="userId", defaultValue="1")String userId, @RequestParam(defaultValue="1") int page, Model model) {
		
		//로그인 유무 확인
		if(defaultservice.check(userId)) {
			return "redirect:nonMember"; 
		}
		
		//로그인된 회원일 경우 QnA페이지 이동
		Map<String, Object> map=service.boardListService(userId,page);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("startIdx", map.get("startIdx"));
		model.addAttribute("endIdx", map.get("endIdx"));
		model.addAttribute("thisPage", page);
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("startPageIdx", map.get("startPageIdx"));
		model.addAttribute("endPageIdx", map.get("endPageIdx"));
		
		return "customerCenter/q_main"; 
	}
	
	//비회원이 qna 접속시 안내 문구 출력
	@RequestMapping("/nonMember")	
	public @ResponseBody String nonMember(){
		String message="<script>\r\n" + "alert('회원 가입 후 이용해 주세요.');\r\n" +"history.back();"+"</script>";
		return message; 
	}
	
	@RequestMapping("/customerQnaWriteForm")
	public String qnaWrite(@RequestParam(name="userId", defaultValue="1")String userId, Model model) {
		List<OrderDto> order=service.boardOrderViewService(userId);
		model.addAttribute("orderList", order) ;
		return "customerCenter/q_write"; 
	}
	
	@RequestMapping("/customerWrite")
	public @ResponseBody String qnaWriteOk(
			@RequestParam(name="userId", defaultValue="1")String userId, @RequestParam(name="title", defaultValue="")String title,
			@RequestParam("question")String question, @RequestParam(name="boardCat", defaultValue="")String boardCat,
			@RequestParam(name="orderId", defaultValue="0")Integer orderId, HttpServletRequest req) {
		
		//제목을 입력 안했을 경우
		if(defaultservice.check(title)) {
			return "<script>\r\n" + "alert('제목을 입력해 주세요.'); history.back();\r\n </script>";
		}
		
		//게시판의 분류를 선택 안했을 경우
		if(defaultservice.check(boardCat)) {
			return "<script>\r\n" + "alert('분류를 선택해 주세요.');\r\n history.back();</script>";
		}
		System.out.println("userId :"+userId+"title : " + title+"question : "+ question+"boardCat : "+ boardCat);
		
		Part filePart=null;
		String realPath="";
		
		try {
			filePart = req.getPart("file");
			realPath=req.getServletContext().getRealPath("/images/questionFile");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		//입력 실행
		int b_check=0;
		String fileName=service.boardFileUploadService(filePart, realPath);
		service.boardWriteService(b_check, userId, title, question, boardCat,fileName,orderId);
		
		return "<script>\r\n alert('문의 감사합니다.');\r\n" +"location.href='/customerQna'; </script>";
	}
	
	@RequestMapping(value="/boardListView")
	public String listView(@RequestParam("id")String id, Model model) {
		BoardDto dto=service.boardListViewService(id);
		
		model.addAttribute("dto",dto);
		return "customerCenter/q_view";
	}
	
	@RequestMapping("/boardDeleteCnf")
	public @ResponseBody String deleteCnf(@RequestParam("id")String id) {
		String message="<script>\r\n" + "var del=confirm('해당 게시물을 삭제하시겠습니까?');\r\n" +
				"if(del){location.href='/delete?id="+id+"'}else{history.back();};\r\n"+"</script>";
		return message; 
	}
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("id")String id) {
		service.boardDeleteService(id);
		return "redirect:customerQna?userId=1"; 
	}
	@RequestMapping(value="/boardUpdateForm", method = RequestMethod.GET)
	public String updateForm(@RequestParam("id")String id,
			@RequestParam(name="userId", defaultValue="1")String userId, Model model) {
		Map<String,Object> map=service.boardUpdateViewService(id);
		model.addAttribute("dto", map.get("dto"));
		model.addAttribute("otherCatList", map.get("otherCatList"));
		model.addAttribute("orderList", map.get("orderList"));
		return "customerCenter/q_update";
	}
	
	@RequestMapping("/boardUpdate")
	public @ResponseBody String update( @RequestParam("id")int id, @RequestParam("title")String title,
			@RequestParam("question")String question, @RequestParam("boardCat")String boardCat,
			@RequestParam(name="orderId", defaultValue="0")Integer orderId, HttpServletRequest req) {
		
		//제목을 입력 안했을 경우
		if(defaultservice.check(title)) {
			return "<script>\r\n" + "alert('제목을 입력해 주세요.'); history.back();\r\n </script>";
		}
		Part filePart=null;
		String realPath="";
		
		try {
			filePart = req.getPart("file");
			realPath=req.getServletContext().getRealPath("/images/questionFile");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		String fileName=service.boardFileUploadService(filePart, realPath);
		service.boardUpdateService(id, title, question, boardCat,fileName);
		String message="<script>\r\n" + "alert('해당 게시물이 수정되었습니다.');\r\n" +"location.href='/listView?id="+id+"';"+"</script>";
		return message; 
	}
	
}
