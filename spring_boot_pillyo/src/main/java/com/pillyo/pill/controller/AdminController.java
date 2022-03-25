package com.pillyo.pill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pillyo.pill.model.AdminVO;
import com.pillyo.pill.model.BoardVO;
import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.model.DrugShapeVO;
import com.pillyo.pill.model.FamilyVO;
import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.paging.Criteria;
import com.pillyo.pill.paging.PageMakerDTO;
import com.pillyo.pill.service.AdminService;
import com.pillyo.pill.service.BoardService;
import com.pillyo.pill.service.DrugService;
import com.pillyo.pill.service.DrugShapeService;
import com.pillyo.pill.service.FamilyService;
import com.pillyo.pill.service.UserService;

@Controller
public class AdminController {
	
	 private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService aservice;
	@Autowired
	UserService uservice;
	@Autowired
	DrugService dservice;
	@Autowired
	DrugShapeService sservice;
	@Autowired
	FamilyService famservice;
	@Autowired
	BoardService bservice;
	
	// 로그인 폼으로 이동
		@RequestMapping("/adminloginForm")
		public String adminloginForm() {
			return "/admin/adminLoginForm";
		}

	//관리자 로그인
		@ResponseBody
		@RequestMapping("/adminLogin")
		public String adminLogin(@RequestParam HashMap<String, Object> map,
												   HttpSession session) {
			
			// 로그인 체크 결과
			AdminVO vo = aservice.adminLogin(map);
			String result = "fail";
			
			if(vo != null) {
				//로그인 성공하면 세션 변수 지정
				session.setAttribute("admin", vo.getAdminId());
				result = "success";
			}
			
			return result;
		}
		//관리자 메인화면 이동
		@RequestMapping("/adminMain")
		public String adminMain(Model model) {
			
			int userCnt = uservice.userCount();
			model.addAttribute("userCnt", userCnt);
			return "admin/adminMain";
		}
		//관리자 메뉴- 회원 전체 조회
		@RequestMapping("/listAllUser")
		public String listAllUser(Model model, Criteria cri) throws Exception {
			
			log.info("userListGET");
			log.info("cri : " + cri);
			
			List<UserVO> userList = uservice.getUserListPaging(cri);
			model.addAttribute("userList", userList);
			
			int total = dservice.getTotal(cri);
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			
			model.addAttribute("pageMaker", pageMake);
			
			return "admin/a_listAllUserView";
		}
		//관리자 유저 업데이트폼 이동
		@RequestMapping("/a_updateUserForm/{userId}")
		public String updateUserForm(@PathVariable String userId, Model model) {
			
			UserVO vo = uservice.detailUserView(userId);
			
			//이메일 분리
			String emailStr = vo.getUserEmail();
			String[] emailArray = emailStr.split("@");
			String emailId = emailArray[0];
			String email = emailArray[1];
			
			  //핸드폰 분리
			String hpStr = vo.getUserHp();
			System.out.println(hpStr);
			String[] hpArray = hpStr.split("-");
			 
			
			String userHp1 = hpArray[0];
			String userHp2 = hpArray[1];
			String userHp3 = hpArray[2];
			 
						
			model.addAttribute("user", vo);
			model.addAttribute("emailId", emailId);
			model.addAttribute("email", email);
			model.addAttribute("userHp1", userHp1);
			model.addAttribute("userHp2", userHp2);
			model.addAttribute("userHp3", userHp3);
			
			return "/admin/a_updateUserForm";
		}
		//관리자 유저 업데이트
		@RequestMapping("/a_updateUser")
		public String updateUser(UserVO vo) {
			String emailId = vo.getUserEmailId();
			String email = vo.getUserEmailText();
			String userEmail = emailId + "@" + email;
			System.out.println(userEmail);
			vo.setUserEmail(userEmail);
			
			String userHp1 = vo.getUserHp1();
			String userHp2 = vo.getUserHp2();
			String userHp3 = vo.getUserHp3();
			String userHp = userHp1 + "-" + userHp2 +"-" +userHp3;
			vo.setUserHp(userHp);
			
			uservice.updateUser(vo);
			
			return "redirect:/a_listAllUserView";
		}
		//유저 가족정보
		@RequestMapping("/a_listUserFamview/{userId}")
		public String a_listAllUserView(@PathVariable("userId") String userId, Model model) {
			ArrayList<FamilyVO> famList = famservice.famListView(userId);
			model.addAttribute("famList", famList);
			model.addAttribute("userId", userId);
			return "admin/a_listUserFamview";
		}
		//(관리자) 가족 정보 삭제
		@RequestMapping("/a_famDelete/{famNo}")
		public String famDelete(@PathVariable int famNo) {
			famservice.famDelete(famNo);
			return "redirect:../a_listUserFamview";
		}
		
		//회원탈퇴
		@RequestMapping("/a_deleteUser/{userId}")
		public String deleteUser(@PathVariable("userId") String userId) {
			uservice.deleteUser(userId);
			return "redirect:../a_listAllUserView";
		}
				
		//관리자 메뉴- 약정보 전체 조회
		@GetMapping("/listAllDrug")
		public String listAllDrug(Model model, Criteria cri) throws Exception {
			
			log.info("drugListGET");
			log.info("cri : " + cri);
			
			List<DrugInfoVO> drugList = dservice.getDrugListPaging(cri);
			model.addAttribute("drugList", drugList);
			
			int total = dservice.getTotal(cri);
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			
			model.addAttribute("pageMaker", pageMake);
			
			return "admin/a_listAllDrugInfoView";
				}
		//약 정보 상세조회
		@RequestMapping("/a_drugDetailView/{drugInfoNo}")
		public String drugDetailView(@PathVariable String drugInfoNo, Model model) {
			DrugInfoVO vo = dservice.detailViewDrug(drugInfoNo);
			model.addAttribute("drug", vo);
			return "admin/a_drugDetailView";
		}
		
		//관리자 메뉴- 약모양 전체 조회
		@GetMapping("/listAllDrugShpae")
		public String listAllDrugShpae(Model model, Criteria cri) throws Exception {
			
			log.info("shapeListGET");
			log.info("cri : " + cri);
			
			List<DrugShapeVO> shapeList = sservice.getShapeListPaging(cri);
			model.addAttribute("shapeList", shapeList);
			
			int total = sservice.getTotal(cri);
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			
			model.addAttribute("pageMaker", pageMake);
			
			return "admin/a_listAllDrugShapeView";
		}
		
		//관리자 메뉴 - 게시판
		@RequestMapping("/a_listAllBoard")
		public String a_listAllBoard(Model model) {
			ArrayList<BoardVO> boardList = bservice.a_listAllBoard();
			model.addAttribute("boardList", boardList);
			return "admin/a_listAllBoardView";
		}
		
		
}
