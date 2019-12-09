package TST_teamproject.team.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MatchingVo {
   private int     tst_team_no;
   private String    tst_team_name;
   private String    tst_team_con_matching_location;
   private int    tst_team_con_matching_age;
   private Date    tst_team_con_matching_date;
   private String   tst_team_con_matching_gender;
   private String    tst_team_con_matching_type;
}