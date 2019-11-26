package TST_teamproject.team.service;

//import java.security.Principal;
import java.util.List;

//import com.mysql.fabric.xmlrpc.base.Member;

import TST_teamproject.common.Pagination;
import TST_teamproject.common.Search;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.user.model.UserVo;

public interface TeamService {
   /**
    * 팀 목록
    * 10.25 
    * @return
    */
//   public List<TeamVo> teamList(); 페이징 전
   public List<TeamVo> teamList(Search search) throws Exception;
   public int listCount(Search search) throws Exception;
   
   /*
    * 팀 생성
    * 10.26
    * @param teamVo
    */
   public void teamInsert(TeamVo teamVo ); 
   
   public TeamVo teamFindOne(int tst_team_no);
   
   public void teamDelete(int tst_team_no);
   
   public List<UserVo> memberList(int tst_team_no);

   /*
    * 팀 목록
    * 11.01 팀 수정 
    * @param TeamVo, MemberVo, MemberVo
    * @return int    
    * */
   public void teamUpdate(TeamVo teamVo, MemberVo memberVo_1, MemberVo memberVo_3);
   
   /*
    * 11.05
    * 팀 사이드바 출력.
    * @param  String
    * @return TeamVo
    */
   public List<TeamVo> selectSideBarTeam(String tst_user_nickname);
   
   public void addMember(MemberVo memberVo);
   /*
    * 11.10
    * 팀 멤버 중복 확인.
    */
   public int teamMemberOverlap(MemberVo memberVo);
   
   /*
    * 11.19
    * 팀 명 바꾸기.
    * @param  String
    * @return TeamVo
    */
   public TeamVo swichTeamname(String tst_team_name);
}