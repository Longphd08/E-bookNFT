/**
 * 
 */
package com.poly.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

/**
 * 
 */
@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	/**
	 * Đọc chuỗi giá trị của tham số
	 * 
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public String getString(String name, String defaultValue) {
		String result = request.getParameter(name);
		return result != null ? result : defaultValue;
	}

	/**
	 * Đọc số nguyên giá trị của tham số
	 * 
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public int getInt(String name, int defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Integer.parseInt(result) : defaultValue;
	}

	/**
	 * Đọc số thực giá trị của tham số
	 * 
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public double getDouble(String name, double defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Double.parseDouble(result) : defaultValue;
	}

	/**
	 * Đọc giá trị boolean của tham số
	 * 
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public boolean getBoolean(String name, boolean defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Boolean.parseBoolean(result) : defaultValue;
	}

	/**
	 * Đọc giá trị thời gian của tham số
	 * 
	 * @param name tên tham số
	 * @param pattern là định dạng thời gian
	 * @return giá trị tham số hoặc null nếu không tồn tại
	 * @throws RuntimeException lỗi sai định dạng
	 */
	public Date getDate(String name, String pattern) {
		try {
			SimpleDateFormat formater = new SimpleDateFormat(pattern);
			return formater.parse(request.getParameter(name));
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Lưu file upload vào thư mục
	 * 
	 * @param file chứa file upload từ client
	 * @param path đường dẫn tính từ webroot
	 * @return đối tượng chứa file đã lưu hoặc null nếu không có file upload
	 * @throws RuntimeException lỗi lưu file
	 */
	/**
	    * Save the file to the specific folder 
	    *
	    * @param file   the file you want to save
	    * @param folder the folder you want to save (this folder is inside the webapp folder)
	    * @return File  file
	    */
	public File save (MultipartFile file, String folder) {
		
		File dir = new File(app.getRealPath(folder));
		if (!dir.exists()) {
			dir.mkdir();
		}
		try {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			Path path = Paths.get(app.getRealPath(folder)+fileName);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			return path.toFile();
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
}
