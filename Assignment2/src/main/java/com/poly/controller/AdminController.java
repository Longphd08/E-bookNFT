/**
 * 
 */
package com.poly.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.Const;
import com.poly.dao.AccountDAO;
import com.poly.dao.AdminDAO;
import com.poly.dao.AuthorDAO;
import com.poly.dao.BookDAO;
import com.poly.dao.BooksOfAccountDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.OrdersDAO;
import com.poly.dao.PublisherDAO;
import com.poly.entity.Admin;
import com.poly.entity.Orders;
import com.poly.service.SessionService;
import jakarta.servlet.ServletContext;

/**
 * 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {


	@Autowired
	BookDAO bookDAO;
	@Autowired
	AuthorDAO authorDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	PublisherDAO publisherDAO;
	@Autowired
	SessionService sessionService;
	@Autowired
	AdminDAO dao;
	@Autowired
	ServletContext app;
	@Autowired
	OrdersDAO ordersDAO;

	@GetMapping("/loggout")
	public String getLoggout() {
		sessionService.removeAttribute(Const.ACCOUNT);
		return "redirect:/user/login";
	}

	@GetMapping("/personalInfo")
	public String getPersonalInfo() {
		return "index-admin";
	}
	
	@GetMapping("")
	public String getIndex(Model model) {
		model.addAttribute("reportIncome", categoryDAO.getReportIncomes());
		List<Orders> orderss = ordersDAO.findAll();
		model.addAttribute("oder", orderss);
		return "index-admin";
	}

	@RequestMapping("/admin-management")
	public String getAccountManagement(Model model, @ModelAttribute("admin") Admin admin,
			@RequestParam("p") Optional<Integer> p) {
		admin.setId(null);
		admin.setUsername("");
		admin.setPassword("");
		admin.setFullname("");
		admin.setEmail("");
		admin.setPhone("");
		admin.setBirthday(new Date());
		admin.setIdentityNumber("");
		admin.setAvatar("avatar.jpg");
		admin.setIsActive(true);
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "admin-management";
	}

	@GetMapping("/admin-management/page")
	public String page(Model model, @ModelAttribute("admin") Admin admin, @RequestParam("p") Optional<Integer> p) {
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "admin-management";
	}

	@PostMapping("/admin-management/create")
	public String postCreate(Model model, @Validated @ModelAttribute("admin") Admin admin, BindingResult bindingResult,
			@RequestParam("file") MultipartFile avatar, @RequestParam("p") Optional<Integer> p) {
		if (!avatar.isEmpty() || !admin.getAvatar().equals("")) {
			if (!dao.findByEmail(admin.getEmail()).isEmpty()) {
				model.addAttribute("message", "Tài khoản đã tồn tại");
			} else {
				String fileName = StringUtils.cleanPath(avatar.getOriginalFilename());
				try {
					Path path = Paths.get(app.getRealPath("/views/images/avatar/" + fileName));
					Files.copy(avatar.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					admin.setAvatar(fileName);
					if (bindingResult.hasErrors()) {
						model.addAttribute("message", "Vui lòng sửa các lỗi sau:");

					} else {
						dao.save(admin);
						model.addAttribute("message", "Thêm mới thành công!");
					}

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		} else {
			model.addAttribute("message", "Vui lòng chọn avatar");
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "admin-management";
	}

	@PostMapping("/admin-management/update")
	public String postUpdate(Model model, @Validated @ModelAttribute("admin") Admin admin, BindingResult bindingResult,
			@RequestParam("file") MultipartFile avatar, @RequestParam("page") Optional<Integer> p) {
		if (!admin.getAvatar().equals("")) {
			String fileName;
			if (!avatar.isEmpty()) {
				fileName = StringUtils.cleanPath(avatar.getOriginalFilename());
			} else {
				fileName = admin.getAvatar();
			}
			try {
				Path path = Paths.get(app.getRealPath("/views/images/avatar/" + fileName));
				Files.copy(avatar.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				admin.setAvatar(fileName);
				if (!bindingResult.hasErrors()) {
					if (dao.findById(admin.getId()).isEmpty()) {
						model.addAttribute("message", "Tài khoản không tồn tại!");
					} else {
						Admin acc = dao.findById(admin.getId()).get();
						acc.setPassword(admin.getPassword());
						acc.setFullname(admin.getFullname());
						acc.setPhone(admin.getPhone());
						acc.setBirthday(admin.getBirthday());
						acc.setIsActive(admin.getIsActive());
						acc.setAvatar(fileName);
						if (dao.findByIdOrUsername(acc.getId(), admin.getUsername()).size() <= 1) {
							// If the username exist
							if (dao.findByIdOrEmail(acc.getId(), admin.getEmail()).size() <= 1) {
								// If email exist
								if (dao.findByIdOrIdentityNumber(acc.getId(), admin.getIdentityNumber()).size() <= 1) {
									// If identity number exist
									acc.setUsername(admin.getUsername());
									acc.setEmail(admin.getEmail());
									acc.setIdentityNumber(admin.getIdentityNumber());
									dao.save(acc);
									model.addAttribute("message", "Cập nhật thành công!");
								} else {
									model.addAttribute("message", "Mã định danh đã tồn tại!");
								}
							} else {
								model.addAttribute("message", "Email đã tồn tại!");
							}

						} else {
							model.addAttribute("message", "Tên tài khoản đã tồn tại!");
						}
					}
				} else {
					model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			model.addAttribute("message", "Vui lòng chọn avatar!");
		}

		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "admin-management";
	}

	@GetMapping("/admin-management/edit")
	public String getEdit(Model model, @RequestParam("id") Integer id, @ModelAttribute("admin") Admin admin,
			@RequestParam("p") Optional<Integer> p) {
		if (dao.findById(id).isEmpty())
			return "redirect:/admin/admin-management";
		else {
			Admin acc = dao.findById(id).get();
			admin.setId(acc.getId());
			admin.setUsername(acc.getUsername());
			admin.setPassword(acc.getPassword());
			admin.setFullname(acc.getFullname());
			admin.setEmail(acc.getEmail());
			admin.setPhone(acc.getPhone());
			admin.setBirthday(acc.getBirthday());
			admin.setIdentityNumber(acc.getIdentityNumber());
			admin.setIsActive(acc.getIsActive());
			admin.setAvatar(acc.getAvatar());
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "admin-management";
	}

	@PostMapping("/admin-management/delete")
	public String postDelete(Model model, @RequestParam("id") Integer id, @ModelAttribute("admin") Admin admin,
			@RequestParam("p") Optional<Integer> p) {
		if (dao.findById(id).isEmpty())
			model.addAttribute("message", "Tài khoản không tồn tại!");
		else {
			Admin acc = dao.findById(id).get();
			acc.setIsActive(false);
			dao.save(acc);
			model.addAttribute("message", "Xóa tài khoản thành công!");
			admin.setId(null);
			admin.setUsername("");
			admin.setPassword("");
			admin.setFullname("");
			admin.setEmail("");
			admin.setPhone("");
			admin.setBirthday(new Date());
			admin.setIdentityNumber("");
			admin.setAvatar("avatar.jpg");
			admin.setIsActive(true);
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "admin-management";
	}

}
