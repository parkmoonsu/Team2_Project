/*
*	@FileName : MemberManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.21
*	@Author	: 박문수
*	@Discription : 회원 관리 페이지 Service
*/



package kr.or.bus.service;

import java.io.File;
import java.util.List;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberJoinMDetailDTO;

@Service
public class MemberManageService {
	
private JavaMailSender mailSender;
	
	@Autowired
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<MemberJoinMDetailDTO> memberInfo(String pg){
		System.out.println("파라미터로 넘어오는 pg : " + pg);
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		List<MemberJoinMDetailDTO> list = dao.memberList(page);
		System.out.println(list.get(1).toString());
		return list;
	}
	
	public int memberCount(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int size = dao.memberCount();
		
		return size;
	}
	
	public void mailSendToMember(String subject, String to, String content, MultipartFile filename){
		MimeMessage message = mailSender.createMimeMessage();
		try{
			System.out.println("파일네임 : " + filename);
			MimeMessageHelper messageHelper = 
					new MimeMessageHelper(message,true,"utf-8");
			messageHelper.setSubject(subject);
			String htmlContent = content;
			messageHelper.setText(htmlContent,true);
			messageHelper.setFrom("heyzenmate@gmail.com", "운영자");
			messageHelper.setTo(new InternetAddress(to,"utf-8"));
			
		    File newfile=new File(filename.getOriginalFilename());
		    filename.transferTo(newfile);

		    DataSource dataSource=new FileDataSource(newfile);
		    messageHelper.addAttachment(
		    		MimeUtility.encodeText(filename.getOriginalFilename(), "utf-8", "B")
		    								, dataSource);

		    mailSender.send(message);

		}catch(Exception e){
			System.out.println("fileupload error");
			e.printStackTrace();
		}
	}
}
