package com.store;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CustConfig implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/mainImages/**").addResourceLocations("/images/main/");
		registry.addResourceHandler("/questionFile/**").addResourceLocations("/images/questionFile/");
	}
}
