/*
*	@FileName : JoinService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.16
*	@Author	: 박문수
*	@Discription : 회원가입 페이지 Service
*/

package kr.or.bus.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.ApproveDTO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.ResRecordDTO;

@Service
public class JoinService {
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public void join3(MDetailDTO ddto , MemberDTO mdto , ResRecordDTO rdto , HttpServletRequest request) throws IOException{
		
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		System.out.println(rdto.toString());
		
		System.out.println(ddto.getFiles().get(0).getName());
		System.out.println(ddto.getFiles().get(1).getName());
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		List<CommonsMultipartFile> files = ddto.getFiles();
		List<String> filenames = new ArrayList<String>();
		
		if (files != null && files.size() > 0) { // 업로드한 파일이 하나라도 있다면

			for (CommonsMultipartFile multipartfile : files) {

				String fname = multipartfile.getOriginalFilename(); // 파일명 얻기
				String path = request.getServletContext().getRealPath("/join/upload");
				String fullpath = path + "\\" + fname;

				System.out.println(fname + " / " + path + " / " + fullpath);

				if (!fname.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fullpath);
					fs.write(multipartfile.getBytes());
					fs.close();
				}
				filenames.add(fname); // 실 DB Insert 작업시 .. 파일명
			}

		  }
		
		ddto.setM_license(filenames.get(0));
		ddto.setM_photo(filenames.get(1));
		
		//비밀번호 암호화
		mdto.setM_pw(this.bCryptPasswordEncoder.encode(mdto.getM_pw()));
		
		dao.insertMember(mdto);
		dao.insertDetail(ddto);
	}
	
	
	public String checkid(String m_id){
		System.out.println("m_id : " + m_id);
		String check = "n";
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		System.out.println("check id 여부 : " + dao.checkId(m_id));
		if(dao.checkId(m_id) > 0){
			check = "y";
			System.out.println(check + "됨");
		}
		
		return check;
	}
	
	
	public void popup(String m_email) throws AddressException, MessagingException{
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
	}
	
	
	public String checkEmail(String m_echeck){
		System.out.println("m_echeck :" + m_echeck);
		
		String echeck = "n";
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		if(dao.emailCheck(m_echeck) > 0){
			echeck = "y";
		}

		return echeck;
	}
	
	public void checkEmail(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int rndnum = (int) (Math.random() * 9000) + 1000;
		String a_num = String.valueOf(rndnum);
		dao.updateApp(a_num);
	}
}
