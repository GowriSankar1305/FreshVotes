package com.jocata.boot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String rootView()	{
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String getLoginPage(Model model 
			,@RequestParam(required = false) String logout
			,@RequestParam(required = false) String expired 
			,@RequestParam(required = false) String error
			,@RequestParam(required = false) String invalid)		{
		if (logout != null) model.addAttribute("logout", "Logout Successful");
		if (error != null) model.addAttribute("error", "Invalid Username and Password");
		if (expired != null) model.addAttribute("timeout", "Session Expired. Please Login Again");
		if (expired != null) model.addAttribute("invalid", "Invalid Session. Login Again");
		logger.info("control reached to login page****************");
		return "signin";
	}
}
