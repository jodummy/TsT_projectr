package TST_teamproject.team.model;

public class MemberVo {
   private int tst_team_no;
   private String tst_user_nickname;
   private String tst_user_id;
   private int tst_user_team_escape;
   private int   tst_user_team_authority;
   
   public MemberVo(int tst_team_no, String tst_user_nickname ,int tst_user_team_authority){
      this.tst_team_no = tst_team_no;
      this.tst_user_nickname = tst_user_nickname;
      this.tst_user_team_authority = tst_user_team_authority;
   }
   public MemberVo(int tst_team_no, String tst_user_nickname ,String tst_user_id, int tst_user_team_authority, int tst_user_team_escape){
      this.tst_team_no = tst_team_no;
      this.tst_user_nickname = tst_user_nickname;
      this.tst_user_id = tst_user_id;
      this.tst_user_team_authority = tst_user_team_authority;
      this.tst_user_team_escape = tst_user_team_escape;
   }
   public MemberVo(int tst_team_no, String tst_user_nickname) {
      this.tst_team_no=tst_team_no;
      this.tst_user_nickname = tst_user_nickname;
   }
   public int getTst_team_no() {
      return tst_team_no;
   }
   public void setTst_team_no(int tst_team_no) {
      this.tst_team_no = tst_team_no;
   }
   public String getTst_user_nickname() {
      return tst_user_nickname;
   }
   public void setTst_user_nickname(String tst_user_nickname) {
      this.tst_user_nickname = tst_user_nickname;
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
      return "MemberVo [tst_team_no=" + tst_team_no + ", tst_user_nickname=" + tst_user_nickname + ", tst_user_id="
            + tst_user_id + ", tst_user_team_escape=" + tst_user_team_escape + ", tst_user_team_authority="
            + tst_user_team_authority + ", getTst_team_no()=" + getTst_team_no() + ", getTst_user_nickname()="
            + getTst_user_nickname() + ", getTst_user_id()=" + getTst_user_id() + ", getTst_user_team_escape()="
            + getTst_user_team_escape() + ", getTst_user_team_authority()=" + getTst_user_team_authority()
            + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
            + "]";
   }
   
   
}