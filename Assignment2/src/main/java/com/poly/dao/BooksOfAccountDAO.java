package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Book;
import com.poly.entity.BooksOfAccount;
import com.poly.entity.Account;

@Repository
public interface BooksOfAccountDAO extends JpaRepository<BooksOfAccount, Long>{
	@Override
	@Query("select o from BooksOfAccount o where o.isActive = true")
	List<BooksOfAccount> findAll();
	
	Page<BooksOfAccount> findByAccount(Account account, Pageable pageable);
	
	List<BooksOfAccount> findByBookAndAccount(Book book, Account account);
}
