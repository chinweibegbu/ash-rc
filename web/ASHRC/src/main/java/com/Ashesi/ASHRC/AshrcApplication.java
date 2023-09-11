package com.Ashesi.ASHRC;

// import java.util.HashMap;
// import java.util.Map;

// import com.cloudinary.Cloudinary;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
// import org.springframework.context.annotation.Bean;


@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
// @SpringBootApplication
public class AshrcApplication {

	public static void main(String[] args) {
		SpringApplication.run(AshrcApplication.class, args);

	}

	// @Bean
    // public Cloudinary cloudinaryConfig() {
	// 	String cloudName = "ash-rc";
	// 	String apiKey = "785881943333915";
	// 	String apiSecret = "pS-WW1Mv1JB0dmSaX-15KRNjNd4";

    //     Cloudinary cloudinary = null;
    //     Map config = new HashMap();
    //     config.put("cloud_name", cloudName);
    //     config.put("api_key", apiKey);
    //     config.put("api_secret", apiSecret);
    //     cloudinary = new Cloudinary(config);
    //     return cloudinary;
    // }


}
