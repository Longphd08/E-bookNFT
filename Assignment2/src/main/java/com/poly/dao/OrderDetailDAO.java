package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.OrderDetail;
import com.poly.entity.Orders;

@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	@Override
	@Query("select o from OrderDetail o where o.isActive = true")
	List<OrderDetail> findAll();
	
	List<OrderDetail> findAllByOrder(Orders order);
	
}
