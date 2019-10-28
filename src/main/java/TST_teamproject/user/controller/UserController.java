package TST_teamproject.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import TST_teamproject.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@GetMapping(value = "/test")
	public String test(Model model) {
		model.addAttribute("user",service.readUser("coco12"));
		System.out.println(service.readAuthority("coco12").toString());
		model.addAttribute("auth",service.readAuthority("coco12"));
		
		return "/test";
	}
	
	@RequestMapping(value = "/login" , method= {RequestMethod.GET})
	public String login(Model model) {
		return "/login";
	}
	
	
	@RequestMapping(value = "/signUp" , method= {RequestMethod.GET})
	public String signUp(Model model) {
		return "/signUp";
	}
	
}
