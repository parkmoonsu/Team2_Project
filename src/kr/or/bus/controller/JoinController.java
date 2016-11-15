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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.ApproveDTO;
import kr.or.bus.dto.JoinDTO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.ResRecordDTO;

@Controller
public class JoinController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
	
	@RequestMapping("/join.htm")
	public String join(){
		return "join/join1";
	}
	
	@RequestMapping("/join2.htm")
	public String join2(){
		return "join/join2";
	}
	
	@RequestMapping(value="/join3.htm",method=RequestMethod.POST)
	public String join3(MDetailDTO ddto , MemberDTO mdto , ResRecordDTO rdto){
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		System.out.println(rdto.toString());
		
		return "join/join3";
	}
	
	@RequestMapping(value="/checkid.htm",method=RequestMethod.POST)
	public View checkid(String m_id , Model model){
		System.out.println("m_id : " + m_id);
		String check = "n";
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		System.out.println("check id 여부 : " + dao.checkId(m_id));
		if(dao.checkId(m_id) > 0){
			check = "y";
			System.out.println(check + "됨");
		}
		model.addAttribute("check", check);
		
		return jsonview;
	}
	
	@RequestMapping(value="/popup.htm",method=RequestMethod.POST)
	public View popup(String m_email) throws AddressException, MessagingException{
		System.out.println("이메일 : " + m_email);
		
		MimeMessage mimemessage = mailSender.createMimeMessage();
		mimemessage.setSubject("KOSBUS 인증번호입니다.", "utf-8");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		ApproveDTO dto = dao.emailApp();
		System.out.println("num : " + dto.getA_num());
		String htmlContent ="<img src = '${pageContext.request.contextPath}/images/logo2.png'><br>KOSBUS 이메일 인증번호는<br> <font color = 'green'>" + dto.getA_num() + "</font>입니다.";
		mimemessage.setText(htmlContent, "utf-8", "html");
		
		mimemessage.addRecipient(RecipientType.TO, new InternetAddress(m_email));
		mailSender.send(mimemessage);
		
		return jsonview;
	}
	
	@RequestMapping(value="/echeck.htm",method=RequestMethod.POST)
	public View checkEmail(String m_echeck , Model model){
		System.out.println("m_echeck :" + m_echeck);
		
		String echeck = "n";
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		if(dao.emailCheck(m_echeck) > 0){
			echeck = "y";
		}
		
		model.addAttribute("echeck", echeck);
		return jsonview;
	}
	
	@RequestMapping(value="/updateapp",method=RequestMethod.POST)
	public View CheckEmail(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int rndnum = (int) (Math.random() * 9000) + 1000;
		String a_num = String.valueOf(rndnum);
		dao.updateApp(a_num);
		
		return jsonview;
	}
	
}
