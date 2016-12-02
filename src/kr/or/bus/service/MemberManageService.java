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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinMDetailRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;

@Service
public class MemberManageService {
	
private JavaMailSender mailSender;
	
	@Autowired
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public List<MemberJoinMDetailDTO> memberInfo(String pg){
		System.out.println("회원 정보 페이지");
		System.out.println("파라미터로 넘어오는 pg : " + pg);
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		List<MemberJoinMDetailDTO> list = dao.memberList(page);

		return list;
	}
	
	public int pg(String pg){
		int page = 1;
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		return page;
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

	public List<MemberJoinMDetailDTO> memberNList(String pg){
		System.out.println("회원가입승인 페이지");
		System.out.println("파라미터로 넘어오는 pg : " + pg);
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		List<MemberJoinMDetailDTO> list = dao.memberNList(page);
		System.out.println(list);
		return list;
	}
	public int memberNCount(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int size = dao.memberNCount();
		
		return size;
	}

	//승인여부 y 로 바꾸고 권한 부여
	public void updateCheck(String m_id){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.updateCheck(m_id);
		dao.insertAuth(m_id);
	}
	
	public MemberJoinMDetailRegulOffDTO memberDetail(String m_id, String o_date){
		System.out.println("service 탓니?");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberJoinMDetailRegulOffDTO dto = dao.getMemberDetailRegulOff(m_id, o_date);
		System.out.println("dto"+dto);
		return dto;
	}
	
	//휴무 부여받지 않은 사람의 정보
	public MemberJoinMDetailRegulOffDTO memberDetailnoReg(String m_id){
		System.out.println("service 탓니?");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberJoinMDetailRegulOffDTO dto = dao.getMemberDetail(m_id);
		System.out.println("dto"+dto);
		return dto;
	}
	
	public List<MemberJoinRegulOffrDTO> memberreguloffr(String m_id){
		System.out.println("memberreguloffr 서비스 시작");
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		List<MemberJoinRegulOffrDTO> list = dao.getRegulOffr(m_id);
		System.out.println("list"+list);
		return list;
	}

	  public void delete(String m_id){
	      MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
	      dao.deleteAuthority(m_id);
	      dao.deleteReguloff(m_id);
	      dao.deleteCommute(m_id);
	      dao.deleteRealoff(m_id);
	      dao.deleteResrecord(m_id);
	      dao.deleteMdetail(m_id);
	      dao.deleteMember(m_id);
	      
	      System.out.println("delete서비스 타나욧?");
	   }
	  
	  public List<MemberJoinResRecordDTO> getResRecordInfo(String m_id){
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			List<MemberJoinResRecordDTO> list = dao.getResRecordInfo(m_id);
			for(int i=0 ;i<list.size();i++){
				System.out.println("이력기간"+list.get(i).getRes_start());
				System.out.println("이력회사"+list.get(i).getRes_com());
			}
			return list;
		}
	  
	  
		public boolean getPass(String m_id , String m_pw){
			MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
			String pw = dao.passMatch(m_id).getM_pw();
			
			System.out.println("m_pw : " + m_pw);
			System.out.println("encodePass : " + pw);
			
			boolean result = bCryptPasswordEncoder.matches(m_pw, pw);
			
			return result;
		}

		public MemberJoinMDetailDTO getMemberInfo(String m_id){
			System.out.println("m_id : " + m_id);
			MemberDAO dao =sqlsession.getMapper(MemberDAO.class);
			MemberJoinMDetailDTO dto = dao.getMemberInfo(m_id);

			
			return dto;
		}
}
