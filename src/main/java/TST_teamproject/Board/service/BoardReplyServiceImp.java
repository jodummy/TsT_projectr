package TST_teamproject.Board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.Board.dao.BoardReplyMapper;
import TST_teamproject.Board.model.BoardReplyVo;

@Service
public class BoardReplyServiceImp implements BoardReplyService{

	@Autowired
	private BoardReplyMapper mapper;

	
	@Override
	public List<BoardReplyVo> boardReplyList(int tst_board_no) throws Exception {
		return mapper.boardReplyList(tst_board_no);
	}


	@Override
	public String boardReplyInsert(BoardReplyVo vo) throws Exception {
		return mapper.boardReplyInsert(vo);
	}

}
