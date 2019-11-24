package TST_teamproject.team.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import TST_teamproject.common.Pagination;
import TST_teamproject.common.Search;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.team.service.TeamService;
import TST_teamproject.user.model.UserVo;

@Controller
public class TeamController {
	
	@Autowired 
	TeamService teamService;
	
	Principal principal;
	/**
	 * 팀 목록
	 * 10.25
	 * @return
	 * @throws Exception 
	 */
	
//	@RequestMapping(value = "/teamList", method=RequestMethod.GET)
//	public String teamList(Model model,Principal principal, @ModelAttribute("teamVo") TeamVo teamVo) throws Exception {
//		
//		model.addAttribute("teamList",teamService.teamList());
//		model.addAttribute("count", teamService.listCount(teamVo));
//		System.out.println(principal.getName());
//		return "team.list";
//	}
	
	@RequestMapping(value="/teamList", method=RequestMethod.GET)
	public String teamList(Model model, TeamVo teamVo
			, @RequestParam(required = false, defaultValue="1") int page
			, @RequestParam(required = false, defaultValue="1") int range
			, @RequestParam(required= false) String keyword
			) throws Exception{
		
		Search search = new Search();
//		System.out.println(search.toString());
		search.setKeyword(keyword);
		int listCount = teamService.listCount(search);
		
		Pagination pagination = new Pagination();
		search.pageInfo(page, range, listCount);
//		System.out.println(pagination.toString());
		model.addAttribute("pagination", search);
		model.addAttribute("teamList", teamService.teamList(search));
		return "team.list";
	}
	/**
	 * 팀 추가
	 * 10.26
	 * @return
	 */
	@RequestMapping(value="/teamInsert")
	public String teaminsert(Principal principal, Model model, TeamVo teamVo) {
		model.addAttribute("tst_user_nickname", principal.getName());
		return"team.insert";
	}
	
	@RequestMapping(value="/teamInsertPage")
	public String teamInsertPage(Principal principal,TeamVo teamVo ) {
		teamVo.setTst_user_nickname(principal.getName());
		teamService.teamInsert(teamVo);
		return"redirect:/teamList";
	}
	@RequestMapping(value="addMember")
	public String addMember() {
		return "team.addMemberpage";
	}
	/**
	 * 10.28
	 * 팀 디테일 페이지
	 * @param model
	 * @param tst_team_no
	 * @return
	 */
	@RequestMapping(value="/teamDetailpage", method=RequestMethod.GET)
	public String teamDetailpage(Model model, @RequestParam("tst_team_no") int tst_team_no, Principal principal) {
		int score = 0;
		TeamVo teamVo = teamService.teamFindOne(tst_team_no);
		model.addAttribute("detailTeam", teamVo);
		model.addAttribute("member", teamService.memberList(tst_team_no));
		if( teamVo.getTst_team_lose() != 0 && teamVo.getTst_team_win() != 0)
			score = (teamVo.getTst_team_win()/(teamVo.getTst_team_win()+teamVo.getTst_team_lose()))*100;
		else if (teamVo.getTst_team_lose() == 0 && teamVo.getTst_team_win() != 0)
			score = 100;
		else
			score = 0;
		
		model.addAttribute("score", score);
//		model.addAttribute("login_user", principal.getName() );
//		System.out.println(teamVo.toString());
		/**
		 * 10.30 팀 멤버
		 */
//		model.addAttribute("member", teamMemberService.findTeamMember(tst_team_no));
//		if(teamMemberService.findTeamMember(tst_team_no) == null)
//			System.out.println("값없음");
//		System.out.println(teamMemberService.findTeamMember(tst_team_no));
		return"team.detailTeam";
	}
	
	/**
	 * 10.29
	 * 팀 삭제하기
	 */
	@RequestMapping(value="/delete")
	public String teamEdit(@RequestParam("tst_team_no") int tst_team_no) {
		teamService.teamDelete(tst_team_no);
		return "redirect:/teamList";
	}
	/**
	 * 11.1
	 * 팀 정보 수정하기
	 */	
	@RequestMapping(value="/teamUpdate", method=RequestMethod.GET)
	public String teamUpdate(Model model, TeamVo teamVo) {
		model.addAttribute("team", teamService.teamFindOne(teamVo.getTst_team_no()));
		model.addAttribute("member", teamService.memberList(teamVo.getTst_team_no()));
		return "team.teamUpdate";
	}
	@RequestMapping(value="/teamUpdatePage", method=RequestMethod.POST)
	public String teamUpdatePage(TeamVo teamVo, Principal principal) {
		MemberVo memberVo_1 = new MemberVo(teamVo.getTst_team_no(), principal.getName(), 1);
		MemberVo memberVo_3 = new MemberVo(teamVo.getTst_team_no(), teamVo.getTst_user_nickname(), 3);

		teamService.teamUpdate(teamVo,memberVo_1, memberVo_3);

		return"redirect:/teamList";
	}
	
	/**
	 * 11.05
	 * my team 출력
	 * @return teamvo
	 */
	@RequestMapping(value="/sideBarList", method=RequestMethod.GET)
	@ResponseBody
	public List<TeamVo> sideBarList(@RequestParam("tst_user_nickname") String tst_user_nickname) {
		return teamService.selectSideBarTeam(tst_user_nickname);
	}
	
}
