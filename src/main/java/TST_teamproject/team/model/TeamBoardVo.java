package TST_teamproject.team.model;

public class TeamBoardVo {

   private int no;
   private int tst_team_notice_board_no;
   private String tst_user_nickname;
   private String tst_team_notice_board_title;
   private String tst_team_notice_board_content;
   private int tst_team_no;
   private int tst_team_notice_board_view;
   private int tst_team_notice_board_max;
   private String tst_team_notice_board_del;
   private String tst_team_notice_insert_date;
   private String tst_team_notice_modify_date;
   private int teammembers;
   private int team_members_view;

   
   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public int getTst_team_notice_board_no() {
      return tst_team_notice_board_no;
   }

   public void setTst_team_notice_board_no(int tst_team_notice_board_no) {
      this.tst_team_notice_board_no = tst_team_notice_board_no;
   }

   public String getTst_user_nickname() {
      return tst_user_nickname;
   }

   public void setTst_user_nickname(String tst_user_nickname) {
      this.tst_user_nickname = tst_user_nickname;
   }

   public String getTst_team_notice_board_title() {
      return tst_team_notice_board_title;
   }

   public void setTst_team_notice_board_title(String tst_team_notice_board_title) {
      this.tst_team_notice_board_title = tst_team_notice_board_title;
   }

   public String getTst_team_notice_board_content() {
      return tst_team_notice_board_content;
   }

   public void setTst_team_notice_board_content(String tst_team_notice_board_content) {
      this.tst_team_notice_board_content = tst_team_notice_board_content;
   }

   public int getTst_team_no() {
      return tst_team_no;
   }

   public void setTst_team_no(int tst_team_no) {
      this.tst_team_no = tst_team_no;
   }

   public int getTst_team_notice_board_view() {
      return tst_team_notice_board_view;
   }

   public void setTst_team_notice_board_view(int tst_team_notice_board_view) {
      this.tst_team_notice_board_view = tst_team_notice_board_view;
   }

   public int getTst_team_notice_board_max() {
      return tst_team_notice_board_max;
   }

   public void setTst_team_notice_board_max(int tst_team_notice_board_max) {
      this.tst_team_notice_board_max = tst_team_notice_board_max;
   }

   public String getTst_team_notice_board_del() {
      return tst_team_notice_board_del;
   }

   public void setTst_team_notice_board_del(String tst_team_notice_board_del) {
      this.tst_team_notice_board_del = tst_team_notice_board_del;
   }

   public String getTst_team_notice_insert_date() {
      return tst_team_notice_insert_date;
   }

   public void setTst_team_notice_insert_date(String tst_team_notice_insert_date) {
      this.tst_team_notice_insert_date = tst_team_notice_insert_date;
   }

   public String getTst_team_notice_modify_date() {
      return tst_team_notice_modify_date;
   }

   public void setTst_team_notice_modify_date(String tst_team_notice_modify_date) {
      this.tst_team_notice_modify_date = tst_team_notice_modify_date;
   }

	public int getTeammembers() {
		return teammembers;
	}

	public void setTeammembers(int teammembers) {
		this.teammembers = teammembers;
	}

	public int getTeam_members_view() {
		return team_members_view;
	}

	public void setTeam_members_view(int team_members_view) {
		this.team_members_view = team_members_view;
	}

	@Override
	public String toString() {
		return "TeamBoardVo [no=" + no + ", tst_team_notice_board_no=" + tst_team_notice_board_no
				+ ", tst_user_nickname=" + tst_user_nickname + ", tst_team_notice_board_title="
				+ tst_team_notice_board_title + ", tst_team_notice_board_content=" + tst_team_notice_board_content
				+ ", tst_team_no=" + tst_team_no + ", tst_team_notice_board_view=" + tst_team_notice_board_view
				+ ", tst_team_notice_board_max=" + tst_team_notice_board_max + ", tst_team_notice_board_del="
				+ tst_team_notice_board_del + ", tst_team_notice_insert_date=" + tst_team_notice_insert_date
				+ ", tst_team_notice_modify_date=" + tst_team_notice_modify_date + ", teammembers=" + teammembers
				+ ", team_members_view=" + team_members_view + "]\n";
	}
	

}