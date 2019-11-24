package TST_teamproject.Board.model;

public class BoardReplyVo {

	private int tst_board_reply_no;
	private int tst_board_no; 
	private String tst_user_nickname;
	private String tst_board_reply_content;
	private String tst_board_reply_date;  
	private String tst_board_reply_deflag;
	
	public int getTst_board_reply_no() {
		return tst_board_reply_no;
	}
	public void setTst_board_reply_no(int tst_board_reply_no) {
		this.tst_board_reply_no = tst_board_reply_no;
	}
	public int getTst_board_no() {
		return tst_board_no;
	}
	public void setTst_board_no(int tst_board_no) {
		this.tst_board_no = tst_board_no;
	}
	public String getTst_user_nickname() {
		return tst_user_nickname;
	}
	public void setTst_user_nickname(String tst_user_nickname) {
		this.tst_user_nickname = tst_user_nickname;
	}
	public String getTst_board_reply_content() {
		return tst_board_reply_content;
	}
	public void setTst_board_reply_content(String tst_board_reply_content) {
		this.tst_board_reply_content = tst_board_reply_content;
	}
	public String getTst_board_reply_date() {
		return tst_board_reply_date;
	}
	public void setTst_board_reply_date(String tst_board_reply_date) {
		this.tst_board_reply_date = tst_board_reply_date;
	}
	public String getTst_board_reply_deflag() {
		return tst_board_reply_deflag;
	}
	public void setTst_board_reply_deflag(String tst_board_reply_deflag) {
		this.tst_board_reply_deflag = tst_board_reply_deflag;
	}
	
	@Override
	public String toString() {
		return "BoardReplyVo [tst_board_reply_no=" + tst_board_reply_no + ", tst_board_no=" + tst_board_no
				+ ", tst_user_nickname=" + tst_user_nickname + ", tst_board_reply_content=" + tst_board_reply_content
				+ ", tst_board_reply_date=" + tst_board_reply_date + ", tst_board_reply_deflag="
				+ tst_board_reply_deflag + "]\n";
	}

}
