package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Author;
@Repository
public interface AuthorDAO extends JpaRepository<Author, Integer>{
	@Override
	@Query("select o from Author o where o.isActive = true")
	List<Author> findAll();
	
	List<Author> findByName(String name);
}
