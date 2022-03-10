package com.pillyo.pill.service.notification;

import com.pillyo.pill.model.notification.notificationVO;

public interface INotificationService {
	void joinNotiDefault(String userId); // 회원가입 시 복용 알림 default 값 추가
	notificationVO detailNoti(String userId);	// 알림 상세 정보
	void updateNoti(notificationVO notificationVO); // 알림 정보 수정
}
