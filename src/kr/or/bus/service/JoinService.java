/*
*	@FileName : JoinService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.16
*	@Author	: 박문수
*	@Discription : 회원가입 페이지 Service
*/

package kr.or.bus.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.view.velocity.VelocityConfig;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
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
	private VelocityConfig velocityconfig;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public void join3(MDetailDTO ddto , MemberDTO mdto, HttpServletRequest request) throws IOException, BiffException{
		ResRecordDTO rdto = null;
		Workbook workbook = null;
		int rowindex = 0;
		List<ResRecordDTO> reslist = new ArrayList<ResRecordDTO>();
		
		
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		
		System.out.println(ddto.getFiles().get(0).getName());
		System.out.println(ddto.getFiles().get(1).getName());
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		List<CommonsMultipartFile> files = ddto.getFiles();
		List<String> filenames = new ArrayList<String>();
		
		if (files != null && files.size() > 0) { // 업로드한 파일이 하나라도 있다면

			for (CommonsMultipartFile multipartfile : files) {

				String fname = multipartfile.getOriginalFilename(); // 파일명 얻기
				System.out.println("한글처리전 파일명"+fname);
				//fname = new String(fname.getBytes("8859_1"),"EUC-KR");
				//fname = new String(fname.getBytes("euc-kr"), "8859_1");
				//fname = new String(fname.getBytes("ISO8859_1"),"UTF-8");
				//fname = URLEncoder.encode(fname);
				System.out.println("한글처리 파일명"+fname);
				String path = request.getServletContext().getRealPath("/join/upload");
				String fullpath = path + "\\" + fname;
				
				System.out.println(fname + " / " + path + " / " + fullpath);

				if (!fname.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fullpath);
					fs.write(multipartfile.getBytes());
					fs.close();
				}
				
				if (multipartfile.getName().equals("files[2]")){
					//엑셀파일만 선택해서 내용 추출하는 작업
				workbook = Workbook.getWorkbook(new File(fullpath));
				Sheet sheet = workbook.getSheet(0);
				 for (rowindex = 1; rowindex < sheet.getRows(); rowindex++) {
			          System.out.println("0열: res_num"+sheet.getCell(0, rowindex).getContents());
			          System.out.println("2열: res_com"+sheet.getCell(2, rowindex).getContents());
			          System.out.println("3열: res_start "+sheet.getCell(3, rowindex).getContents());
			          System.out.println("4열: res_end"+sheet.getCell(4, rowindex).getContents());
			         
			          rdto = new ResRecordDTO();
			          rdto.setM_id(mdto.getM_id());
			          rdto.setRes_num(sheet.getCell(0, rowindex).getContents());
			          rdto.setRes_com(sheet.getCell(2, rowindex).getContents());
			          rdto.setRes_start(sheet.getCell(3, rowindex).getContents());
			          rdto.setRes_end(sheet.getCell(4, rowindex).getContents());
			          rdto.setRes_period(sheet.getCell(5, rowindex).getContents());
			          
			          reslist.add(rdto);
				 }
				}
				filenames.add(fname); // 실 DB Insert 작업시 .. 파일명
			}

		  }
		
		ddto.setM_license(filenames.get(0));
		ddto.setM_photo(filenames.get(1));
		ddto.setM_resume(filenames.get(2));
		//비밀번호 암호화
		mdto.setM_pw(this.bCryptPasswordEncoder.encode(mdto.getM_pw()));
		
		dao.insertMember(mdto);
		dao.insertDetail(ddto);
		
		for(int i=0;i<reslist.size();i++){
			dao.insertResrecord(reslist.get(i));
		}
		
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
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		ApproveDTO dto = dao.emailApp();
		System.out.println("num : " + dto.getA_num());
		String curTime = new SimpleDateFormat("yyyy-MM-dd-").format(new Date());	 
		String head="회원가입 보호를 위한 RoadOneBell 안내";
		String content1="RoadOneBell에 관심을 가져주신것에 대해 감사드리며,RoadOneBell 개인확인을 위하여 부득이하게 이메일로 확인하는점 양해 부탁드립니다.";
		String content=dto.getA_num()+"입니다.";
		Map<String,Object> param=new HashMap<>();
		param.put("content",content);
		param.put("date", curTime);
		param.put("head", head);
		param.put("content1", content1);
		
		mimemessage.setSubject("RoadOneBell 인증번호입니다.","UTF-8");
		String Url="hello.html";
		String format=VelocityEngineUtils.mergeTemplateIntoString(velocityconfig.getVelocityEngine(),Url,"UTF-8",param);
		mimemessage.setText(format,"UTF-8","html");
		mimemessage.addRecipient(RecipientType.TO, new InternetAddress(m_email));
		
		mailSender.send(mimemessage);
		/*
		mimemessage.setSubject("KOSBUS 인증번호입니다.", "utf-8");
		String htmlContent = "<div style = 'text-align:center;'>";
		htmlContent += "<img src = 'http://karenkolbcoaching.com/wp-content/uploads/2011/09/166152840.jpg'><br>";
		htmlContent +=	"<h2>KOSBUS 이메일 인증번호는<br> <font color = 'green'><strong>" + dto.getA_num() + "</strong></font>입니다.</h2></div>";

		mimemessage.setText(htmlContent, "utf-8", "html");
		
		System.out.println(mimemessage.toString());
		*/
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
