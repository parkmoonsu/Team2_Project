/*
*	@FileName : LoginService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.17
*	@Author	: 박문수
*	@Discription : 로그인 페이지 Service
*/


package kr.or.bus.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.ApproveDTO;
import kr.or.bus.dto.MemberJoinJobDTO;

@Service
public class LoginService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public String searchName(String m_name , String m_email) throws Exception{
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		String m_id = "";
		
		//0보다 크다면  매칭된 ID가 있는것
		if(dao.searchNameEmail(m_name,m_email) > 0){
			m_id = dao.searchId(m_name, m_email).getM_id();
			
			MimeMessage mimemessage = mailSender.createMimeMessage();
			mimemessage.setSubject("KOSBUS 회원님 ID 입니다.", "utf-8");
			
			String htmlContent = "<div style = 'text-align:center;'>";
			htmlContent += "<img src = 'http://kmug.co.kr/board/data/illust/1223534233/%B5%B8%BA%B8%B1%E2.jpg'><br>";
			htmlContent +=	"<h2>KOSBUS 회원님의 ID는 <br> <font color = 'blue'><strong>" + m_id + "</strong></font>입니다.</h2></div>";

			mimemessage.setText(htmlContent, "utf-8", "html");
			
			mimemessage.addRecipient(RecipientType.TO, new InternetAddress(m_email));
			mailSender.send(mimemessage);
		
		}else{
			m_id = "";
		}
		
		return m_id;
	}
	
	public String searchPw(String m_id , String m_email) throws Exception{
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		String check ="굿";
		char temp1 = (char)(Math.random()*10 + 48);
		char temp2 = (char)(Math.random()*26 + 65);
		char temp3 = (char)(Math.random()*16 + 97);
		char temp4 = (char)(Math.random()*26 + 65);
		char temp5 = (char)(Math.random()*16 + 97);
		char temp6 = (char)(Math.random()*10 + 48);
		char temp7 = (char)(Math.random()*10 + 48);
		String temp = String.valueOf(temp1)
					+ String.valueOf(temp2) 
					+ String.valueOf(temp3) 
					+ String.valueOf(temp4) 
					+ String.valueOf(temp5) 
					+ String.valueOf(temp6) 
					+ String.valueOf(temp7);
		
		if(dao.searchIdEmail(m_id, m_email) > 0){
			
			MimeMessage mimemessage = mailSender.createMimeMessage();
			mimemessage.setSubject("KOSBUS"+ dao.getName(m_id).getM_name() +"님 비밀번호 입니다.", "utf-8");
			
			String htmlContent = "<div style = 'text-align:center;'>";
			htmlContent += "<img src = 'http://kmug.co.kr/board/data/illust/1223534233/%B5%B8%BA%B8%B1%E2.jpg'><br>";
			htmlContent +=	"<h2>KOSBUS 회원님의 임시 비밀번호는 <br> <font color = 'blue'><strong>" + temp + "</strong></font>입니다.<br>"
					+ "로그인 후 비밀번호를 변경해주세요.</h2></div>";

			mimemessage.setText(htmlContent, "utf-8", "html");
			
			mimemessage.addRecipient(RecipientType.TO, new InternetAddress(m_email));
			mailSender.send(mimemessage);
			
			temp = this.bCryptPasswordEncoder.encode(temp);
			dao.updatePw(m_id, temp);
		}else{
			check = "";
		}
		
		return check;
	}
	
	public MemberJoinJobDTO mainGo(String username){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberJoinJobDTO dto = dao.getJobName(username);
		
		return dto;
	}
}
