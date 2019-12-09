package TST_teamproject.team.service;

import java.security.Principal;
//import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import TST_teamproject.common.Pagination;
import TST_teamproject.common.Search;
import TST_teamproject.team.dao.TeamMapper;
import TST_teamproject.team.model.MatchingAcceptVo;
import TST_teamproject.team.model.MatchingVo;
import TST_teamproject.team.model.MemberVo;
import TST_teamproject.team.model.TeamVo;
import TST_teamproject.user.model.UserVo;

@Service
public class TeamServiceImp implements TeamService {

	@Autowired
	TeamMapper teamMapper;

	// @Override
	// public List<TeamVo> teamList() {
	// return teamMapper.teamList();
	// } 페이징 전단계

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

	/*
	 * 11.10 팀 멤버 중복 확인.
	 */
	@Override
	public void addMember(MemberVo memberVo) {
		teamMapper.addMember(memberVo);
	}

	@Override
	public int teamMemberOverlap(MemberVo memberVo) {
		return teamMapper.teamMemberOverlap(memberVo);
	}

	@Override
	public TeamVo swichTeamname(String tst_team_name) {
		// TODO Auto-generated method stub
		return teamMapper.swichTeamname(tst_team_name);
	}

	@Override
	public List<TeamVo> selectMainTeam() {
		return teamMapper.selectMainTeam();
	}

	// 11.27 매칭 정보 등록
	@Override
	public void insertTeamMatchingData(MatchingVo matchingVo) {
		teamMapper.insertTeamMatchingData(matchingVo);
	}

	// 11.27 조건 매칭 리스트 띄우기!
	public List<MatchingVo> matchingList(MatchingVo matchingVo) {
		return teamMapper.matchingList(matchingVo);
	}

	// 11.29 하나의 팀에 대한 조건 매칭 정보
	@Override
	public MatchingVo findTeamMatchingData(int tst_team_no) {
		return teamMapper.findTeamMatchingData(tst_team_no);
	}

	// 11.29 해당 팀 조건 매칭 등록 카운트
	@Override
	public Integer countMatchingTeam(int tst_team_no) {
		return teamMapper.countMatchingTeam(tst_team_no);
	}

	@Override
	public void teamMatchingUpdate(MatchingVo matchingVo) {
		teamMapper.teamMatchingUpdate(matchingVo);
	}

	@Override
	public List<MatchingVo> teamRandomMatching(MatchingVo matchingVo) {
		return teamMapper.teamRandomMatching(matchingVo);
	}

	// 12.05팀 나가기 or 삭제 kth
	@Override
	public void teamLeave(MemberVo memberVo) {
		teamMapper.teamLeave(memberVo);
	}

	@Override
	public void teamDeleteAll(int tst_team_no) {
		teamMapper.teamDeleteAll(tst_team_no);
	}

	@Override
	public int insertAccept(MatchingAcceptVo vo) {
		return teamMapper.insertAccept(vo);
	}

	@Override
	public int updateAccept(MatchingAcceptVo vo) {
		return teamMapper.updateAccept(vo);
	}

	@Override
	public List<MatchingAcceptVo> selectYourTeam(MatchingAcceptVo vo) {
		return teamMapper.selectYourTeam(vo);
	}

	@Override
	public void updateResult(MatchingAcceptVo vo) {
		teamMapper.updateResult(vo);
	}

	@Override
	public void updateTeamResult(int tst_team_no) {
		teamMapper.updateTeamResult(tst_team_no);
	}


}