package com.poly.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Optional;

import org.spongycastle.crypto.prng.drbg.SP80090DRBG;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.poly.Const;
import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.SessionService;

import jakarta.servlet.ServletContext;

@Controller
@RequestMapping("/admin/account-management")
public class AccountController {

	@Autowired
	ServletContext app;
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService service;

	@RequestMapping("")
	public String getAccountManagement(Model model, @ModelAttribute("account") Account account,
			@RequestParam("p") Optional<Integer> p) {
		account.setFullname("");
		account.setEmail("");
		account.setPassword("");
		account.setAvatar("avatar.jpg");
		account.setIsActive(true);
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "account-management";
	}

	@GetMapping("/search")
	public String page(Model model, @ModelAttribute("account") Account account,
			@RequestParam("p") Optional<Integer> p, @RequestParam("q") Optional<String> q) {
		String qString = q.orElse("");
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAllByFullnameLike("%"+qString+"%",page));
		model.addAttribute("q", qString);
		return "account-management";
	}

	@PostMapping("/create")
	public String postCreate(Model model, @Validated @ModelAttribute("account") Account account,
			BindingResult bindingResult, @RequestParam("file") MultipartFile avatar,
			@RequestParam("p") Optional<Integer> p) {
		if (!avatar.isEmpty() || !account.getAvatar().equals("")) {
			if (!dao.findByEmail(account.getEmail()).isEmpty()) {
				model.addAttribute("message", "Tài khoản đã tồn tại");
			} else {
				String fileName = StringUtils.cleanPath(avatar.getOriginalFilename());
				try {
					Path path = Paths.get(app.getRealPath("/views/images/avatar/" + fileName));
					Files.copy(avatar.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					account.setAvatar(fileName);
					if (bindingResult.hasErrors()) {
						model.addAttribute("message", "Vui lòng sửa các lỗi sau:");

					} else {
						dao.save(account);
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
		return "account-management";
	}

	@PostMapping("/update")
	public String postUpdate(Model model, @Validated @ModelAttribute("account") Account account,
			BindingResult bindingResult, @RequestParam("file") MultipartFile avatar,
			@RequestParam("page") Optional<Integer> p) {
		if (!account.getAvatar().equals("")) {
			String fileName;
			if (!avatar.isEmpty()) {
				fileName = StringUtils.cleanPath(avatar.getOriginalFilename());
			} else {
				fileName = account.getAvatar();
			}
			try {
				Path path = Paths.get(app.getRealPath("/views/images/avatar/" + fileName));
				Files.copy(avatar.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				account.setAvatar(fileName);
				if (!bindingResult.hasErrors()) {
					if (dao.findByEmail(account.getEmail()).isEmpty())
						model.addAttribute("message", "Tài khoản không tồn tại!");
					else {
						Account acc = dao.findByEmail(account.getEmail()).get(0);
						acc.setAvatar(fileName);
						acc.setFullname(account.getFullname());
						acc.setIsActive(account.getIsActive());
						acc.setPassword(account.getPassword());
						dao.save(acc);
						model.addAttribute("message", "Cập nhật thành công!");
					}
				} else {
					model.addAttribute("message", "Vui lòng sửa các lỗi sau:");
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			model.addAttribute("message", "Vui lòng chọn avatar");
		}

		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "account-management";
	}

	@GetMapping("/edit")
	public String getEdit(Model model, @RequestParam("email") String email, @ModelAttribute("account") Account account,
			@RequestParam("p") Optional<Integer> p) {
		if (dao.findByEmail(account.getEmail()).isEmpty())
			return "redirect:/admin/account-management";
		else {
			if (!email.equals("")) {
				Account acc = dao.findByEmail(email).get(0);
				account.setId(acc.getId());
				account.setFullname(acc.getFullname());
				account.setAvatar(acc.getAvatar());
				account.setEmail(acc.getEmail());
				account.setIsActive(acc.getIsActive());
				account.setPassword(acc.getPassword());
			}
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "account-management";
	}
	
	@PostMapping("/delete")
	public String postDelete(Model model,  @RequestParam("email") String email, @ModelAttribute("account") Account account,
			@RequestParam("p") Optional<Integer> p) {
		if (dao.findByEmail(account.getEmail()).isEmpty())
			model.addAttribute("message", "Tài khoản không tồn tại!");
		else {
			Account acc = dao.findByEmail(account.getEmail()).get(0);
			acc.setIsActive(false);
			dao.save(acc);
			model.addAttribute("message", "Xóa tài khoản thành công!");
			account.setFullname("");
			account.setEmail("");
			account.setPassword("");
			account.setIsActive(true);
			account.setAvatar("avatar.jpg");
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", dao.findAll(page));
		return "account-management";
	}
}
