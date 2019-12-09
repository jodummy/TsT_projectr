package TST_teamproject.team.service;

//import java.security.Principal;
import java.util.List;
import java.util.Map;

import TST_teamproject.common.Search;
import TST_teamproject.team.model.MatchingAcceptVo;
import TST_teamproject.team.model.MatchingVo;
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
   
   /*
    * main 페이지  team list
    * 11.28
    * @return TeamVo
    */
   public List<TeamVo> selectMainTeam();
   
   /*
    * 11.27팀 조건매칭 정보 등록
    * kth
    */
   public void insertTeamMatchingData(MatchingVo matchingVo);
   
   // 11.27 조건 매칭 리스트 띄우기!
   public List<MatchingVo> matchingList(MatchingVo matchingVo);
   //11.29 하나의 팀에 대한 매칭 정보 출력
   public MatchingVo findTeamMatchingData(int tst_team_no);
   
   //11.29 조건 매칭 카운트
   public Integer countMatchingTeam(int tst_team_no);
   
   //12.01 조건 매칭 수정
   public void teamMatchingUpdate(MatchingVo matchingVo);
   
   //12.05 랜덤 매칭 
   public List<MatchingVo> teamRandomMatching(MatchingVo matchingVo);
   
   //12.06 팀 나가기
   public void teamLeave(MemberVo memberVo);
   public void teamDeleteAll(int tst_team_no);
   
   //나다 
   public int insertAccept(MatchingAcceptVo vo);
   
   //접니다
   public int updateAccept(MatchingAcceptVo vo);
   
   //score
   public List<MatchingAcceptVo> selectYourTeam(MatchingAcceptVo vo);
   
   public void updateResult(MatchingAcceptVo vo);
   
   public void updateTeamResult(int tst_team_no);
}