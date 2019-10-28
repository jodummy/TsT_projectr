package TST_teamproject.Board.model;

public class BoardVo {
	private int no;
	private int tst_board_no; 
	private String tst_board_category;
	private String tst_board_title;
	private String tst_board_contents;
	private String tst_board_delflag;
	private String tst_user_id; 
	private String tst_insert_date;
	private String tst_modify_date;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTst_board_no() {
		return tst_board_no;
	}
	public void setTst_board_no(int tst_board_no) {
		this.tst_board_no = tst_board_no;
	}
	public String getTst_board_category() {
		return tst_board_category;
	}
	public void setTst_board_category(String tst_board_category) {
		this.tst_board_category = tst_board_category;
	}
	public String getTst_board_title() {
		return tst_board_title;
	}
	public void setTst_board_title(String tst_board_title) {
		this.tst_board_title = tst_board_title;
	}
	public String getTst_board_contents() {
		return tst_board_contents;
	}
	public void setTst_board_contents(String tst_board_contents) {
		this.tst_board_contents = tst_board_contents;
	}
	public String getTst_board_delflag() {
		return tst_board_delflag;
	}
	public void setTst_board_delflag(String tst_board_delflag) {
		this.tst_board_delflag = tst_board_delflag;
	}
	public String getTst_user_id() {
		return tst_user_id;
	}
	public void setTst_user_id(String tst_user_id) {
		this.tst_user_id = tst_user_id;
	}
	public String getTst_insert_date() {
		return tst_insert_date;
	}
	public void setTst_insert_date(String tst_insert_date) {
		this.tst_insert_date = tst_insert_date;
	}
	public String getTst_modify_date() {
		return tst_modify_date;
	}
	public void setTst_modify_date(String tst_modify_date) {
		this.tst_modify_date = tst_modify_date;
	}
	
	
	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", tst_board_no=" + tst_board_no + ", tst_board_category=" + tst_board_category
				+ ", tst_board_title=" + tst_board_title + ", tst_board_contents=" + tst_board_contents
				+ ", tst_board_delflag=" + tst_board_delflag + ", tst_user_id=" + tst_user_id + ", tst_insert_date="
				+ tst_insert_date + ", tst_modify_date=" + tst_modify_date + "]\n";
	}
	
}
