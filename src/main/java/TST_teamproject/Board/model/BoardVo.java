package TST_teamproject.Board.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVo {
   private int no;
   private int tst_board_no; 
   private String tst_board_category;
   private String tst_board_title;
   private String tst_board_contents;
   private String tst_board_delflag;
   private String tst_insert_date;
   private String tst_modify_date;
   private int tst_reply_count;
   private String tst_user_nickname;
}