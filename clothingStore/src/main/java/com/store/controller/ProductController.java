package com.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.store.FilenameSorting;
import com.store.dao.CategoryDao;
import com.store.dto.CartDto;
import com.store.dto.CartListDto;
import com.store.dto.CategoryDto;
import com.store.dto.ProductDto;
import com.store.dto.StockDto;
import com.store.service.CartService;
import com.store.service.ProductService;
import com.store.service.StockService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private CartService cartService;
	@Autowired
	private StockService stockService;
	
	@GetMapping("/productpage/{pdId}")
	public String productView(@PathVariable("pdId") int pd_id, HttpServletRequest req, Model model){
		System.out.println("상세 페이지");
		ProductDto pDto = productService.viewProduct(pd_id);
		model.addAttribute("pd_dto", pDto);		
		model.addAttribute("colorList",productService.getColorList(pDto.getPd_name()));
		model.addAttribute("stock_list", stockService.productStock(pd_id));
		
		return "products/productPage";
	}
	
	@GetMapping("/productList/{catId}")	
    public String productListView(HttpServletRequest req, @PathVariable("catId") int cat, Model model, 
    								@RequestParam(value="size[]", required = false) List<String> size, 
    								@RequestParam(value="sortby", required = false) String sortby) throws Exception {
		System.out.println("size:" + size);
    	System.out.println("sortby:" + sortby);
    	CategoryDto cDto = categoryDao.getCatDao(cat);
    	
    	if(size==null && sortby==null) {
    		sortby = "pd_id";
    		model.addAttribute("pd_list", productService.listProduct(cat, sortby));    		
    	}else{
    		if (sortby!=null && (size==null || size.get(0)=="")) {
				model.addAttribute("pd_list", productService.listProduct(cat, sortby));
   			}else {
    			model.addAttribute("pd_list", productService.listProductSize(cat,size, sortby));
    		}    		
    	}
    	model.addAttribute("cat", cDto);
    	return "products/productList";
	}
	
	@GetMapping("/searchProduct")	
    public String searchProduct(HttpServletRequest req, Model model,@RequestParam("keyword")String keyword, @RequestParam(value="size[]", required = false) List<String> size, @RequestParam(value="sortby", required = false) String sortby) throws Exception {
		System.out.println("상품 검색");
		
		if(size==null && sortby==null) {
    		model.addAttribute("pd_list", productService.listSearchProduct(keyword, size, sortby));    		
    	}else{
    		if (sortby!=null && (size==null || size.get(0)=="")) {
				model.addAttribute("pd_list", productService.listSearchProduct(keyword, size, sortby));
   			}else {
    			model.addAttribute("pd_list", productService.listSearchProduct(keyword, size, sortby));
    		}
    	}
		
		if(ObjectUtils.isEmpty(model.getAttribute("pd_list"))) {
			model.addAttribute("result", "0");
		}
		
    	return "products/search";
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
	public String regProduct(MultipartHttpServletRequest req, ProductDto pDto, @RequestParam("size") String[] size, 
							@RequestParam("stock") int[] stock , @RequestParam("img") MultipartFile[] file) throws Exception {
		System.out.println("상품 등록");
		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources\\pdImages");	
		System.out.println(uploadPath);
		SimpleDateFormat formatter;
		String extension;
		Calendar now;
		File f;
		String[] fileToString = new String[file.length];	    
	    String fileMultiName = "";
	    
	    //멀티파트파일
	    for(int i=0; i<file.length; i++) {
	    	fileToString[i] = file[i].getOriginalFilename();
	    }
	    
	    fileToString = FilenameSorting.solution(fileToString);
	    
	    for(int i=0; i<file.length; i++) {
	        formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
	        now = Calendar.getInstance();
	        
	        //확장자명
	        extension = fileToString[i].split("\\.")[1];
	        
	        //fileOriginName에 날짜+.+확장자명으로 저장시킴.
	        fileToString[i] = formatter.format(now.getTime())+"."+extension;
	        System.out.println("변경된 파일명 : "+fileToString[i]);
	        
	        f = new File(uploadPath+"/"+fileToString[i]);
	        file[i].transferTo(f);
	        if(i==0) { fileMultiName += fileToString[i]; }
	        else{ fileMultiName += ","+fileToString[i]; }
	    }
	    
	    System.out.println("*"+fileMultiName);
	    pDto.setPd_img(fileMultiName);
	    
	    productService.regProduct(pDto);
	    
	    System.out.println(pDto.getPd_name());
	    System.out.println(pDto.getPd_color());
	    
	    int pId = productService.getProductId(pDto.getPd_name(), pDto.getPd_color());
	    
	    for(int i = 0; i < stock.length; i++) {
	    	StockDto sDto = new StockDto();
	    	sDto.setPd_id(pId);
	    	sDto.setPd_size(size[i]);
	    	sDto.setPd_stock(stock[i]);
	    	stockService.addStock(sDto);
	    }
	    
	    String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@PostMapping("/updateProduct")
	public String updateProduct(MultipartHttpServletRequest req, ProductDto pDto, @RequestParam("size") String[] size, @RequestParam("stock") int[] stock , @RequestParam("img") MultipartFile[] file) throws Exception {
		System.out.println("상품 수정");
		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources\\pdImages");
		System.out.println(uploadPath);
		SimpleDateFormat formatter;
		String extension;
		Calendar now;
		File f;
		String[] fileToString = new String[file.length];	    
	    String fileMultiName = "";
	    

	    if(!file[0].isEmpty()) {
	    	String[] preFileName = (String[])req.getParameter("preImg").split("\\,");
	    	for(String pre:preFileName) {
	    		System.out.println(pre);
	    	}
	    	for(int i=0; i<preFileName.length; i++) {
	    		new File(uploadPath+"/"+preFileName[i]).delete();
	    	}
	    	
	    	//멀티파트파일
	    	for(int i=0; i<file.length; i++) {
	    		fileToString[i] = file[i].getOriginalFilename();
	    	}
	    	
	    	fileToString = FilenameSorting.solution(fileToString);
	    	
	    	for(int i=0; i<file.length; i++) {
	    		formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
	    		now = Calendar.getInstance();
	    		
	    		//확장자명
	    		extension = fileToString[i].split("\\.")[1];
	    		
	    		//fileOriginName에 날짜+.+확장자명으로 저장시킴.
	    		fileToString[i] = formatter.format(now.getTime())+"."+extension;
	    		System.out.println("변경된 파일명 : "+fileToString[i]);
	    		
	    		f = new File(uploadPath+"/"+fileToString[i]);
	    		file[i].transferTo(f);
	    		if(i==0) { fileMultiName += fileToString[i]; }
	    		else{ fileMultiName += ","+fileToString[i]; }
	    	}
	    	
	    	System.out.println("*"+fileMultiName);
	    	pDto.setPd_img(fileMultiName);
	    }else {
	    	pDto.setPd_img(req.getParameter("preImg"));
	    }
	    
	    productService.updateProduct(pDto);
	    
	    for(int i = 0; i < stock.length; i++) {
	    	StockDto sDto = new StockDto();
	    	sDto.setPd_id(pDto.getPd_id());
	    	sDto.setPd_size(size[i]);
	    	sDto.setPd_stock(stock[i]);
	    	if(ObjectUtils.isEmpty(stockService.checkStock(pDto.getPd_id(), size[i]))) {
	    		System.out.println(stockService.checkStock(pDto.getPd_id(), size[i]));
	    		stockService.updateStock(sDto);
	    	}else {
	    		System.out.println(stockService.checkStock(pDto.getPd_id(), size[i]));
	    		stockService.addStock(sDto);
	    	}
	    }
	    
	    String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
	}
		
	@PostMapping("/addCart")
	@ResponseBody
	public void addCart(HttpSession session, @RequestParam("pd_id") int pd_id, @RequestParam("pd_size") String pd_size, @RequestParam("pd_price") int pd_price) throws Exception{		
		String email = (String)session.getAttribute("email");
		CartDto checkDto = cartService.cartDuplicateCheck(email, pd_id, pd_size);
		
		if(checkDto != null) {
			System.out.println("중복");
			cartService.updateDuplicateCart(checkDto.getCart_id());
		}else {
			CartDto cDto = new CartDto();
			System.out.println(email);
			System.out.println(pd_id);
			System.out.println(pd_size);
			cDto.setUser_email(email);;
			cDto.setPd_id(pd_id);
			cDto.setPd_size(pd_size);
			cDto.setPd_quantity(1);
			cDto.setPd_price(pd_price);
			cartService.addCart(cDto);
		}
	}
	
	@GetMapping("/cart")
    public String cartView(HttpSession session, Model model) throws Exception {
        String email = (String)session.getAttribute("email");
		System.out.println(email);
		System.out.println();
        
		if(email==null) {
			model.addAttribute("result", "1");
		} else {
			model.addAttribute("cart_list", cartService.cartListView(email));
			if(ObjectUtils.isEmpty(model.getAttribute("cart_list"))) {
					model.addAttribute("result", "0");
			}
		}
        return "products/cart";
	}
	
	@PostMapping("/updateCartQuantity")
	@ResponseBody
	public Map<String, Integer> updateCartQuantity(HttpSession session, HttpServletRequest req, @Param("cart_id") int cart_id, @Param("pd_quantity") int pd_quantity) throws Exception {
		System.out.println("카트 수량 수정");
		System.out.println(cart_id + "," + pd_quantity);
		Map<String, Integer> priceMap = new HashMap<String, Integer>();
		String email = (String)session.getAttribute("email");
		
		cartService.updateQuantityCart(cart_id,pd_quantity);
		List<CartListDto> cDto = cartService.cartListView(email);
		
		int total_sum = 0;
		int price_sum = 0;
		for(CartListDto list:cDto) {
			if(list.getCart_id()==cart_id) {
				price_sum = list.getPd_price()*list.getPd_quantity();
			}
			total_sum += list.getPd_price()*list.getPd_quantity();
		}
		
		priceMap.put("pd_sum", price_sum);
		priceMap.put("total", total_sum);
		
		return priceMap;
	}
	
	@PostMapping("/updatePrice")
	@ResponseBody
	public int updatePrice(HttpSession session,HttpServletRequest req, Model model) {
		System.out.println("가격 갱신");
		String email = (String)session.getAttribute("email");
		String dv_price = req.getParameter("dv_price");
		System.out.println();
		List<CartListDto> cDto = cartService.cartListView(email);
		
		int sum = 0;
		for(CartListDto list:cDto) {
			sum += list.getPd_price()*list.getPd_quantity();
		}
		
		int price = sum + Integer.parseInt(dv_price);

		return price;
	}
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public void deleteCart(HttpServletRequest req, @Param("cart_id") String cart_id) throws Exception{
		System.out.println("카트 삭제");
		System.out.println(cart_id);
		cartService.deleteCart(Integer.parseInt(cart_id));		
	}
}
