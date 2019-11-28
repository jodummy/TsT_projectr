package TST_teamproject.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import TST_teamproject.team.model.TeamVo;
import TST_teamproject.team.service.TeamService;
import TST_teamproject.user.service.UserService;

@Controller
@EnableAutoConfiguration
public class MainController {

	@Autowired
	TeamService teamService;

	@RequestMapping(value = "/")
	public String blank(Model model) {
		List<TeamVo> tVo = teamService.selectMainTeam();
		
			model.addAttribute("teamLsit0", tVo.get(0));
		
		
		return "blank.test";
	}

}
