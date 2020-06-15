package com.bitcamp.project.view.user;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class ExampleSend {
  public static String numStr = ""; //난수가 저장될 변수
  public static void main(String[] args, String tel) {
	  Random rand = new Random();
	    for(int i=0;i<4;i++) {
	        //0~9 까지 난수 생성
	        String ran = Integer.toString(rand.nextInt(10000));
	            numStr = ran;
	    }
	    System.out.println("생성된 난수(인증번호) : " + numStr);
    String api_key = "NCSWBLOT0NJDJV6L";
    String api_secret = "HLDLYIETNBAFMSP7YRM2OHK2M5CH2NMJ";
    Message coolsms = new Message(api_key, api_secret);
    
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", tel);
    params.put("from", "01064902806"); //무조건 자기번호 (인증)
    params.put("type", "SMS");
    params.put("text", "FanstayStock \n인증번호는 [ "+numStr+" ]입니다.");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
    	//send() 는 메시지를 보내는 함수  
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
}