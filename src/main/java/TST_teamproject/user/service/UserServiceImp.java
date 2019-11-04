package TST_teamproject.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.user.dao.UserMapper;
import TST_teamproject.user.model.UserVo;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    UserMapper userMapper;

	@Override
	public UserVo readUser(String tst_user_id) {
		return userMapper.readUser(tst_user_id);
	}

	@Override
	public List<String> readAuthority(String tst_user_id) {
		return userMapper.readAuthority(tst_user_id);
	}

	@Override
	public int overlapName(UserVo vo) {
		return userMapper.overlapName(vo);
	}

	@Override
	public void insertUser(UserVo vo) {
		userMapper.insertUser(vo);
	}

}
