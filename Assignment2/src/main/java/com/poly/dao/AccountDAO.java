package com.poly.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.poly.entity.Account;

@Repository
public interface AccountDAO extends JpaRepository<Account, Integer> {

	@Override
	@Query("select o from Account o where o.isActive = true")
	List<Account> findAll();

	List<Account> findByEmail(String email);
	
	Page<Account> findAllByFullnameLike(String fullname, Pageable pageable);

}
