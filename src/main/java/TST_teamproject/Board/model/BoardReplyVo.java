package TST_teamproject.Board.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardReplyVo {

   private int tst_board_reply_no;
   private int tst_board_no; 
   private String tst_user_nickname;
   private String tst_board_reply_content;
   private String tst_board_reply_date;  
   private String tst_board_reply_deflag;
   private int tst_reply_count;
   
}