package com.store.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartDto {
	private int cart_id;
	private String email;
	private int pd_id;
	private String pd_size;
	private int pd_quantity;
	private Date cart_regDate;
}
