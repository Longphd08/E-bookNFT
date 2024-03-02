/**
 * 
 */
package com.poly.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.poly.entity.Book;
import com.poly.entity.CartItem;

/**
 * 
 */
public interface ShoppingCartService {
	/**
	 * Thêm mặt hàng vào giỏ hoặc tăng số lượng lên 1 nếu đã tồn tại
	 * 
	 * @param id là mã mặt hàng cần thêm
	 * @return mặt hàng đã được thêm vào hoặc cập nhật số lượng
	 */
	void addBook(CartItem item);
	
	/**
	 * Thêm mặt hàng vào giỏ hoặc tăng số lượng lên 1 nếu đã tồn tại
	 * 
	 * @param id là mã mặt hàng cần thêm
	 * @param id là số mặt hàng cần thêm
	 * @return mặt hàng đã được thêm vào hoặc cập nhật số lượng
	 */
	void addBook(Integer id, Integer qty);

	/**
	 * Xóa mặt hàng khỏi giỏ
	 * 
	 * @param id mã mặt hàng cần xóa
	 */
	void removeBook(Integer id);

	/**
	 * Thay đổi số lượng lên của mặt hàng trong giỏ
	 * 
	 * @param id  mã mặt hàng
	 * @param qty số lượng mới
	 * @return mặt hàng đã được thay đổi số lượng
	 */
	CartItem updateBook(Integer id, int qtyCart);

	/**
	 * Xóa sạch các mặt hàng trong giỏ
	 */
	void clear();

	/**
	 * Lấy tất cả các mặt hàng trong giỏ
	 */
	Map<Integer, CartItem> getCartItems();

	/**
	 * Lấy tổng số lượng các mặt hàng trong giỏ
	 */
	int getCount();

	/**
	 * Lấy tổng số tiền tất cả các mặt hàng trong giỏ
	 */
	double getAmount();

}
