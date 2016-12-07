/*
*	@FileName : LoginService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.17
*	@Author	: 박문수
*	@Discription : 로그인 페이지 Service
*/


package kr.or.bus.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfig;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberJoinJobDTO;
import net.sf.json.JSONObject;

@Service
public class LoginService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private VelocityConfig velocityconfig;
	
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
			
			Map<String,Object> param=new HashMap<>();
			param.put("content",m_id);
			String Url="hello.html";
			String format=VelocityEngineUtils.mergeTemplateIntoString(velocityconfig.getVelocityEngine(),Url,"UTF-8",param);
			mimemessage.setText(format,"UTF-8","html");
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
			
			Map<String,Object> param=new HashMap<>();
			param.put("content",temp);
			String Url="hello.html";
			String format=VelocityEngineUtils.mergeTemplateIntoString(velocityconfig.getVelocityEngine(),Url,"UTF-8",param);
			mimemessage.setText(format,"UTF-8","html");
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
		System.out.println("username >>>> :" +username);
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		System.out.println("dao 값 :"+dao.toString());
		MemberJoinJobDTO dto = dao.getJobName(username);
		return dto;
	}
	
	public JSONObject temp() throws Exception{
		JSONObject jsontemp = null;
		
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.skplanetx.com/weather/summary"); // URL
		urlBuilder.append("?" + URLEncoder.encode("version", "UTF-8") + "=1"); // version
																													// Key
		urlBuilder.append("&" + URLEncoder.encode("lat", "UTF-8") + "=" + URLEncoder.encode("37.518352", "UTF-8")); // regId
		urlBuilder.append("&" + URLEncoder.encode("lon","UTF-8") + "=" + URLEncoder.encode("126.930239" , "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("stnid", "UTF-8") + "=" + URLEncoder.encode("10283", "UTF-8")); // 검색건수
		urlBuilder.append("&" + URLEncoder.encode("appKey", "UTF-8") + "=" + URLEncoder.encode("cc15578e-061d-3387-9d44-a405a43c034e", "UTF-8")); // 페이지
																												// 번호
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());

		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       } else {
	           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	       }
	       
	       StringBuilder sb = new StringBuilder();
	       String line;
	           
	       while ((line = rd.readLine()) != null) {
	           sb.append(line);
	       }
	           
	       rd.close();
	           
	       conn.disconnect();
	       
	       jsontemp =  JSONObject.fromObject(sb.toString());
	       System.out.println("#######" + jsontemp);
		return jsontemp;
	}
	
	public JSONObject day6() throws Exception{
		JSONObject jsonday6 = null;
		
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.skplanetx.com/weather/forecast/6days"); // URL
		urlBuilder.append("?" + URLEncoder.encode("version", "UTF-8") + "=1"); // version
																													// Key
		urlBuilder.append("&" + URLEncoder.encode("lat", "UTF-8") + "=" + URLEncoder.encode("37.518352", "UTF-8")); // regId
		urlBuilder.append("&" + URLEncoder.encode("lon","UTF-8") + "=" + URLEncoder.encode("126.930239" , "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("fortxt", "UTF-8") + "=" + URLEncoder.encode("N", "UTF-8")); // 검색건수
		urlBuilder.append("&" + URLEncoder.encode("appKey", "UTF-8") + "=" + URLEncoder.encode("cc15578e-061d-3387-9d44-a405a43c034e", "UTF-8")); // 페이지
																												// 번호
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());

		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       } else {
	           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	       }
	       
	       StringBuilder sb = new StringBuilder();
	       String line;
	           
	       while ((line = rd.readLine()) != null) {
	           sb.append(line);
	       }
	           
	       rd.close();
	           
	       conn.disconnect();
	       
	       jsonday6 =  JSONObject.fromObject(sb.toString());
	       System.out.println("#######" + jsonday6);
		return jsonday6;
	}
}
