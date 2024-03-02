package com.poly.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
import org.springframework.web.multipart.MultipartFile;

import com.poly.Const;
import com.poly.dao.AuthorDAO;
import com.poly.dao.BookDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.PublisherDAO;
import com.poly.entity.Author;
import com.poly.entity.Book;
import com.poly.entity.Category;
import com.poly.entity.Publisher;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.service.UploadService;

import jakarta.servlet.ServletContext;
import jakarta.validation.Constraint;

@Controller
@RequestMapping("/admin/book-management")
public class BookController {

	@Autowired
	SessionService sessionService;
	@Autowired
	BookDAO bookDAO;
	@Autowired
	ServletContext app;
	@Autowired
	UploadService uploadService;

	@RequestMapping("")
	public String getAccountManagement(Model model, @ModelAttribute("book") Book book,
			@RequestParam("p") Optional<Integer> p) {
		book.setId(null);
		book.setTitle("");
		book.setPrice(1.0);
		book.setQty(1);
		book.setIntroduction("");
		book.setPicturePath("");
		book.setContentPath("");
		book.setAuthor(null);
		book.setCategory(null);
		book.setPublisher(null);
		book.setIsActive(true);
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", bookDAO.findAll(page));
		return "book-management";
	}

	@GetMapping("/search")
	public String page(Model model, @ModelAttribute("book") Book book, @RequestParam("p") Optional<Integer> p, @RequestParam("q") Optional<String> q) {
		String qString = q.orElse("");
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", bookDAO.findAllByTitleLike("%"+qString+"%",page));
		model.addAttribute("q", qString);
		return "book-management";
	}

	@PostMapping("/create")
	public String postCreate(Model model, @Validated @ModelAttribute("book") Book book, BindingResult bindingResult,
			@RequestParam("introductionFile") MultipartFile introductionFile,
			@RequestParam("pictureFile") MultipartFile pictureFile,
			@RequestParam("contentFile") MultipartFile contentFile, @RequestParam("p") Optional<Integer> p) {
		if (!introductionFile.isEmpty()) {
			if (!pictureFile.isEmpty()) {
				if (!contentFile.isEmpty()) {
					if (!bookDAO.findByTitle(book.getTitle()).isEmpty()) {
						Book updateBook = bookDAO.findByTitle(book.getTitle()).get(0);
						updateBook.setQty(updateBook.getQty() + book.getQty());
						bookDAO.save(updateBook);
						model.addAttribute("message", "Cập nhật số lượng thành công");
					} else {
						uploadService.save(pictureFile, "/views/img/category/");
						uploadService.save(contentFile, "/views/content/");
						uploadService.save(introductionFile,"/views/intro/");
						String pictureName = StringUtils.cleanPath(pictureFile.getOriginalFilename());
						String contentName = StringUtils.cleanPath(contentFile.getOriginalFilename());
						String introName = StringUtils.cleanPath(introductionFile.getOriginalFilename());
						book.setPicturePath(pictureName);
						book.setContentPath(contentName);
						book.setIntroduction(introName);
						if (bindingResult.hasErrors()) {
							model.addAttribute("message", "Vui lòng sửa các lỗi sau:");

						} else {
							bookDAO.save(book);
							model.addAttribute("message", "Thêm mới thành công!");
						}
					}

				} else
					model.addAttribute("message", "Vui lòng chọn file content");

			} else
				model.addAttribute("message", "Vui lòng chọn ảnh");

		} else
			model.addAttribute("message", "Vui lòng chọn file giới thiệu");

		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", bookDAO.findAll(page));
		return "book-management";
	}

	@PostMapping("/update")
	public String postUpdate(Model model, @Validated @ModelAttribute("book") Book book, BindingResult bindingResult,
			@RequestParam("introductionFile") MultipartFile introductionFile,
			@RequestParam("pictureFile") MultipartFile pictureFile,
			@RequestParam("contentFile") MultipartFile contentFile, @RequestParam("p") Optional<Integer> p) {
		if (!introductionFile.isEmpty()) {
			if (!pictureFile.isEmpty()) {
				if (!contentFile.isEmpty()) {
					if (!bookDAO.findByTitle(book.getTitle()).isEmpty()) {
						uploadService.save(pictureFile, app.getRealPath("/views/img/category/"));
						uploadService.save(contentFile, app.getRealPath("/views/content/"));
						uploadService.save(introductionFile, app.getRealPath("/views/intro/"));
						String pictureName = StringUtils.cleanPath(pictureFile.getOriginalFilename());
						String contentName = StringUtils.cleanPath(contentFile.getOriginalFilename());
						String introName = StringUtils.cleanPath(introductionFile.getOriginalFilename());
						book.setPicturePath(pictureName);
						book.setContentPath(contentName);
						book.setIntroduction(introName);
						if (bindingResult.hasErrors()) {
							model.addAttribute("message", "Vui lòng sửa các lỗi sau:");

						} else {
							bookDAO.save(book);
							model.addAttribute("message", "Cập nhật thành công!");
						}
					}else {
						model.addAttribute("message", "Mã sách không tồn tại!");
					}

				} else
					model.addAttribute("message", "Vui lòng chọn file");

			} else {
				model.addAttribute("message", "Vui lòng chọn file");
			}

		} else {
			model.addAttribute("message", "Vui lòng chọn file");
		}

		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", bookDAO.findAll(page));
		return "book-management";
	}

	@GetMapping("/edit")
	public String getEdit(Model model, @RequestParam("id") Integer id, @ModelAttribute("book") Book book,
			@RequestParam("p") Optional<Integer> p) {
		if (bookDAO.findById(id).isEmpty())
			return "redirect:/admin/book-management";
		else {
			Book editBook = bookDAO.findById(id).get();
			book.setTitle(editBook.getTitle());
			book.setPrice(editBook.getPrice());
			book.setQty(editBook.getQty());
			book.setIntroduction(editBook.getIntroduction());
			book.setPicturePath(editBook.getPicturePath());
			book.setContentPath(editBook.getContentPath());
			book.setAuthor(editBook.getAuthor());
			book.setCategory(editBook.getCategory());
			book.setPublisher(editBook.getPublisher());
			book.setIsActive(editBook.getIsActive());
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", bookDAO.findAll(page));
		return "book-management";
	}

	@PostMapping("/delete")
	public String postDelete(Model model, @RequestParam("id") Integer id, @ModelAttribute("book") Book book,
			@RequestParam("p") Optional<Integer> p) {
		if (bookDAO.findById(id).isEmpty())
			model.addAttribute("message", "Tài khoản không tồn tại!");
		else {
			Book deleteBook = bookDAO.findById(id).get();
			deleteBook.setIsActive(false);
			bookDAO.save(deleteBook);
			model.addAttribute("message", "Xóa tài khoản thành công!");
			book.setId(null);
			book.setTitle("");
			book.setPrice(1.0);
			book.setQty(1);
			book.setIntroduction("");
			book.setPicturePath("");
			book.setContentPath("");
			book.setAuthor(null);
			book.setCategory(null);
			book.setPublisher(null);
			book.setIsActive(true);
		}
		Pageable page = PageRequest.of(p.orElse(0), 5);
		model.addAttribute("page", bookDAO.findAll(page));
		return "book-management";
	}

}
