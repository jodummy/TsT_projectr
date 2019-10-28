package TST_teamproject.Board.dao;

import java.util.List;

import TST_teamproject.Board.model.BoardVo;

public interface BoardMapper {
	/**
	 * BoardList
	 * 10.25 
	 * @return List<BoardVo>
	 * @param String tst_board_category
	 */
	public List<BoardVo> boardList(String tst_board_category)throws Exception;
	
	/**
	 * BoardInsert
	 * 10.26 
	 * @return 
	 * @param BoardVo Vo
	 */
	public void boardInsert (BoardVo vo)throws Exception;
	
//	BoardVo BoardDetail(int tst_board_no)throws Exception;
//	void BoardInsert(BoardVo vo)throws Exception;
//	void BoardDelete(int tst_board_no)throws Exception;
//	void BoardModify(BoardVo vo)throws Exception;
	
	
	
}
