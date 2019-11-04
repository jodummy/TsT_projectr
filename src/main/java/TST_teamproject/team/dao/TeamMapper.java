package TST_teamproject.team.dao;

import java.util.List;

import TST_teamproject.team.model.TeamVo;

public interface TeamMapper { 
	/**
	 * 중복 방지
	 * 10.28
	 * @param vo
	 * @return int
	 */
	public List<TeamVo> teamList();
	
	
} 
