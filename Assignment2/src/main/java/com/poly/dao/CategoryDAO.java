package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Category;
import com.poly.model.ReportIncome;

@Repository
public interface CategoryDAO extends JpaRepository<Category, Integer> {
	@Override
	@Query("select o from Category o where o.isActive = true")
	List<Category> findAll();

	List<Category> findByName(String name);

	@Query("Select new ReportIncome(c.id, c.name, count(od.order.id), sum(b.price * od.qty)) " + "from Category c "
			+ "left join Book b "
			+ "on c.id = b.category.id"
			+ " right join OrderDetail od "
			+ "on od.book.id = b.id "
			+ "group by c.name, c.id ")
	List<ReportIncome> getReportIncomes();
}
