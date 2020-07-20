package com.store.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserDto {
	private String email;
	private String password;
	private String name;
	private String birth;
	private int phone;
	private int gender;
	private Date regDate;
}
