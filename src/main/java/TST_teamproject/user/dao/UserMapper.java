package TST_teamproject.user.dao;

import java.util.List;

import TST_teamproject.user.model.UserVo;

public interface UserMapper {

	public UserVo readUser(String tst_user_id);
	public List<String> readAuthority(String tst_user_id);
	
	/**
	 * 중복 방지
	 * 10.28
	 * @param vo
	 * @return int
	 */
	 public int overlapName(UserVo vo);
	 
	 /**
	  * 회원 가입
	  * 11.04
	  * @param vo
	  */
	 public void insertUser(UserVo vo);
	
}
