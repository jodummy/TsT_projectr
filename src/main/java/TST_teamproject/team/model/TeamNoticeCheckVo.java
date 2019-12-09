package TST_teamproject.team.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TeamNoticeCheckVo {

	private int tst_team_notice_board_no;
	private String tst_user_nickname;
	private String tst_team_notice_board_check_date;
	private int team_members_view;

	
	public TeamNoticeCheckVo() {
		
	}
	
	public TeamNoticeCheckVo(int tst_team_notice_board_no, String tst_user_nickname) {
		this.tst_team_notice_board_no = tst_team_notice_board_no;
		this.tst_user_nickname = tst_user_nickname;
	}

}
