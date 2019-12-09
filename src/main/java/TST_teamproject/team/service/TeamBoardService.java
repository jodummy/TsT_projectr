package TST_teamproject.team.service;

import java.util.List;

import TST_teamproject.team.model.MatchingAcceptVo;
import TST_teamproject.team.model.TeamBoardVo;
import TST_teamproject.team.model.TeamNoticeCheckVo;
import TST_teamproject.team.model.UserTeamVo;


public interface TeamBoardService {
   /*
    * 팀 공지사항 목록
    * 11.14
    * @param String
    * @return TeamBoardVo
    * 11.15 수정
    * */
   public List<TeamBoardVo> teamBoardList(int tst_team_no)throws Exception;
   
   /*
    * 팀 공지사항 입력
    * 11.18
    * @param TeamBoardVo
    * */
   public void teamBoardInsert(TeamBoardVo teamVo)throws Exception;
   
   /*
    * 팀 멤버 수 (UserTeam 테이블에서 가져옴)
    * 11.18
    * @return int
    * @param tst_team_no
    * */
   public int teamMembers(int tst_team_no)throws Exception;
   
   /*
    * 팀 공지사항 디테일 (유진)
    * 11.20
    * @return TeamBoardVo
    * @param int tst_team_notice_board_no
    * */
	public TeamBoardVo noticeDetail(int tst_team_notice_board_no) throws Exception;
	
	/*
	 * 팀 공지사항 삭제 (유진)
	 * 11.22
	 * @param int tst_team_notice_board_no
	 * */
	public void noticeDelete(int tst_team_notice_board_no) throws Exception;
	
	/*
	 * 팀 공지사항 전체 팀원들 (유진)
	 * 11.24
	 * @return int
	 * @param int tst_team_no
	 * */
	public int noticeView(int tst_team_no) throws Exception;
	
	/*
	 * 팀 공지사항 멤버들 읽음 조회수 (유진)
	 * 11.24
	 * @param int tst_team_notice_board_no
	 * */
	public void noticeMemberCount(TeamNoticeCheckVo noticeCheckVo, int tst_team_notice_board_no) throws Exception;
	
	/*
	 * 팀 공지사항 수정 (유진)
	 * 11.25
	 * @return TeamBoardVo teamVo
	 * */
	public void noticeModify(TeamBoardVo teamVo) throws Exception;
	
	/*
	 * team check list
	 * 12.01
	 * @param int tst_team_notice_board_no
	 * @return List<TeamNoticeCheckVo>
	 * */
	public List<TeamNoticeCheckVo> selectListMember(int tst_team_notice_board_no) throws Exception;

	
}