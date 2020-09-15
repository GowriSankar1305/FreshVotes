package com.jocata.boot.controller;

import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jocata.boot.entity.User;
import com.jocata.boot.service.UserService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String rootView()	{
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String getLoginPage(Model model 
			,@RequestParam(required = false) String logout
			,@RequestParam(required = false) String expired 
			,@RequestParam(required = false) String error
			,@RequestParam(required = false) String invalid
			,@RequestParam(required = false) String signup)		{
		if (logout != null) model.addAttribute("logout", "Logout Successful");
		if (error != null) model.addAttribute("error", "Invalid Username and Password");
		if (expired != null) model.addAttribute("timeout", "Session Expired. Please Login Again");
		if (expired != null) model.addAttribute("invalid", "Invalid Session. Login Again");
		if (signup != null) model.addAttribute("signup", signup);
		return "signin";
	}
	
	@RequestMapping(value = "/dashboard",method = RequestMethod.GET)
	public String getDashboard()	{
		return "redirect:/user/create-product";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String getRegistrationPage(Model errorModel)	{
		logger.info("::signUpError-->> {}",errorModel.asMap().get("signUpError"));
		return "signup";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String saveUser(@ModelAttribute User user,RedirectAttributes redirectAttributes)	{
		logger.info("****** Start of MainController.saveUser *****");
		logger.info("::user---> {}",user.toString());
		String pwd = user.getPassword(),confrmPwd = user.getConfirmPassword();
		if (Objects.isNull(pwd) || Objects.isNull(confrmPwd) && !pwd.equals(confrmPwd))	{
			redirectAttributes.addFlashAttribute("signUpError", "Passwords are not matching");
			return "redirect:/register";
		}
		userService.saveUser(user);
		logger.info("****** End of MainController.saveUser *****");
		return "redirect:/login?signup=Registration Succesful...";
	}
	
	@RequestMapping(value = "/validateEmail",method = RequestMethod.POST)
	@ResponseBody public Boolean checkEmail(@RequestParam(name = "email") String emailId)	{
		logger.info("::EmailId---> {}",emailId);
		boolean result = userService.isUserExists(emailId);
		logger.info("::result--->> {}",result);
		return result;
	}
	
	@RequestMapping(value = "/validateUname",method = RequestMethod.POST)
	@ResponseBody public Boolean checkUserName(@RequestParam(name = "uname") String uname)	{
		logger.info("::UserNAme---> {}",uname);
		boolean result = userService.isUserExistsByUname(uname);
		logger.info("::result--->> {}",result);
		return result;
	}
}
