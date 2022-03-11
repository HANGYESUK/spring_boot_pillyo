package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.pillyo.pill.model.DrugInfoVO;
import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.paging.Criteria;

public interface IUserService {
	// 추상메서드 작성 후 MemberService 파일 생성 (implements)

	// 로그인
	UserVO loginCheck(HashMap<String, Object> map);
	String userIdCheck(String userId);
	UserVO detailUserView(String userId);	// 회원 상세 정보
	void updateUser(UserVO vo);	// 회원 정보 수정
	void deleteUser(String userId);	// 회원 정보 삭제
	String userEmailCheck(String email); // 이메일 중복 확인
	void userJoin(UserVO vo); // 회원가입
	
	
	// 관리자 메뉴
	ArrayList<UserVO> listAllUser();
	int userCount();
	
	// 아이디, 비밀번호 찾기
	UserVO findUserId(HashMap<String, Object> map); // 아이디
	UserVO findUserPw(HashMap<String, Object> map); // 비밀번호
	
	/* 페이징처리 */
	// 게시물 총 갯수
	int getTotal(Criteria cri);

	// 페이징 처리 게시글 조회
	List<UserVO> getUserListPaging(Criteria cri) throws Exception;
}
