package com.bitcamp.project.view.user;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API
 *        PHP
 */

public class SignUpSend {
	public static String signUpNumStr = ""; // 난수가 저장될 변수

	public void sendSMS(String tel) {
		Random rand = new Random();
		String ranNum = Integer.toString(rand.nextInt(8) + 1);
		for (int i = 0; i < 5; i++) {
			ranNum += Integer.toString(rand.nextInt(9));
		}
		
		String ran = ranNum;
		signUpNumStr = ran;
		System.out.println("생성된 난수 : " + signUpNumStr);
		String api_key = "NCSWBLOT0NJDJV6L";
		String api_secret = "HLDLYIETNBAFMSP7YRM2OHK2M5CH2NMJ";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", tel);
		params.put("from", "01064902806"); // 무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", "FantasyStock 회원가입 인증번호 입니다. \n인증번호는 [ " + signUpNumStr + " ]입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}