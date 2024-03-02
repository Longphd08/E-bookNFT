/**
 * 
 */
package com.poly.model;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportIncome implements Serializable{
	@Id
	Integer id;
	String category; //Lưu ý: Để group by được thì biểu thức trong group by phải Serializable
	Long orders;
	Double total;
}
