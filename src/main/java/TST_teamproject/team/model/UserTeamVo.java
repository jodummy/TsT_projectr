package TST_teamproject.team.model;

public class UserTeamVo {

   private String tst_user_nickname;
   private int tst_team_no;
   private String tst_user_id;
   private int tst_user_team_escape;
   private int tst_user_team_authority;
   private int teammembers;

   public int getTeammembers() {
      return teammembers;
   }

   public void setTeammembers(int teammembers) {
      this.teammembers = teammembers;
   }

   public String getTst_user_nickname() {
      return tst_user_nickname;
   }

   public void setTst_user_nickname(String tst_user_nickname) {
      this.tst_user_nickname = tst_user_nickname;
   }

   public int getTst_team_no() {
      return tst_team_no;
   }

   public void setTst_team_no(int tst_team_no) {
      this.tst_team_no = tst_team_no;
   }

   public String getTst_user_id() {
      return tst_user_id;
   }

   public void setTst_user_id(String tst_user_id) {
      this.tst_user_id = tst_user_id;
   }

   public int getTst_user_team_escape() {
      return tst_user_team_escape;
   }

   public void setTst_user_team_escape(int tst_user_team_escape) {
      this.tst_user_team_escape = tst_user_team_escape;
   }

   public int getTst_user_team_authority() {
      return tst_user_team_authority;
   }

   public void setTst_user_team_authority(int tst_user_team_authority) {
      this.tst_user_team_authority = tst_user_team_authority;
   }

   @Override
   public String toString() {
      return "UserTeamVo [tst_user_nickname=" + tst_user_nickname + ", tst_team_no=" + tst_team_no + ", tst_user_id="
            + tst_user_id + ", tst_user_team_escape=" + tst_user_team_escape + ", tst_user_team_authority="
            + tst_user_team_authority + ", teammembers=" + teammembers + "]";
   }

}