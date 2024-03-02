/**
 * 
 */
package com.poly.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.BookDAO;
import com.poly.entity.Book;
import com.poly.service.SessionService;

import jakarta.servlet.ServletContext;

/**
 * 
 */
@Controller
public class BookStoreController {
	@Autowired
	BookDAO bookDAO;
	@Autowired
	SessionService sessionService;
	@Autowired
	ServletContext app;

	@GetMapping("/home")
	public String getHome() {
		return "index";
	}

	@GetMapping("/category")
	public String getCategory(Model model, @ModelAttribute("book") Book book, @RequestParam("p") Optional<Integer> p) {
//		if(sessionService.getAttribute("books") != null) {
//			books = get
//		}
//		 = bookDAO.findAll();
		Pageable page = PageRequest.of(p.orElse(0), 6);
		model.addAttribute("page", bookDAO.findAllByIsActive(true, page));
		return "category";
	}

	@GetMapping("/product")
	public String getProductDetails(@RequestParam("id") Integer id, Model model) {
		String filePath = app.getRealPath("/views/intro/"+  bookDAO.findById(id).get().getIntroduction());
		Path path = Paths.get(filePath);
		byte[] bytes;
		try {
			bytes = Files.readAllBytes(path);
			String introduction = new String(bytes);

			model.addAttribute("introduction", introduction);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("book", bookDAO.findById(id).get());
		return "single-product";
	}

	@GetMapping("/contact")
	public String getContact() {
		return "contact";
	}

}
