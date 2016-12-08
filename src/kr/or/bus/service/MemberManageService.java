/*
*	@FileName : MemberManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.21
*	@Author	: 박문수
*	@Discription : 회원 관리 페이지 Service
*/



package kr.or.bus.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.velocity.VelocityConfig;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinMDetailRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;
import kr.or.bus.dto.reguloffrDTO2;

@Service
public class MemberManageService {
	
private JavaMailSender mailSender;
	
	@Autowired
	public void setMailSender(JavaMailSender mailSender){
		this.mailSender=mailSender;
	}
	@Autowired
	private VelocityConfig velocityconfig;
	
	
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
	
	public List<reguloffrDTO2> regul(String pg,String m_id){
		System.out.println("회원가입승인 페이지");
		System.out.println("파라미터로 넘어오는 pg : " + pg);
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		List<reguloffrDTO2> list = dao.alarm(page,m_id);
		System.out.println(list);
		return list;
	}
	public int memberNCount(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int size = dao.memberNCount();
		
		return size;
	}
	
	public int regulCount(String m_id){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int size = dao.regulCount(m_id);
		
		return size;
	}

	//승인여부 y 로 바꾸고 권한 부여
	public void updateCheck(String m_id) throws MessagingException{
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		String what=dao.getMail(m_id);
		dao.updateCheck(m_id);
		dao.insertAuth(m_id);
		
		MimeMessage mimemessage = mailSender.createMimeMessage();			
		String cong=m_id+"님 축하드립니다. 가입이 완료되었습니다.";
		String curTime = new SimpleDateFormat("yyyy-MM-dd-").format(new Date());	 
		String head="회원가입 보호를 위한 RoadOneBell 안내";
		String content1="RoadOneBell에 관심을 가져주신것에 대해 감사드리며,RoadOneBell 가입을 축하드리는 바 입니다.";
		
		Map<String,Object> param=new HashMap<>();
		param.put("content",cong);
		param.put("content1",content1);
		param.put("head", head);
		param.put("date", curTime);
		
		mimemessage.setSubject("RoadOneBell 가입을 축하드립니다^^.","UTF-8");
		String Url="hello.html";
		String format=VelocityEngineUtils.mergeTemplateIntoString(velocityconfig.getVelocityEngine(),Url,"UTF-8",param);
		mimemessage.setText(format,"UTF-8","html");
		mimemessage.addRecipient(RecipientType.TO, new InternetAddress(what));
		
		mailSender.send(mimemessage);


		
		
		
	}
	
	public MemberJoinMDetailRegulOffDTO memberDetail(String m_id){
		System.out.println("service 탓니?");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberJoinMDetailRegulOffDTO dto = dao.getMemberDetailRegulOff(m_id);
				
		return dto;
	}
	
	//휴무 부여받지 않은 사람의 정보
	public MemberJoinMDetailDTO memberDetailnoReg(String m_id){
		System.out.println("service 탓니~~?");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberJoinMDetailDTO dto = dao.getMemberDetail(m_id);
		System.out.println("dto"+dto);
		System.out.println(dto.toString());
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
		public void Okay(String m_id){
			System.out.println("oaky");
			MemberDAO dao=sqlsession.getMapper(MemberDAO.class);
			dao.Okay(m_id);
			System.out.println("아노료?");
		}
}
