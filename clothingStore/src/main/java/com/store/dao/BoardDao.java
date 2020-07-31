package com.store.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.BoardDto;

@Mapper
public interface BoardDao {
	
	//아이디 기준 모든 게시물 출력
	public List<BoardDto> boardListDao(@Param("user_email") String user_email);
	public void boardWriteDao(@Param("b_check")int b_check, @Param("user_email")String user_email,@Param("title") String title,
			@Param("question")String question, @Param("boardCat")String boardCat, @Param("file")String file, @Param("orderId")int orderId);
	public BoardDto boardViewDao(@Param("id") int id);
	//총 게시물수
	public int boardListCountDao();
	public void boardDeleteListDao(@Param("id")int id);
	public void boardUpdateDao(@Param("id")int id, @Param("title")String title, @Param("question")String question, 
			@Param("boardCat")String boardCat, @Param("fileName")String fileName, @Param("orderId")int orderId);
	public List<String> boardFileNameListDao();
	public void boardAnswerUpdate(@Param("id")int id, @Param("answer")String answer);
	
	//관리자 페이지
	//모든 게시물 리스트
	public List<BoardDto> boardListAllDao();
	//user_email로 검색한 게시물 리스트
	public List<BoardDto> boardListAllDao(@Param("keyword") String keyword);
	//user_email로 검색한 게시물 개수
	public int boardListCountDao(@Param("search") String search);
}
