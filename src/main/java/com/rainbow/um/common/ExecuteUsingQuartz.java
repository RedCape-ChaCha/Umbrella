package com.rainbow.um.common;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


public class ExecuteUsingQuartz {
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	public void sendMessage() throws Exception {
		String setFrom = "rkd1rjs2@gmail.com"; //보내는 사람
		String toMail = "rkd1rjs2@naver.com";
		String title ="휴면계정 정지 안내";
		String content = "배치테스트";
		MimeMessage message = mailSender.createMimeMessage(); //메일 보내는 객체
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom(setFrom); //보내는 사람 주소, 생략하거나 입력안하면 작동 되지 않음
		messageHelper.setTo(toMail); //받는 사람의 주소
		messageHelper.setSubject(title); //제목 , 생략가능
		messageHelper.setText(content, true); //messageHelper.setText(content); //전송 내용 //setText(content,boolean(default는 false,html사용여부));
		mailSender.send(message);
	}
}
