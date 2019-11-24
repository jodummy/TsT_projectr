package TST_teamproject.team.service;

//import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import TST_teamproject.common.Pagination;
import TST_teamproject.common.Search;
import TST_teamproject.team.dao.TeamMapper;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.user.model.UserVo;

@Service
public class TeamServiceImp implements TeamService{

	@Autowired TeamMapper teamMapper;
	
//	@Override
//	public List<TeamVo> teamList() {
//		return teamMapper.teamList();
//	} 페이징 전단계

	@Override
	public List<TeamVo> teamList(Search search) throws Exception {
		return teamMapper.teamList(search);
	} 

	@Override
	public int listCount(Search search) throws Exception {
		return teamMapper.listCount(search);
	}

	@Override
	public void teamInsert(TeamVo teamVo) {
		teamMapper.teamInsert(teamVo);
		
	}

	@Override
	public TeamVo teamFindOne(int tst_team_no) {
		return teamMapper.teamFindOne(tst_team_no);
	}


	@Override
	public void teamDelete(int tst_team_no) {
		teamMapper.teamDelete(tst_team_no);
	}


	@Override
	public List<UserVo> memberList(int tst_team_no) {
		return teamMapper.memberList(tst_team_no);
	}

	@Transactional
	@Override
	public void teamUpdate(TeamVo teamVo, MemberVo memberVo_1, MemberVo memberVo_3) {
		try {
			
			teamMapper.teamUpdate(teamVo);
			teamMapper.teamAuthority(memberVo_3);
			teamMapper.teamAuthority(memberVo_1);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public List<TeamVo> selectSideBarTeam(String tst_user_nickname) {
		return teamMapper.selectSideBarTeam(tst_user_nickname);
	}
	
}
