package TST_teamproject.team.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import TST_teamproject.Board.model.BoardVo;
import TST_teamproject.common.Pagination;
import TST_teamproject.common.Search;
import TST_teamproject.team.dao.TeamBoardMapper;
import TST_teamproject.team.model.MatchingAcceptVo;
import TST_teamproject.team.model.MatchingVo;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamBoardVo;
import TST_teamproject.team.model.TeamNoticeCheckVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.team.service.TeamBoardService;
import TST_teamproject.team.service.TeamService;
import TST_teamproject.user.model.MessageVo;
import TST_teamproject.user.model.UserVo;
import TST_teamproject.user.service.UserService;

@Controller
public class TeamController {
   
   @Autowired TeamService teamService;
   @Autowired TeamBoardService teamBoardService;
   @Autowired UserService userService;
   Principal principal;
      /*
       * 팀 목록
       * 10.25
       * 11.19 조준서 수정
       * 
       * @return
       * @throws Exception 
       */
      @RequestMapping(value="/teamList", method=RequestMethod.GET)
      public String teamList(Model model, TeamVo teamVo
            , @RequestParam(required = false, defaultValue="1") int page
            , @RequestParam(required = false, defaultValue="1") int range
            , @RequestParam(required= false) String keyword
            ) throws Exception{
         
         Search search = new Search();
         search.setKeyword(keyword);
         int listCount = teamService.listCount(search);

         search.pageInfo(page, range, listCount);
         model.addAttribute("pagination", search);
         model.addAttribute("teamList", teamService.teamList(search));
         return "team.list";
      }
      
      @RequestMapping(value="/addTeamMember/{tst_team_no}", method=RequestMethod.GET)
      public String addTeamMember(@PathVariable("tst_team_no") int tst_team_no, @RequestParam("tst_user_nickname") String tst_user_nickname) {
         TeamVo teamVo = teamService.teamFindOne(tst_team_no);
         MemberVo memberVo = new MemberVo(tst_team_no, tst_user_nickname, teamVo.getTst_user_nickname(), 1, 1);
         teamService.addMember(memberVo);
         return "redirect:/teamDetailpage?tst_team_no={tst_team_no}";
      }
      
      /*
       * 팀 추가
       * 10.26
       * @return
       */
      @RequestMapping(value="/teamInsert")
      public String teaminsert(Principal principal, Model model) {
         model.addAttribute("tst_user_nickname", principal.getName());
         return"team.insert";
      }


      /*
       * 11.24 유진 수정 조회수때메
       * 10.28
       * 팀 디테일 페이지
       * @param model
       * @param tst_team_no
       * @return
       */
      @RequestMapping(value="/teamDetailpage", method=RequestMethod.GET)
      public String teamDetailpage(Model model, @RequestParam("tst_team_no") int tst_team_no, Principal principal, TeamBoardVo teamBoardVo) throws Exception {
    	 
         int score = 0;
         String login_user = principal.getName();
         TeamVo teamVo = teamService.teamFindOne(tst_team_no);
         model.addAttribute("sorry",teamVo.getTst_team_name());
         model.addAttribute("detailTeam", teamService.teamFindOne(tst_team_no));
         model.addAttribute("member", teamService.memberList(tst_team_no));
         model.addAttribute("login_user", login_user);
         model.addAttribute("tst_team_no", tst_team_no);
         
         
         if( teamVo.getTst_team_lose() != 0 && teamVo.getTst_team_win() != 0)
            score = (teamVo.getTst_team_win()/(teamVo.getTst_team_win()+teamVo.getTst_team_lose()))*100;
         else if (teamVo.getTst_team_lose() == 0 && teamVo.getTst_team_win() != 0)
            score = 100;
         else
            score = 0;
         
         model.addAttribute("score", score);
         
         List<TeamBoardVo> arr = teamBoardService.teamBoardList(tst_team_no);
         //에러부분 1번 값 에러
         for (int i = 0; i < arr.size(); i++) {
        	 arr.get(i).setTeammembers(teamBoardService.noticeView(teamVo.getTst_team_no()));
        	 arr.get(i).setTeam_members_view(arr.get(i).getTeam_members_view()+1);
         }
         
         
         model.addAttribute("TeamBoardList", arr);
         
      
         
         
         //준서 작성
         MatchingAcceptVo mVo= new MatchingAcceptVo();
         mVo.setTst_my_team_no(tst_team_no);
         mVo.setTst_your_team_no(tst_team_no);
//         mVo.setJjs_team_name(teamVo.getTst_team_name());
        List<MatchingAcceptVo> list = teamService.selectYourTeam(mVo);
         for (int i = 0; i < list.size(); i++) {
        	 list.get(i).setJjs_team_name(teamVo.getTst_team_name());
		}
         model.addAttribute("selectYourTeam", list);
         return"team.detailTeam";
      }
      
