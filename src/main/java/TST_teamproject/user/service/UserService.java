package TST_teamproject.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import TST_teamproject.user.model.UserVo;


public interface UserService {
	public UserVo readUser(String tst_user_id);
	public List<String> readAuthority(String tst_user_id);

}
