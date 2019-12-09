package TST_teamproject.team.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MatchingAcceptVo {
	private String tst_team_name; // 상대 팀
	private int tst_my_team_no;
	private int tst_your_team_no;
	private String tst_team_accept;
	private String tst_date;
	private String jjs_team_name;
	private int tst_win;
}