      /*
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

      @RequestMapping(value="/teamUpdatePage/{tst_team_no}", method=RequestMethod.POST)
      public String teamUpdatePage(TeamVo teamVo, Principal principal, @PathVariable("tst_team_no") int tst_team_no) {
        TeamVo team = teamService.teamFindOne(tst_team_no);
        teamVo.setTst_team_no(tst_team_no);
        teamVo.setTst_team_location(team.getTst_team_location());
        teamVo.setTst_team_type(team.getTst_team_type());
        MemberVo memberVo_1 = new MemberVo(teamVo.getTst_team_no(), principal.getName(), 1);
         MemberVo memberVo_3 = new MemberVo(teamVo.getTst_team_no(), teamVo.getTst_user_nickname(), 3);
         teamService.teamUpdate(teamVo,memberVo_1, memberVo_3);
         return "redirect:/teamDetailpage?tst_team_no="+tst_team_no;
      }
      
      /*
       * 11.05
       * my team 출력
       * @return String
       */
      @RequestMapping(value="/sideBarList", method=RequestMethod.GET)
      @ResponseBody
      public List<TeamVo> sideBarList(@RequestParam("tst_user_nickname") String tst_user_nickname) {
         return teamService.selectSideBarTeam(tst_user_nickname);
      }
      
      /*
       * 11.09
       * 팀 생성과 동시에 로그인 중인 유저를 멤버에 추가함.
       */
      @RequestMapping(value="/teamInsertPage", method=RequestMethod.POST)
      public String teamInsertPage(Principal principal,TeamVo teamVo ) {
         UserVo user = userService.findUserOne(principal.getName());
         teamVo.setTst_user_nickname(principal.getName());
         teamService.teamInsert(teamVo);
         MemberVo memberVo = new MemberVo(teamVo.getTst_team_no(), user.getTst_user_nickname(), user.getTst_user_id(), 3, 1);
         teamService.addMember(memberVo);
         return"redirect:/teamList";
      }

      /*
       * 11.10
       * 팀원 추가하기!
       */
      @RequestMapping(value = "/overlapName_add/{tst_team_no}" , method= {RequestMethod.GET})
      @ResponseBody
      public int overlapName_add(UserVo vo, @PathVariable("tst_team_no") int tst_team_no) {
         MemberVo memberVo = new MemberVo(tst_team_no, vo.getTst_user_nickname());
         if(teamService.teamMemberOverlap(memberVo) == 1 ) { //초대하는 사용자가 팀에 있다면 오류
            return 2;
         }
         else if (teamService.teamMemberOverlap(memberVo) == 0 && userService.overlapName(vo) == 1 ) //팀에 해당 사용자가 없다면 
            return 1;
         
         else 
            return 0;
      }
   
   
   // 11.15 
      @RequestMapping(value="/teamNoticeList" , method = RequestMethod.GET)
      public String teamNoticeList(Model model, TeamBoardVo teamVo,Principal principal)  throws Exception{
//         teamBoardService.teamBoardList();
//    	  model.addAttribute("teamNo", teamVo.getTst_team_no());
         model.addAttribute("userId",principal.getName());
         return "team.detailTeam";
      }
      
      
   // 11.15 
      @RequestMapping(value="/teamNoticeInsert" , method = RequestMethod.GET)
      public String teamNoticeInsert(Model model, TeamBoardVo teamVo)  throws Exception{
         model.addAttribute("tst_team_no", teamVo.getTst_team_no());
         return "team.noticeInsert";
      }
         
