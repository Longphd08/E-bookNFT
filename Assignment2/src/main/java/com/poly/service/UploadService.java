package com.poly.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.validation.constraints.AssertFalse.List;

@Service
public class UploadService {
	@Autowired
	ServletContext app;
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
