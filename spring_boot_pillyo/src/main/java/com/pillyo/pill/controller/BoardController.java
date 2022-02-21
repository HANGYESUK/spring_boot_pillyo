package com.pillyo.pill.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.Criteria;
import com.pillyo.pill.Paging;
import com.pillyo.pill.model.BoardVO;
import com.pillyo.pill.service.BoardService;


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
	BoardService service;
	
	// 게시판으로 이동
	@RequestMapping("/boardForm")
	public String boardWriteFrom() {
		
		return "board/boardwrite"; // return 사이의 값은 어떤 뷰 파일로 보내줄 것인지!
	}
	
	// 게시판 등록 
	@RequestMapping("/insertboard")
	public String insertboard(BoardVO vo, HttpSession session) { 
								// title, content 매개변수 받기 
		String userId = (String)session.getAttribute("sid"); // session 받아오기
		service.insertboard(vo);
		System.out.println(vo.getTitle());
		return "redirect:/listAllBoard";
	}
	
	@RequestMapping("/listAllBoard")
	public String listAllBoard(Criteria cri, Model model) {
		
		// 전체 글 개수
        int boardListCnt = BoardService.boardListCnt(cri);
        
        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);
		
		
		// Model은 하나의 객체로 컨트롤러에서 페이지로 넘길 값을 저장하는데 사용
		ArrayList<BoardVO> boardList = service.listAllBoard(cri);
		model.addAttribute("boardList", boardList);
		// 이 구간은 model 객체를 파라미터로 받아서 view인 listAllBoard에 리턴해주는 역할
		// model.addAttribute("변수 이름", 변수에 넣을 데이터); 라고 생각
		// view 단계에서 ${변수 이름}, 즉 ${boardList} 이렇게 받아주면 됨
		model.addAttribute("paging", paging); 

		
		return "board/boardListView";
	}
	
	// 상세 정보 조회
	@RequestMapping("/boardDetailView/{id}")
	public String boardDetailView(@PathVariable int id, Model model) {
		BoardVO board = service.boardDetailView(id);
		model.addAttribute("board", board);
		
		return "/board/boardDetailView";
	}
	
	// 정보 삭제
	@RequestMapping("/deleteBoard/{id}")
	public String deleteBoard(@PathVariable int id) {
		System.out.println(id);
		service.deleteBoard(id);
		return "redirect:../listAllBoard";
	}
	// 업데이트 폼 이동
		@RequestMapping("/updateBoardForm/{id}")
		public String updateBoardForm(@PathVariable int id, Model model) {
			BoardVO board = service.boardDetailView(id);
			model.addAttribute("board", board);
			return "board/updateBoardForm";
	}
	// 정보 업데이트
	@RequestMapping("/updateBoard/{id}")
	public String updateBoard(BoardVO vo, @PathVariable int id) {
		//@PathVariable 매핑 경로 주소에 사용 
		service.updateBoard(vo);
		return "redirect:/listAllBoard";  
	}

	
//	@GetMapping("/board/write") // 어떤 url로 접근할건지 지정해주는! 어노테이션
//	public String boardWriteFrom() {
//		
//		return "boardwrite"; // return 사이의 값은 어떤 뷰 파일로 보내줄 것인지!
//	}
//	
//	@PostMapping("board/writepro")
//	public String boardWritePro(String title, String content) { 
//								// title, content 매개변수 받기 
//		
//		System.out.println("제목 : " + title);
//		System.out.println("내옹 : " + content);
//		
//		return "";
//	}
	
}
