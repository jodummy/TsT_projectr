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
