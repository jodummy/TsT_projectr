package TST_teamproject.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import TST_teamproject.user.model.UserVo;


public interface UserService {
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
