package com.store.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDto {

	private int id;
	private String user_email;
	private int productId;
	private String productName;
	private String productColor;
	private String productSize;
	private int totalPrice;
	private Date payDate;
}
