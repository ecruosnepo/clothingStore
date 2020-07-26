package com.store;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {		
        //이미지 업로드를 위한 경로
        registry.addResourceHandler("/images/**")
        		.addResourceLocations("/resources/images/");
        registry.addResourceHandler("/css/**")
		.addResourceLocations("/resources/css/");
    }
}