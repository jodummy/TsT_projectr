package TST_teamproject.Board.dao;

import java.util.List;

import TST_teamproject.Board.model.BoardReplyVo;



public interface BoardReplyMapper {

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
	public String boardReplyInsert(BoardReplyVo vo) throws Exception;
	
	
//	public int insertReply(BoardReplyVo vo) throws Exception;
//	
//	public int deleteReply(int reply_no) throws Exception;
//	
//	public int updateReply(BoardReplyVo vo) throws Exception;
}
