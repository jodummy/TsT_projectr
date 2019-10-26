package TST_teamproject.user.dao;

import java.util.List;

import TST_teamproject.user.model.UserVo;

public interface UserMapper {

	public UserVo readUser(String tst_user_id);
	public List<String> readAuthority(String tst_user_id);

}
