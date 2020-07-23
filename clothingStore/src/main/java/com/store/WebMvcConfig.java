package com.store;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
 
	private static final String CLASSPATH_RESOURCE_LOCATIONS = "C:/Study/";
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {		
    	registry.addResourceHandler("/images/**").addResourceLocations("file:///C:/Study/Images/");
    } 
}