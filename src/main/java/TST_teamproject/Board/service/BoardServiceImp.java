package TST_teamproject.Board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.Board.dao.BoardMapper;
import TST_teamproject.Board.model.BoardVo;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardVo> boardList(String tst_board_category) throws Exception {
		return mapper.boardList(tst_board_category);
	}

	@Override
	public void boardInsert(BoardVo vo) throws Exception {
		mapper.boardInsert(vo);
	}

	@Override
	public BoardVo boardDetail(int tst_board_no) throws Exception {
		return mapper.boardDetail(tst_board_no);
	}

	@Override
	public void boardDelete(int tst_board_no) throws Exception {
		mapper.boardDelete(tst_board_no);
	}

	@Override
	public void boardModify(BoardVo vo) throws Exception {
		mapper.boardModify(vo);
	}

	@Override
	public List<BoardVo> boardMyList(String tst_user_nickname) throws Exception {
		return mapper.boardMyList(tst_user_nickname);
	}

}
