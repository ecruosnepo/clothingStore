package com.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.store.dao.CategoryDao;
import com.store.dto.CategoryDto;
import com.store.dto.ProductDto;
import com.store.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/test")
	public String test() {
		return "products/productList";
	}
	
	@GetMapping("/productpage/{pdId}")
	public String productView(@PathVariable("pdId") int pd_id, HttpServletRequest req, Model model){
		System.out.println("상세 페이지");
		ProductDto pDto = productService.viewProduct(pd_id);
		model.addAttribute("pd_dto", pDto);		
		model.addAttribute("colorList",productService.getColorList(pDto.getPd_name()));
		
		return "products/productPage";
	}
	
	@GetMapping("/productList/{catRefId}/{catId}")
    public String productListView(@PathVariable("catId") int cat, @PathVariable("catRefId") int catRef, Model model) throws Exception {
        model.addAttribute("pd_list", productService.listProduct(cat));
        
        return "products/productList";
	}
		
	@RequestMapping("/regProductForm")
	public String regProductForm(Model model) {
		System.out.println("상품 등록 폼");		
		Gson gson = new Gson();
		List<CategoryDto> allcat = categoryDao.getAllCatDao();
		model.addAttribute("allcat", gson.toJson(allcat));
		
		return "admin/regProduct";
	}
	
	@PostMapping("/regProduct")
	public String regProduct(MultipartHttpServletRequest req, ProductDto pDto, @RequestParam("mainImg") MultipartFile main, @RequestParam("subImg") MultipartFile[] sub) throws Exception {
		System.out.println("상품 등록");
		String uploadPath = req.getRealPath("/").concat("resources\\images");
		System.out.println(uploadPath);
	    String fileOriginName = "";
	    String fileMultiName = "";
	    for(int i=0; i<sub.length; i++) {
	        fileOriginName = sub[i].getOriginalFilename();
	        System.out.println("기존 파일명 : "+fileOriginName);
	        SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
	        Calendar now = Calendar.getInstance();
	        
	        //확장자명
	        String extension = fileOriginName.split("\\.")[1];
	        
	        //fileOriginName에 날짜+.+확장자명으로 저장시킴.
	        fileOriginName = formatter.format(now.getTime())+"."+extension;
	        System.out.println("변경된 파일명 : "+fileOriginName);
	        
	        File f = new File(uploadPath+"/"+fileOriginName);
	        sub[i].transferTo(f);
	        if(i==0) { fileMultiName += fileOriginName; }
	        else{ fileMultiName += ","+fileOriginName; }
	    }
	    System.out.println("*"+fileMultiName);
	    pDto.setPd_img(fileMultiName);
	    
	    productService.regProduct(pDto);
	    
	    String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
	}
}
