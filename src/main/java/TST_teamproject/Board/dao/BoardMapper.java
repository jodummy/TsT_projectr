package TST_teamproject.Board.dao;

import java.util.List;

import TST_teamproject.Board.model.BoardVo;

public interface BoardMapper {
	/**
	 * boardList
	 * 10.25 
	 * @return List<BoardVo>
	 * @param String tst_board_category
	 */
	public List<BoardVo> boardList(String tst_board_category)throws Exception;
	
	/**
	 * boardInsert
	 * 10.26 
	 * @return 
	 * @param BoardVo vo
	 */
	public void boardInsert(BoardVo vo) throws Exception;
	
	/**
	 * boardDetail
	 * 10.27 
	 * @return BoardVo
	 * @param int tst_board_no
	 */
	public BoardVo boardDetail(int tst_board_no)throws Exception;
	
	/**
	 * boardDelete
	 * 10.27 
	 * @return 
	 * @param int tst_board_no
	 */
	public void boardDelete(int tst_board_no)throws Exception;
	
	/**
	 * boardModify
	 * 10.28 
	 * @return 
	 * @param int tst_board_no
	 */
	public void boardModify(BoardVo vo)throws Exception;
	
//	void BoardInsert(BoardVo vo)throws Exception;
//	void BoardDelete(int tst_board_no)throws Exception;
//	void BoardModify(BoardVo vo)throws Exception;

	/**
	 * boardMyList
	 * 12.02 
	 * @return BoardVo vo
	 * @param String tst_user_id
	 */
	 public List<BoardVo> boardMyList(String tst_user_nickname)throws Exception;
}
