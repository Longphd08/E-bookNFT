package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Account;
import com.poly.entity.Orders;

@Repository
public interface OrdersDAO extends JpaRepository<Orders, Integer> {
	@Override
	@Query("select o  from Orders o where o.isActive = true")
	List<Orders> findAll();

	@Procedure(name = "CalculateOrderTotal")
	Double calculateTotal(@Param("orderId") int orderId);
	
	@Query("select o  from Orders o where o.account = ?1 and o.isActive = true")
	List<Orders> findByAccount(Account account);
	
}
