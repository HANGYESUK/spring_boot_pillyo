package com.pillyo.pill.service.notification;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class SENSService {
	// SMS 전송 : 기상 직후
	//public static void sendSMS_getup(String notiMemHp) {
		public static void sendSMS(HashMap<String, String> memInfo) {
			String doseFamName = memInfo.get("name");
			String notiMemHp = memInfo.get("hp");
			String reserveTime = memInfo.get("rTime");
			String msgContent = "[Pill-Yo 복용 알림 서비스] " + doseFamName + "님, 까먹지 말고 약 복용하세요!!!";
			
		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "2EB4FA620F6AE3E1332B";
		String secretKey = "96A6282CDC95EB01E57883FFBDF77C1005519AFF";
		String serviceId = "ncp:sms:kr:274025242511:pillyo_notification";
		String method = "POST";
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		
		// ------ messages ------
//			toJson.put("subject", ""); // 메시지 제목 (LMS에서만 사용 가능)
		toJson.put("content", msgContent); // 실제 전송되는 메시지 내용 (SMS 80 byte 제한)
		toJson.put("to", notiMemHp); // 수신번호 목록 (필수, 최대 50개까지 한번에 전송 가능)
		toArr.add(toJson);
		// ------ messages ------
		
		
		bodyJson.put("type", "SMS"); // 메시지 타입 (sms, lms)
//			bodyJson.put("contentType", ""); // 메시지 내용 타입 (COMM: 일반메시지 | AD: 광고메시지 | (default: COMM))
		bodyJson.put("countryCode", "82"); // 국가 번호 (default: 82))
		bodyJson.put("from", "01054673724"); // 발신번호 (사전에 등록된 발신번호만 사용 가능)
//			bodyJson.put("subject", ""); // 기본 메시지 제목 (lms)
		bodyJson.put("content", msgContent); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("messages", toArr); // 메시지 정보 (필수)
		bodyJson.put("reserveTime", reserveTime); // 예약시간 , "yyyy-MM-dd HH:mm" 형식
		
		
		String body = bodyJson.toJSONString();
		System.out.println("메세지 body : " + body);
		
		try {
			URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("메세지 전송 responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
	        
            // response 출력
            System.out.println("메세지 전송 response : " + response.toString());
            
            // response에서 requestId 추출 -> string으로 변환 ********************************
            String requestId = getRequestId(response.toString());
            
            // 메시지 발송 요청 조회 (오류)
//	            selectMsgSendRequest(hostNameUrl, requestUrl, timestamp, accessKey, secretKey, requestId);
            
        } catch (Exception e) {
            System.out.println(e);
        }
	}
	
		
// ---------------------------------------------------------------------------------------------
	// SMS 전송 : 아침
	public static void sendSMS_morning(String notiMemHp) {
		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "2EB4FA620F6AE3E1332B";
		String secretKey = "96A6282CDC95EB01E57883FFBDF77C1005519AFF";
		String serviceId = "ncp:sms:kr:274025242511:pillyo_notification";
		String method = "POST";
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		
		// ------ messages ------
//				toJson.put("subject", ""); // 메시지 제목 (LMS에서만 사용 가능)
		toJson.put("content", "[Pill-Yo 복용 알림 서비스] 아침식사는 맛있게 하셨나요? 복용 목록도 확인해주세요!"); // 실제 전송되는 메시지 내용 (SMS 80 byte 제한)
		toJson.put("to", notiMemHp); // 수신번호 목록 (필수, 최대 50개까지 한번에 전송 가능)
		toArr.add(toJson);
		// ------ messages ------
		
		
		bodyJson.put("scheduleCode", "morning"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("type", "SMS"); // 메시지 타입 (sms, lms)
//				bodyJson.put("contentType", ""); // 메시지 내용 타입 (COMM: 일반메시지 | AD: 광고메시지 | (default: COMM))
		bodyJson.put("countryCode", "82"); // 국가 번호 (default: 82))
		bodyJson.put("from", "01054673724"); // 발신번호 (사전에 등록된 발신번호만 사용 가능)
//				bodyJson.put("subject", ""); // 기본 메시지 제목 (lms)
		bodyJson.put("content", "[Pill-Yo 복용 알림 서비스] 아침식사는 맛있게 하셨나요? 복용 목록도 확인해주세요!"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("messages", toArr); // 메시지 정보 (필수)
		
		String body = bodyJson.toJSONString();
		System.out.println("메세지 body : " + body);
		
		try {
			URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("메세지 전송 responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
	        
            // response 출력
            System.out.println("메세지 전송 response : " + response.toString());
            
            // response에서 requestId 추출 -> string으로 변환 ********************************
            String requestId = getRequestId(response.toString());
            
            // 메시지 발송 요청 조회 (오류)
//		            selectMsgSendRequest(hostNameUrl, requestUrl, timestamp, accessKey, secretKey, requestId);
            
        } catch (Exception e) {
            System.out.println(e);
        }
	}
	
	// SMS 전송 : 점심
	public static void sendSMS_lunch(String notiMemHp) {
		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "2EB4FA620F6AE3E1332B";
		String secretKey = "96A6282CDC95EB01E57883FFBDF77C1005519AFF";
		String serviceId = "ncp:sms:kr:274025242511:pillyo_notification";
		String method = "POST";
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		
		// ------ messages ------
//				toJson.put("subject", ""); // 메시지 제목 (LMS에서만 사용 가능)
		toJson.put("content", "[Pill-Yo 복용 알림 서비스] 나른한 오후, 설마 점심 약.... 까먹으신건 아니죠..?"); // 실제 전송되는 메시지 내용 (SMS 80 byte 제한)
		toJson.put("to", notiMemHp); // 수신번호 목록 (필수, 최대 50개까지 한번에 전송 가능)
		toArr.add(toJson);
		// ------ messages ------
		
		
		bodyJson.put("scheduleCode", "lunch"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("type", "SMS"); // 메시지 타입 (sms, lms)
//				bodyJson.put("contentType", ""); // 메시지 내용 타입 (COMM: 일반메시지 | AD: 광고메시지 | (default: COMM))
		bodyJson.put("countryCode", "82"); // 국가 번호 (default: 82))
		bodyJson.put("from", "01054673724"); // 발신번호 (사전에 등록된 발신번호만 사용 가능)
//				bodyJson.put("subject", ""); // 기본 메시지 제목 (lms)
		bodyJson.put("content", "[Pill-Yo 복용 알림 서비스] 나른한 오후, 설마 점심 약.... 까먹으신건 아니죠..?"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("messages", toArr); // 메시지 정보 (필수)
		
		String body = bodyJson.toJSONString();
		System.out.println("메세지 body : " + body);
		
		try {
			URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("메세지 전송 responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
	        
            // response 출력
            System.out.println("메세지 전송 response : " + response.toString());
            
            // response에서 requestId 추출 -> string으로 변환 ********************************
            String requestId = getRequestId(response.toString());
            
            // 메시지 발송 요청 조회 (오류)
//		            selectMsgSendRequest(hostNameUrl, requestUrl, timestamp, accessKey, secretKey, requestId);
            
        } catch (Exception e) {
            System.out.println(e);
        }
	}

	// SMS 전송 : 저녁
	public static void sendSMS_dinner(String notiMemHp) {
		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "2EB4FA620F6AE3E1332B";
		String secretKey = "96A6282CDC95EB01E57883FFBDF77C1005519AFF";
		String serviceId = "ncp:sms:kr:274025242511:pillyo_notification";
		String method = "POST";
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		
		// ------ messages ------
//				toJson.put("subject", ""); // 메시지 제목 (LMS에서만 사용 가능)
		toJson.put("content", "[Pill-Yo 복용 알림 서비스] 오늘도 수고하셨어요! 약 복용도 까먹지 말아주세요~"); // 실제 전송되는 메시지 내용 (SMS 80 byte 제한)
		toJson.put("to", notiMemHp); // 수신번호 목록 (필수, 최대 50개까지 한번에 전송 가능)
		toArr.add(toJson);
		// ------ messages ------
		
		
		bodyJson.put("scheduleCode", "dinner"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("type", "SMS"); // 메시지 타입 (sms, lms)
//				bodyJson.put("contentType", ""); // 메시지 내용 타입 (COMM: 일반메시지 | AD: 광고메시지 | (default: COMM))
		bodyJson.put("countryCode", "82"); // 국가 번호 (default: 82))
		bodyJson.put("from", "01054673724"); // 발신번호 (사전에 등록된 발신번호만 사용 가능)
//				bodyJson.put("subject", ""); // 기본 메시지 제목 (lms)
		bodyJson.put("content", "[Pill-Yo 복용 알림 서비스] 오늘도 수고하셨어요! 약 복용도 까먹지 말아주세요~"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("messages", toArr); // 메시지 정보 (필수)
		
		String body = bodyJson.toJSONString();
		System.out.println("메세지 body : " + body);
		
		try {
			URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("메세지 전송 responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
	        
            // response 출력
            System.out.println("메세지 전송 response : " + response.toString());
            
            // response에서 requestId 추출 -> string으로 변환 ********************************
            String requestId = getRequestId(response.toString());
            
            // 메시지 발송 요청 조회 (오류)
//		            selectMsgSendRequest(hostNameUrl, requestUrl, timestamp, accessKey, secretKey, requestId);
            
        } catch (Exception e) {
            System.out.println(e);
        }
	}
	
	// SMS 전송 : 저녁
	public static void sendSMS_beforeBed(String notiMemHp) {
		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "2EB4FA620F6AE3E1332B";
		String secretKey = "96A6282CDC95EB01E57883FFBDF77C1005519AFF";
		String serviceId = "ncp:sms:kr:274025242511:pillyo_notification";
		String method = "POST";
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		
		// ------ messages ------
//				toJson.put("subject", ""); // 메시지 제목 (LMS에서만 사용 가능)
		toJson.put("content", "[Pill-Yo 복용 알림 서비스] 오늘의 복용 목록을 점검해주세요. 좋은 밤 되세요 : )"); // 실제 전송되는 메시지 내용 (SMS 80 byte 제한)
		toJson.put("to", notiMemHp); // 수신번호 목록 (필수, 최대 50개까지 한번에 전송 가능)
		toArr.add(toJson);
		// ------ messages ------
		
		
		bodyJson.put("scheduleCode", "beforeBed"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("type", "SMS"); // 메시지 타입 (sms, lms)
//				bodyJson.put("contentType", ""); // 메시지 내용 타입 (COMM: 일반메시지 | AD: 광고메시지 | (default: COMM))
		bodyJson.put("countryCode", "82"); // 국가 번호 (default: 82))
		bodyJson.put("from", "01054673724"); // 발신번호 (사전에 등록된 발신번호만 사용 가능)
//				bodyJson.put("subject", ""); // 기본 메시지 제목 (lms)
		bodyJson.put("content", "[Pill-Yo 복용 알림 서비스] 오늘의 복용 목록을 점검해주세요. 좋은 밤 되세요 : )"); // 기본 메시지 내용 (필수) (SMS 80 byte 제한)
		bodyJson.put("messages", toArr); // 메시지 정보 (필수)
		
		String body = bodyJson.toJSONString();
		System.out.println("메세지 body : " + body);
		
		try {
			URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("메세지 전송 responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
	        
            // response 출력
            System.out.println("메세지 전송 response : " + response.toString());
            
            // response에서 requestId 추출 -> string으로 변환 ********************************
            String requestId = getRequestId(response.toString());
            
            // 메시지 발송 요청 조회 (오류)
//		            selectMsgSendRequest(hostNameUrl, requestUrl, timestamp, accessKey, secretKey, requestId);
            
        } catch (Exception e) {
            System.out.println(e);
        }
	}
		
	// 시그니처 키 얻는 함수
	private static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}
	  return encodeBase64String;
	}
	
	// response에서 requestId 추출 -> string으로 변환하는 함수
	public static String getRequestId(String jsonResponse){
		String requestId = "";
		
		try {
			// requestId 추출
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonResponse);
			requestId = (String) jsonObj.get("requestId");
			System.out.println("메세지 전송 response에서 추출한 requestId : " + requestId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return requestId;
	}

// X --------------------------------------------------------------------------------------------
/*
	// 메시지 발송 요청 조회
	private static void selectMsgSendRequest(String hostNameUrl, String requestUrl, String timestamp, String accessKey, String secretKey, String requestId) throws NoSuchAlgorithmException, InvalidKeyException {
		
		String requestIdUrl = "?" + requestId + "=";
		String method = "GET";
		
		// 요청 URL
		String sendRequestUrl = hostNameUrl + requestUrl + requestIdUrl;
		System.out.println("메세지 발송 요청 조회 - 요청 url : " + sendRequestUrl);
		
		try {
			URL url = new URL(sendRequestUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
//            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//            
//            wr.write(body.getBytes());
//            wr.flush();
//            wr.close();

            // 여기서부터 오류 발생하는듯
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("메시지 발송 요청 조회 responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
	        
            // response 출력
            System.out.println("메시지 발송 요청 결과 조회 response : " + response.toString());
            
        } catch (Exception e) {
            System.out.println(e);
        }

	}
	
	// '메시지 발송 요청 조회' 결과로 얻은 json형태 response에서 messageId 추출
//	public static String getMessageId(String jsonResponse){
//		String messageId = "";
//		
//		try {
//			// JSON 형태의 문자열에서 JSON 오브젝트 "predictions" 추출해서 JSONArray에 저장
//			JSONParser jsonParser = new JSONParser();
//			JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonResponse);
//			requestId = (String) jsonObj.get("requestId");
//			System.out.println("requestId : " + requestId);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}		
//		return requestId;
//	}

*/
}