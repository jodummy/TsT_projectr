package TST_teamproject.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.team.dao.TeamMapper;
import TST_teamproject.team.model.TeamVo;

@Service
public class TeamServiceImp implements TeamService{

	@Autowired TeamMapper teamMapper;
	
	
	@Override
	public List<TeamVo> teamList() {
		return teamMapper.teamList();
	}

}
