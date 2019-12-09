package TST_teamproject.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import TST_teamproject.user.dao.UserMapper;
import TST_teamproject.user.model.MailHandler;
import TST_teamproject.user.model.MessageVo;
import TST_teamproject.user.model.TempKey;
import TST_teamproject.user.model.UserVo;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    UserMapper userMapper;
    
    @Autowired
    private JavaMailSender mailSender;

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

	@Transactional
	@Override
	public void insertUser(UserVo vo) {
		String result = new TempKey().getKey(9, true);
		vo.setTst_user_key(result);
		
		// 권한 넣기
		userMapper.insertUserAuthority(vo.getTst_user_id());
		
		//회원 정보 넣기
		userMapper.insertUser(vo);
		
		// 이메일 서비스 사용
		try {
			  MailHandler sendMail = new MailHandler(mailSender);
		      sendMail.setSubject("[이메일 인증]");
		           sendMail.setText(
		                new StringBuffer().append("<h1>메일인증</h1>")
		                               .append("<a href='localhost:8089/emailCheck?tst_user_email=" + vo.getTst_user_email() + "&tst_user_key="+ vo.getTst_user_key() + "&tst_user_id=" +vo.getTst_user_id() )
		                               .append("' target='_blank'>Login</a>")
		                               .append("<h1>"+result+"</h1>").toString());
		        sendMail.setFrom("jodummy158@gmail.com", "TsT");
		        sendMail.setTo(vo.getTst_user_email());
		        sendMail.send();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
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

	@Override
	public void updateUserAuthority(UserVo vo) {
		userMapper.updateUserAuthority(vo);
	}

	@Override
	public UserVo myPage(String tst_user_nickname) {
	   return userMapper.myPage(tst_user_nickname);
	}

}
