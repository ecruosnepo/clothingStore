package com.store.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {
	private int pd_id;
	private String pd_name;
	private int pd_price;
	private String pd_color;
	private String pd_desc;	
	private String cat_id;
	private Date pd_regDate;
	private int discount;
	private String pd_img;
}
