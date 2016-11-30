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
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberJoinJobDTO;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;
import nu.xom.*;

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
		System.out.println("username >>>> :" +username);
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		System.out.println("dao 값 :"+dao.toString());
		MemberJoinJobDTO dto = dao.getJobName(username);
		return dto;
	}
	
	public JSONObject temp3(String tmFc) throws Exception {
		JSONObject jsonweather = null;
		StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleTemperature"); // URL
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); // Service
																														// Key
		urlBuilder.append("&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode("11B10101", "UTF-8")); // regId
		urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(tmFc , "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 검색건수
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 페이지
																												// 번호
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
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
	       
	       jsonweather = (JSONObject)new XMLSerializer().read(sb.toString());
	       
	       System.out.println("#########"+jsonweather);
		return jsonweather;
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
	
	public JSONObject weather(String tmFc) throws Exception{
		JSONObject jsonweather  = null;
		
		StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather"); // URL
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=058in59%2BNLwfE3cT76LhIzkAAy2rb6zIQALV3UFT4T8qcZ4oIcYFtMfw75Hvs7H2nbjhZ8hT66mmVaWbzdbltg%3D%3D"); // Service
																														// Key
		urlBuilder.append("&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode("11B00000", "UTF-8")); // regId
		urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(tmFc , "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 검색건수
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 페이지
																												// 번호
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
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
	       
	       jsonweather = (JSONObject)new XMLSerializer().read(sb.toString());
	       System.out.println("sb.tostring : " + sb.toString());
	       System.out.println("#########"+jsonweather);
		return jsonweather;
	}
}
