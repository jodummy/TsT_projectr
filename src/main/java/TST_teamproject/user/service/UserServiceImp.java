package TST_teamproject.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.user.dao.UserMapper;
import TST_teamproject.user.model.MessageVo;
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
		//테스트 안함
		userMapper.insertUserAuthority(vo.getTst_user_id());
		userMapper.insertUser(vo);
	}

	@Override
	public List<MessageVo> listtMessageTo(String tst_to_nicknmame) {
		return userMapper.listtMessageTo(tst_to_nicknmame);
	}

	@Override
	public MessageVo detailMessageTo(int tst_message_no) {
		return userMapper.detailMessageTo(tst_message_no);
	}

	@Override
	public int countMail(String tst_to_nicknmame) {
		return userMapper.countMail(tst_to_nicknmame);
	}

	@Override
	public List<MessageVo> HeaderListtMessageTo(String tst_to_nicknmame) {
		return userMapper.HeaderListtMessageTo(tst_to_nicknmame);
	}

	@Override
	public int countMailCheck(String tst_to_nicknmame) {
		return userMapper.countMailCheck(tst_to_nicknmame);
	}

	@Override
	public void updateMailCheck(int tst_message_no) {
		userMapper.updateMailCheck(tst_message_no);
	}

	@Override
	public void insertMail(MessageVo vo) {
		userMapper.insertMail(vo);
	}

	@Override
	   public UserVo findUserOne(String tst_user_nickname) {
	      return userMapper.findUserOne(tst_user_nickname);
	   }



	

}
