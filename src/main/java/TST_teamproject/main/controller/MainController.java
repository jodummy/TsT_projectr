package TST_teamproject.main.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import TST_teamproject.Board.model.BoardVo;
import TST_teamproject.Board.service.BoardService;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.team.service.TeamService;
import TST_teamproject.user.service.UserService;

@Controller
@EnableAutoConfiguration
public class MainController {

	 @Autowired
	   TeamService teamService;
	   @Autowired
	   BoardService service;
	   @Autowired
	   UserService userService;
	   
	//   12.04 내 게시물 리스트 (유진 수정)
	   @RequestMapping(value = "/")
	   public String blank(Model model, BoardVo BoardVo, Principal principal) throws Exception {
//	      List<TeamVo> vo = teamService.selectMainTeam();
//	      model.addAttribute("mainList0",vo.get(0));
//	      model.addAttribute("mainList1",vo.get(1));
//	      model.addAttribute("mainList2",vo.get(2));
//	      model.addAttribute("mainList3",vo.get(3));
	      model.addAttribute("MyList", service.boardMyList(principal.getName()));
	      model.addAttribute("MyPage", userService.myPage(principal.getName()));
	      return "blank.test";
	   }

	@RequestMapping(value = "/TsT")
	public String TsT() {
		return "TsT";
	}
	

	@RequestMapping(value = "/Maps")
	public String maps() {
		return "maps";
	}
	
}
