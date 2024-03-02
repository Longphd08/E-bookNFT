package com.poly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
	private Integer id;
	private String title;
	private Double price;
	private Integer qty;
	private String picturePath;

}
