package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
@Table(name = "Book")
public class Book implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotNull
	private String title;
	
	@NotNull
	@Min(0)
	private Double price;
	
	@NotNull
	@Min(1)
	private Integer qty;
	
	private String introduction;
	
	private String picturePath;
	
	private String pdfPath;
	
	private String contentPath;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "authorId")
	private Author author;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "categoryId")
	private Category category;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "publisherId")
	private Publisher publisher;
	
	@OneToMany(mappedBy = "book")
	private List<BooksOfAccount> booksOfAccount;
	
	@OneToMany(mappedBy = "book")
	private List<OrderDetail> orderDetails;
	
	private Boolean isActive = true;
	
}
