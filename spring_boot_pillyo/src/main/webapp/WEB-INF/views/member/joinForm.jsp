<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<body>
		
		 <div id="joinBox">
        <h2>회원가입</h2>
        <hr>
        <form name="newMemberForm" id="joinForm" method="post" action="<c:url value='/member/joinMember' />">
            <table> 
                <tr>
                    <th>아이디</th>
                    <td id="idBox">
                        <input type="text" name="userId" id="id" placeholder="아이디(6~10자 입력)">
                        <input type="button" id="idCheckBtn" value="중복확인">
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td id="pwBox">
                        <input type="password" name="userPw" id="password" placeholder="비밀번호">
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td id="pwChkBox">
                        <input type="password" name="userPwChk" id="passwordChk" placeholder="비밀번호확인">
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td id="nameBox">
                        <input type="text" name="userName" id="userName" placeholder="이름">    
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td id="gengerBox">
                        <input type="radio" name="userGender" id="userGender" value="남성">남성    
                        <input type="radio" name="userGender" id="userGender" value="여성">여성    
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td id="birthBox">
                        <input type="text" name="userBirth" id="userBirth" placeholder="yyyy-mm-dd">    
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td id="emailBox">
                        <input type="text" name="userEmail" id="email" placeholder="이메일">@
                        <select name="email" id="emailSelect">
                            <option value="선택하세요">선택하세요</option>
                            <option value="gmail">gmail.com</option>
                            <option value="naver" >naver.com</option>
                            <option value="hanmail">hanmail.net</option>
                            <option value="nate">nate.com</option>
                        </select>   
                    </td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td id="hpBox">
                        <input type="text" id="userHp1" name="userHp1" maxlength="3" size="10"> 
                        - <input type="text" id="userHp2" name="userHp2" maxlength="4" size="10">
                        - <input type="text" id="userHp3" name="userHp3" maxlength="4" size="10"> 
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td id=addressBox>
                        <input type="text" id="zipcode" name="memZipcode" placeholder="우편번호"> &nbsp;
                        <input type="button" id="searchZip" name="searchZip" value="우편번호찾기" readonly><br>
                        <input type="text"  id="address1"  name="memAddress1" size="70" placeholder="주소 입력" readonly><br> 
                        <input type="text" id="address2"  name="memAddress2" size="70" placeholder="상세 주소 입력">
                    </td>
                </tr>	
                <tr>
                    <th>동의</th>
                    <td>
                        <label><input type="checkbox" name="agreement" id="agreement1" value="모든약관" >모든 약관에 동의</label>
                        <label><input type="checkbox" name="agreement" id="agreement2" value="개인정보">개인정보 이용 동의</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" id="joinButton">회원가입</button>
                        <button type="reset" id="cancel">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
		
		
	</body>
</html>