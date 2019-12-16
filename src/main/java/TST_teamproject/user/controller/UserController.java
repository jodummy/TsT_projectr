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

import TST_teamproject.team.model.MatchingAcceptVo;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.team.service.TeamService;
import TST_teamproject.user.model.MessageVo;
import TST_teamproject.user.model.UserVo;
import TST_teamproject.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	@Autowired 
	TeamService teamService;
	BCryptPasswordEncoder cipal = new BCryptPasswordEncoder();
	
	//10.18
	@GetMapping(value = "/test")
	public String test() {
		return "/test";
	}
	
	//10.20
	//수정
	@RequestMapping(value = "/login" , method={ RequestMethod.GET, RequestMethod.POST })
	public String login(Model model) {
		model.addAttribute("key", 2 );
		return "/login";
	}
	
	//11.01
	@RequestMapping(value = "/signUp" , method= { RequestMethod.GET, RequestMethod.POST })
	public String signUp() {
		return "/signUp";
	}
	
	//10.28
	@RequestMapping(value = "/overlapName" , method= { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int overlapName(UserVo vo) {
		return service.overlapName(vo);
	}
	
	//11.04
	@RequestMapping(value = "/page" , method={ RequestMethod.GET, RequestMethod.POST })
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
	   vo.setTst_message_category("F");
	   service.insertMail(vo);
	   return "redirect:mailList";
	}
	
	//11.18 수정
	@RequestMapping(value = "/insertMessageT" , method= RequestMethod.GET)
	@ResponseBody
	public void insertMessage(TeamVo vo, @RequestParam("tst_from_nicname") String tst_from_nicname) {
	
	   vo=teamService.teamFindOne(vo.getTst_team_no());
	   MessageVo messageVo = new MessageVo();
	   messageVo.setTst_to_nicname(vo.getTst_user_nickname());
	   messageVo.setTst_from_nicname(tst_from_nicname);
	   messageVo.setTst_message_title(vo.getTst_team_name() +"팀 신청 드립니다");
	   messageVo.setTst_message_content("잘 부탁드립니다");
	   messageVo.setTst_message_category("T");
	
	   service.insertMail(messageVo);
	}
	
	//매칭 신청
	@RequestMapping(value = "/insertMessageC" , method= RequestMethod.GET)
	@ResponseBody
	public void insertMessageC(@RequestParam("tst_team_no") String tst_team_no,@RequestParam("myTeamNo") String myTeamNo) {
	   //상대팀 정보
	   TeamVo vo=teamService.teamFindOne(Integer.parseInt(tst_team_no));
	   //내팀 정보
	   TeamVo vo2 = teamService.teamFindOne(Integer.parseInt(myTeamNo));
	   
	  
		MatchingAcceptVo matchingAcceptVo = new MatchingAcceptVo();
		matchingAcceptVo.setTst_my_team_no(Integer.parseInt(myTeamNo));
		matchingAcceptVo.setTst_your_team_no(Integer.parseInt(tst_team_no));
		teamService.insertAccept(matchingAcceptVo);
		
	   MessageVo messageVo = new MessageVo();
	   
	   messageVo.setTst_to_nicname(vo.getTst_user_nickname());
	   messageVo.setTst_from_nicname(vo2.getTst_user_nickname());
	   messageVo.setTst_message_title(vo2.getTst_team_name() +"경기 신청합니다.");
	   messageVo.setTst_message_content("잘 부탁드립니다.=>"+vo.getTst_team_name());
	   messageVo.setTst_message_category("C");
	   service.insertMail(messageVo);
	   
	   //여기서 디비 세팅을 해야해 넣어야지
	}
	
	
	//11.26 인증메일 보냈다는 페이지
	@RequestMapping(value = "/emailCheck" , method= { RequestMethod.GET, RequestMethod.POST })
	public String email(Model model, UserVo vo) {
		model.addAttribute("key", 1 );
		service.updateUserAuthority(vo);
		return "/login";
	}
	
	//11.19 
	@RequestMapping(value = "/addMember" , method= {RequestMethod.GET})
	public String addMember(Principal cipal, @RequestParam("tst_from_nicname") String tst_from_nicname,@RequestParam("tst_message_title") String tst_message_title) {
	   //swichTeamname 팀번호 & 팀장이름 -> id에 넣어줘 ->TeamVo
	   //addMember 보낸 사람 이름 권한1 1
	   TeamVo tVo = teamService.swichTeamname(tst_message_title);
	   teamService.addMember(new MemberVo(tVo.getTst_team_no(), tst_from_nicname, tVo.getTst_user_nickname(), 1, 1));
	   return "redirect:mailList";
	}
	
	@RequestMapping(value = "/maching" , method= {RequestMethod.GET})
	public String maching(@RequestParam("tst_from_nicname") String tst_from_nicname,@RequestParam("tst_message_title") String tst_your_title ,@RequestParam("tst_my_team") String tst_my_team) {
		TeamVo yourVo = teamService.swichTeamname(tst_my_team);
		TeamVo myVo = teamService.swichTeamname(tst_your_title);
		MatchingAcceptVo vo = new MatchingAcceptVo();

		vo.setTst_my_team_no(myVo.getTst_team_no());
		vo.setTst_your_team_no(yourVo.getTst_team_no());
		teamService.updateAccept(vo);
	   return "redirect:mailList";
	}
	
	
}
