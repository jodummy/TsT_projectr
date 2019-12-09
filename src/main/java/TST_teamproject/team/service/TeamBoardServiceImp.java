package TST_teamproject.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.team.dao.TeamBoardMapper;
import TST_teamproject.team.model.TeamBoardVo;
import TST_teamproject.team.model.TeamNoticeCheckVo;

@Service
public class TeamBoardServiceImp implements TeamBoardService {
   @Autowired
   TeamBoardMapper teamBoardMapper;

   @Override
   public List<TeamBoardVo> teamBoardList(int tst_team_no) throws Exception {
      return teamBoardMapper.teamBoardList(tst_team_no);
   }

   @Override
   public void teamBoardInsert(TeamBoardVo teamVo) throws Exception {
      teamBoardMapper.teamBoardInsert(teamVo);
   }

   @Override
   public int teamMembers(int tst_team_no) throws Exception {
      return teamBoardMapper.teamMembers(tst_team_no);
   }

	@Override
	public TeamBoardVo noticeDetail(int tst_team_notice_board_no) throws Exception {
		return teamBoardMapper.noticeDetail(tst_team_notice_board_no);
	}

	@Override
	public void noticeDelete(int tst_team_notice_board_no) throws Exception {
		teamBoardMapper.noticeDelete(tst_team_notice_board_no);
	}

	@Override
	public int noticeView(int tst_team_no) throws Exception {
		return teamBoardMapper.noticeView(tst_team_no);
	}

	@Override
	public void noticeMemberCount(TeamNoticeCheckVo noticeCheckVo,int tst_team_notice_board_no ) throws Exception {
		if (teamBoardMapper.noticeViewCount(noticeCheckVo) == 0) {
			teamBoardMapper.noticeViewInsert(noticeCheckVo);
			teamBoardMapper.noticeViewUpdate(tst_team_notice_board_no);
		}
 	}

	@Override
	public void noticeModify(TeamBoardVo teamVo) throws Exception {
		teamBoardMapper.noticeModify(teamVo);
	}

	@Override
	public List<TeamNoticeCheckVo> selectListMember(int tst_team_notice_board_no) throws Exception {
		return teamBoardMapper.selectListMember(tst_team_notice_board_no);
	}

}