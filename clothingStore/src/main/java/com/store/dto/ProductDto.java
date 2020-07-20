package com.store.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {
	private int pd_id;
	private String pd_name;
	private int pd_price;
	private String pd_color;
	private String pd_img1;
	private String pd_img2;
	private String pd_img3;
	private String pd_img4;
	private String pd_img5;
	private String pd_desc;
	private String pd_model;	
	private String cat_id;
	private Date pd_regDate;
	private int discount;
}
