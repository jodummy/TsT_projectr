package TST_teamproject.team.dao;

import java.util.List;

import TST_teamproject.team.model.TeamVo;

public interface TeamMapper { 
	/**
	 * 팀 목록
	 * 10.25 
	 * @return
	 */
	public List<TeamVo> teamList();
	
	
} 
