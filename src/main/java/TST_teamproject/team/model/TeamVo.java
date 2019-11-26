package TST_teamproject.team.model;

public class TeamVo {
	private int tst_team_no;
	private String tst_team_name;
	private String tst_team_type;
	private String tst_team_location;
	private String tst_user_nickname;
	private String tst_team_content;
	private int tst_team_win;
	private int tst_team_lose;
	
	public int getTst_team_age() {
		return tst_team_age;
	}

	public void setTst_team_age(int tst_team_age) {
		this.tst_team_age = tst_team_age;
	}

	private int tst_team_age;

	public int getTst_team_no() {
		return tst_team_no;
	}

	public void setTst_team_no(int tst_team_no) {
		this.tst_team_no = tst_team_no;
	}

	public String getTst_team_name() {
		return tst_team_name;
	}

	public void setTst_team_name(String tst_team_name) {
		this.tst_team_name = tst_team_name;
	}

	public String getTst_team_type() {
		return tst_team_type;
	}

	public void setTst_team_type(String tst_team_type) {
		this.tst_team_type = tst_team_type;
	}

	public String getTst_team_location() {
		return tst_team_location;
	}

	public void setTst_team_location(String tst_team_location) {
		this.tst_team_location = tst_team_location;
	}

	public String getTst_user_nickname() {
		return tst_user_nickname;
	}

	public void setTst_user_nickname(String tst_user_nickname) {
		this.tst_user_nickname = tst_user_nickname;
	}

	public String getTst_team_content() {
		return tst_team_content;
	}

	public void setTst_team_content(String tst_team_content) {
		this.tst_team_content = tst_team_content;
	}

	public int getTst_team_win() {
		return tst_team_win;
	}

	public void setTst_team_win(int tst_team_win) {
		this.tst_team_win = tst_team_win;
	}

	public int getTst_team_lose() {
		return tst_team_lose;
	}

	public void setTst_team_lose(int tst_team_lose) {
		this.tst_team_lose = tst_team_lose;
	}

	@Override
	public String toString() {
		return "TeamVo [tst_team_no=" + tst_team_no + ", tst_team_name=" + tst_team_name + ", tst_team_type="
				+ tst_team_type + ", tst_team_location=" + tst_team_location + ", tst_user_nickname="
				+ tst_user_nickname + ", tst_team_content=" + tst_team_content + ", tst_team_win=" + tst_team_win
				+ ", tst_team_lose=" + tst_team_lose + ", tst_team_age=" + tst_team_age + "]";
	}


}
