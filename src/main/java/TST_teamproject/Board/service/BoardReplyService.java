package TST_teamproject.Board.service;

import java.util.List;

import TST_teamproject.Board.model.BoardReplyVo;

public interface BoardReplyService {

	/**
	 * boardReplyList
	 * 11.03 
	 * @return List<BoardReplyVo>
	 * @param int tst_board_no
	 */
	public List<BoardReplyVo> boardReplyList(int tst_board_no) throws Exception;
	
	/**
	 * boardReplyInsert
	 * 11.05 
	 * @return String
	 * @param BoardReplyVo vo
	 */
	public void boardReplyInsert(BoardReplyVo vo) throws Exception;
	
	 /**
	  * boardReplyCount
	  * 11.29 
	  * @return int
	  * @param int tst_board_no
	  */
	 public int boardReplyCount(int tst_board_no) throws Exception;
	 
	  /**
	    * boardReplyDelete
	    * 11.10 
	    * @return int
	    * @param int tst_board_reply_no 
	    */
	   public int boardReplyDelete(int tst_board_reply_no) throws Exception;
}
