package TST_teamproject.team.dao;

import java.util.List;

import TST_teamproject.common.Pagination;
import TST_teamproject.common.Search;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.user.model.UserVo;

public interface TeamMapper { 
   /*
    * 팀 목록
    * 10.25 
    * @return
    */
//   public List<TeamVo> teamList(); 페이징 전
   public List<TeamVo> teamList(Search search) throws Exception;
   public int listCount(Search search)  throws Exception;
   public void teamInsert(TeamVo teamVo);
   
   /*
    * 10.28
    * @param id
    * @return
    */
   public TeamVo teamFindOne(int tst_team_no);
   
   /*
    * 팀 삭제하기
    * 10.29
    */
   public void teamDelete(int tst_team_no);
   /*
    * 10.30 팀 멤버리스트 
    * @param tst_team_no
    * @return
    */
   public List<UserVo> memberList(int tst_team_no);
   /*
    * 10.30 팀 멤버 추가.
    */
   public void addMember(MemberVo memberVo);
   
   /*
    * 11.01
    * 팀 수정하기.
    * @param TeamVo 
    */
   public void teamUpdate(TeamVo teamVo); 
   
   /*
    * 11.01
    * 팀 권한 수정하기.
    * @param  MemberVo
    */
   public void teamAuthority(MemberVo memberVo);

   /*
    * 11.05
    * 팀 사이드바 출력.
    * @param  String
    * @return TeamVo
    */
   public List<TeamVo> selectSideBarTeam(String tst_user_nickname);
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