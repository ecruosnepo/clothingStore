package com.store.dto;

import lombok.Data;

@Data
public class OrderDetailDto {
	private String order_id;
	private int pd_id;
	private String pd_size;
	private int pd_quantity;
	private int price_sum;
}
