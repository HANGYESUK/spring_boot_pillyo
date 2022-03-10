package com.pillyo.pill.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.BoardVO;
import com.pillyo.pill.model.CommentVO;
import com.pillyo.pill.service.BoardService;
import com.pillyo.pill.service.CommentService;


@Controller // @는 어노테이션
public class BoardController {
	// 게시판 리스트
    /*@RequestMapping(value="/boardList")
    public String boardList(Model model) throws Exception {
        
        List<BoardVO> list = boardService.boardList();
        model.addAttribute("list", list);
        
        return "boardList";
    }*/
    
//    @RequestMapping(value="/boardList")
//    public String boardList(Criteria cri, Model model) throws Exception {
// 
//        // 전체 글 개수
//        int boardListCnt = BoardService.boardListCnt();
//        
//        // 페이징 객체
//        Paging paging = new Paging();
//        paging.setCri(cri);
//        paging.setTotalCount(boardListCnt);    
//        
//        List<Map<String, Object>> list = BoardService.boardList(cri);
//        
//        model.addAttribute("list", list);    
//        model.addAttribute("paging", paging);    
//                
//        return "boardList";
//    }

//	// 메소드 생성
//	@GetMapping("/")  // localhost 8080 (/)경로로 갔을 때 
//	@ResponseBody // return "hello world" 글자를 띄어주는 어노테이션 
//	public String main() {
//		
//		
//		return "hello world";
//	}
	@Autowired
	BoardService service; // 서비스 연결
	
	@Autowired
	CommentService commentservice;
	
	// 게시판으로 이동
	@RequestMapping("/boardForm")
	public String boardWriteForm() {
		
		return "board/boardwrite"; // return 사이의 값은 어떤 뷰 파일로 보내줄 것인지!
	}
	
	// 게시판으로 이동
	@RequestMapping("/commentForm")
	public String commentWriteForm() {
		
		return "/board/boardDetailView";
	}

	// 게시판으로 이동
	@RequestMapping("/boardFormQna")
	public String boardWriteFormQna() {
		
		return "board/boardwriteQna"; // return 사이의 값은 어떤 뷰 파일로 보내줄 것인지!
	}
	
	// 게시판 등록 
		@RequestMapping("/insertboard")
		public String insertboard(BoardVO vo, HttpSession session) { 
									// title, content 매개변수 받기 
			String userId = (String)session.getAttribute("sid"); // session 받아오기
			service.insertboard(vo);
			
			
//			System.out.println(vo.getTitle());
			return "redirect:/listAllBoard";  
		}
		
	

//	//Ajax 컨트롤러
//	//평점 게시글 등록(ajax)
//	@ResponseBody
//	@RequestMapping("/insertboard2")
//	public String writeBoard(CommentVO vo,
//										HttpSession session) {
//		String userId = (String)session.getAttribute("sid"); // session 받아오기
//		commentservice.insertcomment(vo);
//		
//		return"success";
//	}

	
	@RequestMapping("/listAllBoard")
	public String listAllBoard(Model model) {

		// Model은 하나의 객체로 컨트롤러에서 페이지로 넘길 값을 저장하는데 사용
		// 소식
		ArrayList<BoardVO> boardNewsList = service.listAllBoard();
		model.addAttribute("boardNewsList", boardNewsList);
		
		// 자주묻는질문 전체
		ArrayList<BoardVO> boardQnaList = service.listAllBoardQna();
		model.addAttribute("boardQnaList", boardQnaList);
		
		// 주문결제
		ArrayList<BoardVO> boardOrderPayList = service.listAllBoardQna2();
		model.addAttribute("boardOrderPayList", boardOrderPayList);
		
		// 교환반품
		ArrayList<BoardVO> boardTradeList = service.listAllBoardQna3();
		model.addAttribute("boardTradeList", boardTradeList);
		
		// 제품
		ArrayList<BoardVO> boardProductList = service.listAllBoardQna4();
		model.addAttribute("boardProductList", boardProductList);
		
		// 회원
		ArrayList<BoardVO> boardMemberList = service.listAllBoardQna5();
		model.addAttribute("boardMemberList", boardMemberList);
		

		
		// 이 구간은 model 객체를 파라미터로 받아서 view인 listAllBoard에 리턴해주는 역할
		// model.addAttribute("변수 이름", 변수에 넣을 데이터); 라고 생각
		// view 단계에서 ${변수 이름}, 즉 ${boardList} 이렇게 받아주면 됨

		return "board/boardListView";
	}
	
	// 상세 정보 조회
	@RequestMapping("/boardDetailView/{boardNo}")
	public String boardDetailView(@PathVariable int boardNo, Model model) {
		BoardVO board = service.boardDetailView(boardNo);
		model.addAttribute("board", board);
		
		ArrayList<CommentVO> commentList = commentservice.listAllComment(boardNo);
		model.addAttribute("commentList", commentList);
		
		return "/board/boardDetailView";
	}
	
	// 정보 삭제
	@RequestMapping("/deleteBoard/{boardNo}")
	public String deleteBoard(@PathVariable int boardNo) {
		System.out.println(boardNo);
		service.deleteBoard(boardNo);
		return "redirect:../listAllBoard";
	}
	
	
	// 업데이트 폼 이동
		@RequestMapping("/updateBoardForm/{boardNo}")
		public String updateBoardForm(@PathVariable int boardNo, Model model) {
			BoardVO board = service.boardDetailView(boardNo);
			model.addAttribute("board", board);
			return "board/updateBoardForm";
	}
	// 정보 업데이트
	@RequestMapping("/updateBoard/{boardNo}")
	public String updateBoard(BoardVO vo, @PathVariable int boardNo) {
		//@PathVariable 매핑 경로 주소에 사용 
		service.updateBoard(vo);
		return "redirect:/listAllBoard";  
	}
	
	
	// 댓글 등록 
	@RequestMapping("/insertcomment/{boardNo}")
	public String insertcomment(CommentVO vo, HttpSession session,@PathVariable("boardNo") int boardNo, Model model) { 
								// title, content 매개변수 받기 
		String userId = (String)session.getAttribute("sid"); // session 받아오기
		commentservice.insertcomment(vo);
		System.out.println(boardNo);
//			System.out.println(vo.getTitle());
		BoardVO board = service.boardDetailView(boardNo);
		model.addAttribute("boardNo", boardNo);
		
		return "redirect:/boardDetailView/{boardNo}";
	}
	
	// 댓글 삭제
	@RequestMapping("/deleteComment/{commentNo}")
	public String deleteComment(@PathVariable int commentNo) {
		System.out.println(commentNo);
		commentservice.deleteComment(commentNo);
		
		
		return "redirect:../listAllBoard";
	}
	
	
	
	
	
//	@RequestMapping("/listAllComment")
//	public String listAllComment(Model model) {
//
//		// Model은 하나의 객체로 컨트롤러에서 페이지로 넘길 값을 저장하는데 사용
//		ArrayList<CommentVO> commentList = commentservice.listAllComment();
//		model.addAttribute("commentList", commentList);
//		
//
//		// 이 구간은 model 객체를 파라미터로 받아서 view인 listAllBoard에 리턴해주는 역할
//		// model.addAttribute("변수 이름", 변수에 넣을 데이터); 라고 생각
//		// view 단계에서 ${변수 이름}, 즉 ${boardList} 이렇게 받아주면 됨
//
//		return "comment/commentListView";
//	}
}
