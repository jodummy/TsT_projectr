package TST_teamproject.user.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import TST_teamproject.team.model.TeamVo;
import TST_teamproject.user.model.MessageVo;
import TST_teamproject.user.model.UserVo;
import TST_teamproject.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	BCryptPasswordEncoder cipal = new BCryptPasswordEncoder();
	
	//10.18
	@GetMapping(value = "/test")
	public String test() {
		return "/test";
	}
	
	//10.20
	//수정
	@RequestMapping(value = "/login" , method= {RequestMethod.GET})
	public String login() {
		return "/login";
	}
	
	//11.01
	@RequestMapping(value = "/signUp" , method= {RequestMethod.GET})
	public String signUp() {
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
	
	//11.07
	@RequestMapping(value = "/mailList" , method= {RequestMethod.GET})
	public String mailList(Principal principal, Model model) {
		model.addAttribute("mailList",service.listtMessageTo(principal.getName()));
		model.addAttribute("count",service.countMail(principal.getName()));
		return "user.mailList";
	}
	
	//11.10
	@RequestMapping(value = "/UserMailDetail" , method= {RequestMethod.GET})
	public String UserMailDetail(Model model, MessageVo vo) {
		System.out.println(vo.getTst_message_no());
//		model.addAttribute("mailDetail",service.detailMessageTo(vo.getTst_message_no()));
		return "user.mailDetail";
	}
	
	//11.17
	@RequestMapping(value = "/headerList" , method= RequestMethod.GET)
	@ResponseBody
	public List<MessageVo> headerList(@RequestParam("tst_user_nickname") String tst_user_nickname) {
		return service.HeaderListtMessageTo(tst_user_nickname);
	}
	
	//11.18
	@RequestMapping(value = "/countMailCheck" , method= RequestMethod.GET)
	@ResponseBody
	public int countMailCheck(@RequestParam("tst_user_nickname") String tst_user_nickname) {
		return service.countMailCheck(tst_user_nickname);
	}
	
	//11.18
	@RequestMapping(value = "/updateMailCheck" , method= RequestMethod.GET)
	@ResponseBody
	public void updateMailCheck(@RequestParam("tst_message_no") String tst_message_no) {
		service.updateMailCheck(Integer.parseInt(tst_message_no));
	}
	
	//11.18
	@RequestMapping(value = "/insertMessage" , method= {RequestMethod.GET})
	public String insertMessage(MessageVo vo, Principal cipal) {
		vo.setTst_from_nicname(cipal.getName());
		System.out.println(vo.toString());
		service.insertMail(vo);
		return "redirect:mailList";
	}
	
	
}
