package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder.Default;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Account", uniqueConstraints = { @UniqueConstraint(columnNames = { "email" }) })
public class Account implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Email
	@NotBlank
	private String email;
	
	@NotBlank
	private String password;
	
	@NotBlank
	private String fullname;
	
	@NotBlank
	private String avatar = "avatar.jpg";
	
	@OneToMany(mappedBy = "account")
	private List<BooksOfAccount> booksOfAccount;
	
	@OneToMany(mappedBy = "account")
	private List<Orders> orders;
	
	private Boolean isActive = true;

}
