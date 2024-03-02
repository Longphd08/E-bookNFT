package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Admin;
@Repository
public interface AdminDAO extends JpaRepository<Admin, Integer>{
	@Override
	@Query("select o from Admin o where o.isActive = true")
	List<Admin> findAll();
	
	List<Admin> findByUsername(String username);
	
	List<Admin> findByEmail(String email);
	
	List<Admin> findByIdentityNumber(String identityNumber);
	
	List<Admin> findByIdOrUsername(Integer id, String username);
	
	List<Admin> findByIdOrEmail(Integer id, String email);
	
	List<Admin> findByIdOrIdentityNumber(Integer id, String identityNumber);
}
