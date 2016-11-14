/*
*	@FileName : JoinController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : 회원가입 페이지 Controller
*/

package kr.or.bus.controller;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bus.dao.MemberDAO;

@Controller
public class JoinController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;

	
	@RequestMapping("/join.htm")
	public String join(){
		return "join";
	}
	
	@RequestMapping(value="/checkid.htm",method=RequestMethod.POST)
	public String checkid(String m_id , Model model){
		System.out.println("m_id : " + m_id);
		String check = "n";
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		System.out.println("check id 여부 : " + dao.checkId(m_id));
		if(dao.checkId(m_id) > 0){
			check = "y";
			System.out.println(check + "됨");
		}
		model.addAttribute("check", check);
		
		return "checkid";
	}
	
	@RequestMapping("/popup.htm")
	public String popup(String m_email) throws AddressException, MessagingException{
		MimeMessage mimemessage = mailSender.createMimeMessage();
		mimemessage.setSubject("KOSBUS 인증번호입니다.", "utf-8");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		String num = dao.emailApp();
		String htmlContent ="<img src = '${pageContext.request.contextPath}/images/logo2.png'><br>KOSBUS 이메일 인증번호는<br> <font color = 'green'>" + num + "</font>입니다.";
		mimemessage.setText(htmlContent, "utf-8", "html");
		
		mimemessage.addRecipient(RecipientType.TO, new InternetAddress(m_email));
		mailSender.send(mimemessage);
		
		return "popup";
	}
	
}
