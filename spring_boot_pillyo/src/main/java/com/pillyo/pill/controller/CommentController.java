package com.pillyo.pill.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pillyo.pill.model.CommentVO;
import com.pillyo.pill.service.CommentService;

//@Controller
//public class CommentController {
//	@Autowired
//	CommentService service;
//	
//	@RequestMapping("/listAllComment")
//	public String listAllComment(Model model) {
//
//		// Model은 하나의 객체로 컨트롤러에서 페이지로 넘길 값을 저장하는데 사용
//		ArrayList<CommentVO> commentList = service.listAllComment();
//		model.addAttribute("commentList", commentList);
//		
//
//		// 이 구간은 model 객체를 파라미터로 받아서 view인 listAllBoard에 리턴해주는 역할
//		// model.addAttribute("변수 이름", 변수에 넣을 데이터); 라고 생각
//		// view 단계에서 ${변수 이름}, 즉 ${boardList} 이렇게 받아주면 됨
//
//		return "comment/commentListView";
//	}
//	@Autowired
////	CommentService service;
//	// 댓글 삭제
//		@RequestMapping("/deleteComment/{commentNo}")
//		public String deleteComment(@PathVariable int commentNo) {
//			System.out.println(commentNo);
//			service.deleteComment(commentNo);
//			return "redirect:../listAllBoard";
//		}
//	
//}
