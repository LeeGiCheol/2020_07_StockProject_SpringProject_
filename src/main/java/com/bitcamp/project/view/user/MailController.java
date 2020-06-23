package com.bitcamp.project.view.user;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.project.vo.UserVO;
 
@Controller
public class MailController {
	public static String EmailNumStr = ""; //난수가 저장될 변수
    @Autowired
    private JavaMailSender mailSender;
    
    @RequestMapping(value="/user/mail")
    public String sendMail(UserVO vo, Model model){
        MimeMessage message = mailSender.createMimeMessage();
        String ran = Integer.toString((int)(Math.random()*9000)+1000);
        EmailNumStr = ran;
        System.out.println("생성된 난수 : " + EmailNumStr);
        try {
            message.setSubject("FanstayStock입니다. 비밀번호찾기이메일입니다.");
            message.setText("안녕하세요.\n인증번호는 ["+EmailNumStr+"] 입니다.\n인증번호입력창에 입력해주세요.");
            message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(vo.getId()));
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        model.addAttribute("msg", "이메일을 확인중입니다.");
		model.addAttribute("icon", "success");
		model.addAttribute("location", "/forgetPasswordTry");
        return "/msg";
    }
}