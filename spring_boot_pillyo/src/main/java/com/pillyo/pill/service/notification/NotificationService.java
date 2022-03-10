package com.pillyo.pill.service.notification;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.notification.INotificationDAO;
import com.pillyo.pill.model.UserVO;
import com.pillyo.pill.model.notification.notificationVO;

@Service
public class NotificationService implements INotificationService {
	@Autowired
	@Qualifier("INotificationDAO")
	INotificationDAO dao;
	
	@Override
	public void joinNotiDefault(String userId) {
		// 회원가입 시 복용 알림 default 값 추가
		dao.joinNotiDefault(userId);
	}
	
	@Override
	public ArrayList<UserVO> notiRcvMember() {
		// 알림 수신 회원 목록
		return dao.notiRcvMember();
	}
	
	//-----------------------------------------------------------
	@Override
	public void updateNoti(notificationVO notificationVO) {
		// 알림 정보 수정
		dao.updateNoti(notificationVO);
	}
	
	@Override
	public notificationVO detailNoti(String userId) {
		// 알림 상세 정보
		return dao.detailNoti(userId);
	}
}
