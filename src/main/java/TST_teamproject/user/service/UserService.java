package TST_teamproject.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import TST_teamproject.user.model.MessageVo;
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
	 
	 /*
      * 하나의 유저 정보 빼오기
      * 11.08
      */
    public UserVo findUserOne(String tst_user_nickname);
	 
	 /**
	  * 메세지 List
	  * 11.07
	  * @param tst_to_nicknmame
	  * @return List<MessageVo> 
	  */
	 public List<MessageVo> listtMessageTo(String tst_to_nicknmame);
	 
	 /**
	  * 메세지 detail
	  * 11.13
	  * @param tst_message_no
	  * @return List<MessageVo> 
	  */
	 public MessageVo detailMessageTo (int tst_message_no);
	 
	 /**
	  * 메세지 count
	  * 11.15
	  * @param tst_to_nicknmame
	  * @return int
	  */
	 public int countMail(String tst_to_nicknmame);
	 
	 /**
	  * header 메세지 List 
	  * 11.07
	  * @param tst_to_nicknmame
	  * @return List<MessageVo> 
	  */
	 public List<MessageVo> HeaderListtMessageTo(String tst_to_nicknmame);
	 
	 /**
	  * 메세지 count 
	  * 11.18
	  * @param tst_to_nicknmame
	  * @return int 
	  */
	 public int countMailCheck(String tst_to_nicknmame);
	 
	 /**
	  * 메세지 읽기
	  *  11.18
	  * @param tst_message_no
	  * @return void
	  */
	 public void updateMailCheck(int tst_message_no);
	 
	 /**
	  * 메세지 보내기
	  *  11.18
	  * @param MessageVo
	  * @return void
	  */
	 public void insertMail(MessageVo vo);
	 
	 /*
	  * 권한 인증 완료
	  * 11.27
	  * @param UserVo
	  */
	 public void updateUserAuthority(UserVo vo);
	 
	  /*
	   * 마이페이지(메인)
	   * 12.04
	   * @param String tst_user_nickname
	   * @return UserVo
	   */
	  public UserVo myPage(String tst_user_nickname);
	 
}
