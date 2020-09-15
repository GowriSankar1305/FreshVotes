package com.jocata.boot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jocata.boot.entity.Product;
import com.jocata.boot.service.ProductService;
import com.jocata.boot.service.UserService;
import com.jocata.boot.utils.LoggedInUser;

@Controller
@RequestMapping(value = "/user/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "save-product",method = RequestMethod.POST)
	public String createProduct(@ModelAttribute Product product)	{
		logger.info("******** Start of UserController.createProduct *********");
		String userName = LoggedInUser.getLoggedInUsername();
		logger.info(":: AuthenticationPrincipal userName---> {}",userName);
		product.setUser(userService.getUserByUserName(userName));
		product.setIsPublished(false);
		productService.saveProduct(product);
		logger.info("******** End of UserController.createProduct *********");
		return "redirect:create-product";
	}
	
	@RequestMapping(value = "create-product")
	public ModelAndView getProductsPage()	{
		logger.info("******** Start of UserController.getProductsPage *********");
		String userName = LoggedInUser.getLoggedInUsername();
		logger.info(":: AuthenticationPrincipal userName---> {}",userName);
		ModelAndView mav = new ModelAndView("dashboard");
		mav.addObject("products", productService.getProductsByUserName(userName));
		logger.info("******** Start of UserController.getProductsPage *********");
		return mav;
	}
}
