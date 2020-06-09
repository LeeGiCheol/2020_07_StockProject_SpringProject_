package com.bitcamp.project.view.user;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.project.vo.UserVO;
 
@Controller
public class MailController {
	public static String EmailNumStr = ""; //난수가 저장될 변수
    @Autowired
    private JavaMailSender mailSender;
    
    @RequestMapping(value="/user/mail")
    public String sendMail(UserVO vo){
        MimeMessage message = mailSender.createMimeMessage();
        Random rand = new Random();
	    for(int i=0;i<4;i++) {
	        //0~9 까지 난수 생성
	        String ran = Integer.toString(rand.nextInt(10));
	        EmailNumStr += ran;
	    }
        try {
            message.setSubject("FanstayStock입니다. 비밀번호찾기이메일입니다.");
            message.setText("안녕하세요.\n인증번호는 ["+EmailNumStr+"] 입니다.\n인증번호입력창에 입력해주세요.");
            message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(vo.getId()));
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return "/forgetpasswordpage-try-success";
    }
}