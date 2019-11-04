package TST_teamproject.user.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import TST_teamproject.user.model.UserVo;
import TST_teamproject.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	BCryptPasswordEncoder cipal = new BCryptPasswordEncoder();
	
	//10.18
	@GetMapping(value = "/test")
	public String test(Model model) {
		return "/test";
	}
	
	//10.20
	//수정
	@RequestMapping(value = "/login" , method= {RequestMethod.GET})
	public String login(Model model) {
		return "/login";
	}
	
	//11.01
	@RequestMapping(value = "/signUp" , method= {RequestMethod.GET})
	public String signUp(Model model) {
		return "/signUp";
	}
	
	//10.28
	@RequestMapping(value = "/overlapName" , method= {RequestMethod.GET})
	@ResponseBody
	public int overlapName(UserVo vo) {
		return service.overlapName(vo);
	}
	
	//11.04
	@RequestMapping(value = "/page" , method= RequestMethod.GET)
	@ResponseBody
	public int page(UserVo vo) {
		vo.setTst_user_pw(cipal.encode(vo.getTst_user_pw()));
		service.insertUser(vo);
		return 999;
	}
	
}