   // 11.18   
      @RequestMapping(value="/teamNoticeInsertPage" , method = RequestMethod.GET)
      public String teamNoticeInsertPage(Model model, TeamBoardVo teamVo, Principal principal)  throws Exception{
         teamVo.setTst_user_nickname(principal.getName());
         teamBoardService.teamBoardInsert(teamVo);
         return "redirect:teamDetailpage?tst_team_no="+teamVo.getTst_team_no();
      }
      
      //11.23 kth 메칭 페이지 열어주기
      @RequestMapping(value="/insertTeamData/{tst_team_no}")
      public String teamMatchingPage(Model model, @PathVariable("tst_team_no") int tst_team_no) {
         TeamVo teamVo = teamService.teamFindOne(tst_team_no);
         model.addAttribute("count", teamService.countMatchingTeam(tst_team_no));
        model.addAttribute("matchingVo",teamService.findTeamMatchingData(tst_team_no));
         model.addAttribute("teamVo", teamVo);
         return "team.teamMatching";
      }
      
      //11.24 kth 매칭 정보를 입력
      @RequestMapping(value="/insertTeamMatching/{tst_team_no}", method= {RequestMethod.POST, RequestMethod.GET})
      public String InsertTeamMatching( MatchingVo matchingVo, @PathVariable("tst_team_no") int tst_team_no) {
         TeamVo teamVo = teamService.teamFindOne(tst_team_no);
         matchingVo.setTst_team_no(tst_team_no);
         matchingVo.setTst_team_name(teamVo.getTst_team_name());
         teamService.insertTeamMatchingData(matchingVo);
         return "redirect:/insertTeamData/"+matchingVo.getTst_team_no();
      }
      
      //11.27 매칭 시 매칭 팀 리스트 출력
      @RequestMapping(value="/matchingList/{tst_team_no}", method=RequestMethod.GET)
      public String matchingList(Model model, @PathVariable("tst_team_no") int tst_team_no, TeamVo teamVo) throws Exception {
         MatchingVo matchingVo = teamService.findTeamMatchingData(tst_team_no);
         model.addAttribute("matchingVo", teamService.matchingList(matchingVo));
         model.addAttribute("myTeamNo", tst_team_no);
         return "team.teamMatchingList";
      }
      
      //12.01 매칭 정보 수정
      @RequestMapping(value="/matchingUpdate/{tst_team_no}", method={RequestMethod.POST, RequestMethod.GET})
      public String matchingUpdate(@PathVariable("tst_team_no") int tst_team_no, MatchingVo matchingVo) {
         TeamVo teamVo = teamService.teamFindOne(tst_team_no);
         matchingVo.setTst_team_no(tst_team_no);
         matchingVo.setTst_team_name(teamVo.getTst_team_name());
         teamService.teamMatchingUpdate(matchingVo);
         return "redirect:/insertTeamData/"+matchingVo.getTst_team_no();
      }
      
   // 11.20 유진
   // 11.25 유진 수정 준서 추가
   // 11.29
      @RequestMapping(value="/teamNoticeDetail" , method = RequestMethod.GET)
      public String teamNoticeDetail(Model model, TeamBoardVo teamVo, Principal principal)  throws Exception{
    	  if(!teamBoardService.noticeDetail(teamVo.getTst_team_notice_board_no()).getTst_user_nickname().equals(principal.getName()))
    		  teamBoardService.noticeMemberCount(new TeamNoticeCheckVo(teamVo.getTst_team_notice_board_no(),principal.getName()), teamVo.getTst_team_notice_board_no());
    	  model.addAttribute("user_nickname",principal.getName());
    	  model.addAttribute("noticeDetail", teamBoardService.noticeDetail(teamVo.getTst_team_notice_board_no()));
    	  model.addAttribute("check",teamBoardService.selectListMember(teamVo.getTst_team_notice_board_no()));
         return "team.noticeDetail";
      }
      
