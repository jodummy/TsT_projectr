package TST_teamproject.Board.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import TST_teamproject.Board.model.BoardVo;
import TST_teamproject.Board.service.BoardService;

@Controller
@EnableAutoConfiguration
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/BoardList" , method = RequestMethod.GET)
	public String listBoard(Model model, BoardVo vo)  throws Exception{
		model.addAttribute("BoardList", service.boardList(vo.getTst_board_category()));
		model.addAttribute("category", vo.getTst_board_category());
		return "board.list";
	}
	
	//10.26
	@RequestMapping(value="/BoardInsert" , method = RequestMethod.GET)
	public String insertBoard(Model model, BoardVo vo,Principal cipal)  throws Exception{
		vo.setTst_user_id(cipal.getName());
		model.addAttribute("boardVo", vo);
		return "board.insert";
	}
	
	//10.26
	@RequestMapping(value="/BoardInsertPage" , method = RequestMethod.GET)
	public String insertBoardPage(Model model ,BoardVo vo)  throws Exception{
		service.boardInsert(vo);
		return "redirect:/BoardList";
	}
	
	
}
