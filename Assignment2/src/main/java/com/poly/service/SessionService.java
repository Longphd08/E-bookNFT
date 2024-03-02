/**
 * 
 */
package com.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * 
 */
@Service
public class SessionService {
	@Autowired HttpSession session;
	
	/**
	* Thay đổi hoặc tạo mới attribute trong session
	* @param name tên attribute
	* @param value giá trị attribute
	*/
	public void setAttribute(String name, Object value) {
		session.setAttribute(name, value);
	}
	
	/**
	* Đọc giá trị của attribute trong session
	* @param name tên attribute
	* @return giá trị đọc được hoặc null nếu không tồn tại
	*/
	@SuppressWarnings("unchecked")
	public <T> T getAttribute(String name) {
		if(session.getAttribute(name)!=null)
			return (T) session.getAttribute(name);
		else 
			return null;
	}
	
	/**
	* Xóa attribute trong session
	* @param name tên attribute cần xóa
	*/
	public void removeAttribute(String name) {
		session.removeAttribute(name);
	}
	
}
