package com.store.dto;
import java.sql.Date;

import lombok.Data;

@Data
public class UserDto {
	private String user_email;
	private String user_password;
	private String user_name;
	private int user_birth;
	private String user_gender;
	private String user_phone;
	private Date regDate;
}
