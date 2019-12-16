package TST_teamproject.Board.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import TST_teamproject.Board.model.BoardReplyVo;
import TST_teamproject.Board.model.BoardVo;
import TST_teamproject.Board.service.BoardReplyService;
import TST_teamproject.Board.service.BoardService;

@Controller
@EnableAutoConfiguration
public class BoardController {
   
   @Autowired
   private BoardService service;
   
   @Autowired
   private BoardReplyService replyService;
   
   // 11.03 수정
   @RequestMapping(value="/BoardList" , method = RequestMethod.GET)
   public String listBoard(Model model, BoardVo vo, Principal principal)  throws Exception{
      model.addAttribute("BoardList", service.boardList(vo.getTst_board_category()));
      model.addAttribute("category", vo.getTst_board_category());
      //이거 닉네임으로 바꿔야됨
      model.addAttribute("userId",principal.getName());
      return "board.list";
   }
   
//   12.05 유진 수정
   //10.26
   @RequestMapping(value="/BoardInsert" , method = RequestMethod.GET)
   public String insertBoard(Model model, BoardVo vo, Principal cipal)  throws Exception{
      vo.setTst_user_nickname(cipal.getName());
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
   //11.29 유진 수정
   @ResponseBody
   @RequestMapping(value="/BoardDetail" , method = RequestMethod.GET)
   public BoardVo detailBoard(Model model , BoardVo vo, BoardReplyVo reVo)  throws Exception{
      vo =service.boardDetail(vo.getTst_board_no());
      vo.setTst_reply_count(replyService.boardReplyCount(reVo.getTst_board_no()));
      model.addAttribute("reply", reVo);
      return vo;
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
      vo.setTst_user_nickname(cipal.getName());
//      model.addAttribute("BoardVo", vo);
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
   
   // 11.04
      @RequestMapping(value="/BoardReplyList" , method = RequestMethod.GET)
      @ResponseBody
      public List<BoardReplyVo> listReplyBoard(BoardReplyVo vo)  throws Exception{
         return replyService.boardReplyList(vo.getTst_board_no());
      }
      
   // 11.05
//      @RequestMapping(value="/BoardReplyInsert" , method = RequestMethod.GET)
//      public String insertReplyBoard(Model model, BoardReplyVo reVo, BoardVo vo, Principal cipal, RedirectAttributes redirectAttributes)  throws Exception{
//         reVo.setTst_user_nickname(cipal.getName());
//         System.out.println(reVo.toString());
//         System.out.println(vo.toString());
////         replyService.boardReplyInsert(reVo);
//         redirectAttributes.addAttribute("tst_board_no", vo.getTst_board_no());
//         return "redirect:/BoardDetail";
//      }
      
      // 11.05
      //11.10 수정
    @RequestMapping(value="/BoardReplyInsert" , method = RequestMethod.GET)
    @ResponseBody
    public String insertReplyBoard(Model model, BoardReplyVo reVo, Principal cipal, BoardVo vo)  throws Exception{
       reVo.setTst_user_nickname(cipal.getName());
       replyService.boardReplyInsert(reVo);
       return "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
    }
    
//  11.10
  @ResponseBody
  @RequestMapping(value = "/BoardReplyDelete", method = RequestMethod.GET)
  public String deleteReplyBoard(Model mode, BoardReplyVo reVo) throws Exception {
     replyService.boardReplyDelete(reVo.getTst_board_reply_no());
     return "hjj";
     
  }
   
}