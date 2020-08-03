package com.store.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDto {

	private int order_id;
	
	private String user_email;
	private String dv_address1;
	private String dv_address2;
	private String dv_address3;
	private String dv_address4;
	private String dv_option;
	private String dv_message;
	private int total;
	private String payment_method;
	private Date payDate;
	private String order_state;
	
	//orderDetail
	private int pd_id;
	private String pd_size;
	private String pd_quantity;
	private String price_sum;
}
