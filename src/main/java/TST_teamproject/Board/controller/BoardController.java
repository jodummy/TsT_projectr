package TST_teamproject.Board.controller;

import java.lang.ProcessBuilder.Redirect; 
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import TST_teamproject.Board.model.BoardVo;
import TST_teamproject.Board.service.BoardService;

@Controller
@EnableAutoConfiguration
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/BoardList" , method = RequestMethod.GET)
	public String listBoard(Model model, BoardVo vo)  throws Exception{
		System.out.println("뿌려주는 값 : "+vo.getTst_board_category());
		model.addAttribute("BoardList", service.boardList(vo.getTst_board_category()));
		model.addAttribute("category", vo.getTst_board_category());
		return "board.list";
	}
	
	//10.26
	@RequestMapping(value="/BoardInsert" , method = RequestMethod.GET)
	public String insertBoard(Model model, BoardVo vo, Principal cipal)  throws Exception{
		vo.setTst_user_id(cipal.getName());
		model.addAttribute("BoardVo", vo);
		return "board.insert";
	}
	
	//10.26
	//10.27 수정
	@RequestMapping(value="/BoardInsertPage" , method = RequestMethod.GET)
	public String insertBoardPage(Model model ,BoardVo vo,RedirectAttributes redirectAttributes)  throws Exception{
		 service.boardInsert(vo);
		// redirectAttributes.addAttribute 값이 깨지지 않고 전송 값으로 활용
		redirectAttributes.addAttribute("tst_board_category", vo.getTst_board_category());
		return "redirect:/BoardList";
	}
	
	//10.27
	@ResponseBody
	@RequestMapping(value="/BoardDetail" , method = RequestMethod.GET)
	public BoardVo detailBoard(Model model , BoardVo vo, Principal prioncipal)  throws Exception{
		System.out.println(vo.getTst_board_no());
		System.out.println(prioncipal.getName());
		return service.boardDetail(vo.getTst_board_no());
	}
	
	//10.27
	@ResponseBody
	@RequestMapping(value = "/BoardDelete", method = RequestMethod.GET)
	public String deleteBoard(Model mode, BoardVo vo) throws Exception {
		String category = service.boardDetail(vo.getTst_board_no()).getTst_board_category();
		service.boardDelete(vo.getTst_board_no());
		return category;
		
	}
	
	//10.28
	@RequestMapping(value="/BoardModify" , method = RequestMethod.GET)
	public String modifyBoard(Model model, BoardVo vo, Principal cipal)  throws Exception{
		model.addAttribute("detail", service.boardDetail(vo.getTst_board_no()));
		return "board.modify";
	}
	
	//10.28
	@ResponseBody
	@RequestMapping(value="/BoardModifyPage" , method = RequestMethod.GET)
	public String modifyPage(Model model ,BoardVo vo, RedirectAttributes redirectAttributes)  throws Exception{
		service.boardModify(vo);
		return service.boardDetail(vo.getTst_board_no()).getTst_board_category();
	}
	
}
