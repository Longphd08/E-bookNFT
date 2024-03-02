package com.poly.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.Const;
import com.poly.dao.BookDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.OrdersDAO;
import com.poly.entity.Book;
import com.poly.entity.Orders;
import com.poly.service.SessionService;
import com.poly.service.UploadService;

import jakarta.servlet.ServletContext;

@Controller
@RequestMapping("/admin/orders-management")
public class OrdersController {
	@Autowired
	SessionService sessionService;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	OrdersDAO ordersDAO;
	@Autowired
	ServletContext app;
	@Autowired
	UploadService uploadService;

	@RequestMapping("")
	public String getAccountManagement(Model model, @ModelAttribute("order") Orders order,
			@RequestParam("p") Optional<Integer> p) {
		order.setId(null);
		order.setAccount(null);
		order.setPhone(null);
		order.setOrderDate(new Date());
		order.setIsActive(true);
		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "orders-management";
	}

	@GetMapping("/page")
	public String page(Model model, @ModelAttribute("order") Orders order, @RequestParam("p") Optional<Integer> p) {
		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "orders-management";
	}

	@PostMapping("/create")
	public String postCreate(Model model, @Validated @ModelAttribute("order") Orders order,
			BindingResult bindingResult, @RequestParam("p") Optional<Integer> p) {
//		if (!introductionFile.isEmpty()) {
//			if (!pictureFile.isEmpty()) {
//				if (!contentFile.isEmpty()) {
//					if (!bookDAO.findByTitle(book.getTitle()).isEmpty()) {
//						Book updateBook = bookDAO.findByTitle(book.getTitle()).get(0);
//						updateBook.setQty(updateBook.getQty() + book.getQty());
//						bookDAO.save(updateBook);
//						model.addAttribute("message", "Cập nhật số lượng thành công");
//					} else {
//						uploadService.save(pictureFile, "/views/img/category/");
//						uploadService.save(contentFile, "/views/content/");
//						uploadService.save(introductionFile, "/views/intro/");
//						String pictureName = StringUtils.cleanPath(pictureFile.getOriginalFilename());
//						String contentName = StringUtils.cleanPath(contentFile.getOriginalFilename());
//						String introName = StringUtils.cleanPath(introductionFile.getOriginalFilename());
//						book.setPicturePath(pictureName);
//						book.setContentPath(contentName);
//						book.setIntroduction(introName);
//						if (bindingResult.hasErrors()) {
//							model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
//
//						} else {
//							bookDAO.save(book);
//							model.addAttribute("message", "Thêm mới thành công!");
//						}
//					}
//
//				} else
//					model.addAttribute("message", "Vui lòng chọn file content");
//
//			} else
//				model.addAttribute("message", "Vui lòng chọn ảnh");
//
//		} else
//			model.addAttribute("message", "Vui lòng chọn file giới thiệu");

		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "orders-management";
	}

	@PostMapping("/update")
	public String postUpdate(Model model, @Validated @ModelAttribute("order") Orders order, BindingResult bindingResult,
			@RequestParam("p") Optional<Integer> p) {

		if (!ordersDAO.findById(order.getId()).isEmpty()) {
			if (ordersDAO.findById(order.getId()).get().getAccount().getId().equals(order.getAccount().getId())) {
				if (bindingResult.hasErrors()) {
					model.addAttribute("message", "Vui lòng sửa các lỗi sau:");

				} else {
					ordersDAO.save(order);
					model.addAttribute("message", "Cập nhật thành công!");
				}

			}else {
				model.addAttribute("message", "Không thể cập nhật mã người dùng!");
			}
		} else {
			model.addAttribute("message", "Mã đơn không tồn tại!");
		}

		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "book-management";
	}

	@GetMapping("/edit")
	public String getEdit(Model model, @RequestParam("id") Integer id, @ModelAttribute("order") Orders order,
			@RequestParam("p") Optional<Integer> p) {
		if (ordersDAO.findById(id).isEmpty())
			return "redirect:/admin/orders-management";
		else {
			Orders editOrder = ordersDAO.findById(id).get();
			order.setId(id);
			order.setAccount(editOrder.getAccount());
			order.setOrderDate(editOrder.getOrderDate());
			order.setPhone(editOrder.getPhone());
			order.setIsActive(editOrder.getIsActive());
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "orders-management";
	}

	@PostMapping("/delete")
	public String postDelete(Model model, @RequestParam("id") Integer id, @ModelAttribute("order") Orders order,
			@RequestParam("p") Optional<Integer> p) {
		if (ordersDAO.findById(id).isEmpty())
			model.addAttribute("message", "Đơn hàng không tồn tại!");
		else {
			Orders deleteOrder = ordersDAO.findById(id).get();
			deleteOrder.setIsActive(false);
			ordersDAO.save(deleteOrder);
			model.addAttribute("message", "Xóa đơn hàng thành công!");
			order.setId(null);
			order.setAccount(null);
			order.setPhone(null);
			order.setOrderDate(new Date());
			order.setIsActive(true);
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "orders-management";
	}
	
	@GetMapping("/details")
	public String getDetails(Model model, @RequestParam("id") Integer id, @ModelAttribute("order") Orders order,
			@RequestParam("p") Optional<Integer> p) {
		if (ordersDAO.findById(id).isEmpty())
			return "redirect:/admin/orders-management";
		else {
			Orders editOrder = ordersDAO.findById(id).get();
			order.setId(id);
			order.setAccount(editOrder.getAccount());
			order.setOrderDate(editOrder.getOrderDate());
			order.setPhone(editOrder.getPhone());
			order.setIsActive(editOrder.getIsActive());
			model.addAttribute("details", orderDetailDAO.findAllByOrder(editOrder));
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		Page<Orders> orders = ordersDAO.findAll(page);
		model.addAttribute("page", orders);
		return "orders-management";
	}
}
