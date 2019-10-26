package TST_teamproject.team.service;

import java.util.List;

import TST_teamproject.team.model.TeamVo;

public interface TeamService {
	/**
	 * 팀 목록
	 * 10.25 
	 * @return
	 */
	public List<TeamVo> teamList();
}