      // 11.20 유진
      @RequestMapping(value="/teamNoticeDelete" , method = RequestMethod.GET)
      public String teamNoticeDelete(Model model, TeamBoardVo teamVo, Principal principal)  throws Exception{
//    	  String user_nickname =principal.getName();
    	  teamBoardService.noticeDelete(teamVo.getTst_team_notice_board_no());
         return "redirect:teamDetailpage?tst_team_no="+teamVo.getTst_team_no();
      }
          
      
      // 11.25 공지사항수정 (유진)
      @RequestMapping(value="/teamNoticeModify" , method = RequestMethod.GET)
      public String teamNoticeModify(Model model, TeamBoardVo teamVo)  throws Exception{
    	  model.addAttribute("detail", teamBoardService.noticeDetail(teamVo.getTst_team_notice_board_no()));
         return "team.noticeModify";
      }
         
      // 11.25 공지사항 수정페이지 (유진)teamNoticeModifyPage
      @RequestMapping(value="/teamNoticeModifyPage" , method = RequestMethod.GET)
      public String teamNoticeModifyPage(Model model, TeamBoardVo teamVo)  throws Exception{
    	  teamBoardService.noticeModify(teamVo);
         return "redirect:teamDetailpage?tst_team_no="+teamVo.getTst_team_no();
      }
      
    //12.05 랜덤 매칭 리스트 
      @RequestMapping(value="/randomMatchingList/{tst_team_no}", method = RequestMethod.GET)
      public String teamRandomMatching(Model model, @PathVariable("tst_team_no") int tst_team_no) {
         MatchingVo matchingVo = teamService.findTeamMatchingData(tst_team_no);
         model.addAttribute("matchingVo", teamService.teamRandomMatching(matchingVo));
         return "team.teamRandomList";
      }
      
      //12.06 팀 강퇴하기 or 나가기.
      @RequestMapping(value="/teamLeave/{tst_team_no}", method= RequestMethod.GET)
      public String teamLeave(@PathVariable("tst_team_no") int tst_team_no, @RequestParam("tst_user_nickname")String tst_user_nickname) {
         MemberVo memberVo = new MemberVo(tst_team_no, tst_user_nickname);
         teamService.teamLeave(memberVo);
         return "redirect:/teamDetailpage?tst_team_no="+tst_team_no;
      }
      
    //12.06 팀 강퇴하기 or 나가기.
      @RequestMapping(value="/leaveTeam/{tst_team_no}", method= RequestMethod.GET)
      public String leaveTeam(@PathVariable("tst_team_no") int tst_team_no, @RequestParam("tst_user_nickname")String tst_user_nickname) {
         MemberVo memberVo = new MemberVo(tst_team_no, tst_user_nickname);
         teamService.teamLeave(memberVo);
         return "redirect:/teamList";
      }
      
      @RequestMapping(value = "/resultSet" , method= {RequestMethod.GET})
      @ResponseBody
      public void resultSet(@RequestParam("win_no") int win_no, @RequestParam("loseNo") int loseNo, @RequestParam("myTeam") int myTeam) {
    	  MatchingAcceptVo mVo= new MatchingAcceptVo();
    	  mVo.setTst_my_team_no(win_no);
    	  mVo.setTst_your_team_no(loseNo);
    	  teamService.updateResult(mVo);
    	  
    	  teamService.updateTeamResult(win_no);
    	  teamService.updateTeamResult(loseNo);
      }
      
      
}