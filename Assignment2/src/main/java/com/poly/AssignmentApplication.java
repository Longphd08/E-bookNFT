/**
 * 
 */
package com.poly;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.Duration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.devtools.autoconfigure.DevToolsProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;

/**
 * 
 */
@SpringBootApplication
@EnableScheduling
public class AssignmentApplication {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpringApplication.run(AssignmentApplication.class, args);

//		try {
//				
//			URI uri = new URI("http://localhost:8090/home");
//			desktop.browse(uri);
//		} catch (URISyntaxException | IOException e) {
//			e.printStackTrace();
//		}

	}

}
