package TST_teamproject.Board.service;

import java.util.List;

import TST_teamproject.Board.model.BoardVo;

/*
 * 1. 인터페이스는 body가 없음
 * 2. static 안됨
 * 3. 리턴 타입 없음 적지마.
 * 4. 메서드 오버라이드(override)는 자식 클래스에서 부모 클래스의 기능(method)를 재정의할 때 사용.
 */
public interface BoardService {
	/*
	 * board list
	 * 10.25
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
