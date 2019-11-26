package TST_teamproject.user.model;

public class MessageVo {

	private int tst_message_no;
	private String tst_to_nicname;
	private String tst_from_nicname;
	private String tst_to_date;
	private String tst_from_date;
	private String tst_message_title;
	private String tst_message_content;
	private char tst_to_delflag;
	private char tst_form_delflag;
	private String tst_message_category;


	public String getTst_message_category() {
		return tst_message_category;
	}

	public void setTst_message_category(String tst_message_category) {
		this.tst_message_category = tst_message_category;
	}

	public int getTst_message_no() {
		return tst_message_no;
	}

	public void setTst_message_no(int tst_message_no) {
		this.tst_message_no = tst_message_no;
	}

	public String getTst_to_nicname() {
		return tst_to_nicname;
	}

	public void setTst_to_nicname(String tst_to_nicname) {
		this.tst_to_nicname = tst_to_nicname;
	}

	public String getTst_from_nicname() {
		return tst_from_nicname;
	}

	public void setTst_from_nicname(String tst_from_nicname) {
		this.tst_from_nicname = tst_from_nicname;
	}

	public String getTst_to_date() {
		return tst_to_date;
	}

	public void setTst_to_date(String tst_to_date) {
		this.tst_to_date = tst_to_date;
	}

	public String getTst_from_date() {
		return tst_from_date;
	}

	public void setTst_from_date(String tst_from_date) {
		this.tst_from_date = tst_from_date;
	}

	public String getTst_message_title() {
		return tst_message_title;
	}

	public void setTst_message_title(String tst_message_title) {
		this.tst_message_title = tst_message_title;
	}

	public String getTst_message_content() {
		return tst_message_content;
	}

	public void setTst_message_content(String tst_message_content) {
		this.tst_message_content = tst_message_content;
	}

	public char getTst_to_delflag() {
		return tst_to_delflag;
	}

	public void setTst_to_delflag(char tst_to_delflag) {
		this.tst_to_delflag = tst_to_delflag;
	}

	public char getTst_form_delflag() {
		return tst_form_delflag;
	}

	public void setTst_form_delflag(char tst_form_delflag) {
		this.tst_form_delflag = tst_form_delflag;
	}

	@Override
	public String toString() {
		return "MessageVo [tst_message_no=" + tst_message_no + ", tst_to_nicname=" + tst_to_nicname
				+ ", tst_from_nicname=" + tst_from_nicname + ", tst_to_date=" + tst_to_date + ", tst_from_date="
				+ tst_from_date + ", tst_message_title=" + tst_message_title + ", tst_message_content="
				+ tst_message_content + ", tst_to_delflag=" + tst_to_delflag + ", tst_form_delflag=" + tst_form_delflag
				+ ", tst_message_category=" + tst_message_category + "]";
	}


}
