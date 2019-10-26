package TST_teamproject.team.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import TST_teamproject.team.model.TeamVo;
import TST_teamproject.team.service.TeamService;

@Controller
public class TeamController {
	
	@Autowired TeamService teamService;
	
	/**
	 * 팀 목록 띄우기
	 * 10.25
	 * @return
	 */
	@RequestMapping(value = "/teamList")
	public String teamList(Model model,Principal principal) {
		model.addAttribute("teamList",teamService.teamList());
		System.out.println(principal.getName());
		return "team.list";
	}
}
