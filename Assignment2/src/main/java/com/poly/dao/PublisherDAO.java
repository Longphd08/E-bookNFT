package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Publisher;
@Repository
public interface PublisherDAO extends JpaRepository<Publisher, Integer>{
	@Override
	@Query("select o from Publisher o where o.isActive = true")
	List<Publisher> findAll();
	
	List<Publisher> findByName(String name);
	
}
