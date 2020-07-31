package com.store.dto;


import java.sql.Date;

import lombok.Data;

@Data
public class BoardDto {
	private int id;
	//답변 유무
	private int b_check;
	private String user_email;
	private String title;
	private String question;
	private String answer;
	private String boardCat;
	private Date regDate;
	private String file;
	private int orderId;
}
