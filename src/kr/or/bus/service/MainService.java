/*
*	@FileName : MainService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.17
*	@Author	: 박문수
*	@Discription : 회원에 관련된 메인 페이지 Service
*/



package kr.or.bus.service;


import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dao.RouteDAO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;
import kr.or.bus.dto.RouteDTO;
import net.sf.json.JSONObject;

@Controller
public class MainService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	//모든 유저 구하기
	public List<MemberDTO> selectall(String search){
		MemberDAO dao =sqlsession.getMapper(MemberDAO.class);
		System.out.println("씨발진짜 좆같네");
		System.out.println(search);
		List<MemberDTO> dto=dao.SelectAll(search);
		
		return dto;
	}

	public MemberJoinMDetailDTO getMemberInfo(String m_id){
		System.out.println("m_id : " + m_id);
		MemberDAO dao =sqlsession.getMapper(MemberDAO.class);
		MemberJoinMDetailDTO dto = dao.getMemberInfo(m_id);

		
		return dto;
	}
	
	public String getPass(String m_id){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		String pw = dao.passMatch(m_id).getM_pw();
		
		return pw;
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
	

	public void updateMember(MemberDTO mdto , MDetailDTO ddto , String m_id , String hidden ,HttpServletRequest request) throws Exception{

		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		List<CommonsMultipartFile> files = ddto.getFiles();
		System.out.println("files주소???"+files);
		List<String> filenames = new ArrayList<String>();
		
		if (files != null && files.size() > 0) { // 업로드한 파일이 하나라도 있다면
			System.out.println("여기탐");
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
				}	filenames.add(fname); // 실 DB Insert 작업시 .. 파일명
			}
			ddto.setM_photo(filenames.get(0));
		}else{
			ddto.setM_photo(null);
		}
		
		
		mdto.setM_pw(this.bCryptPasswordEncoder.encode(mdto.getM_pw()));
		
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		
		dao.updateMember1(mdto, m_id , hidden);
		dao.updateMember2(ddto, m_id);
		
	}
	
	public MemberDTO getName(String m_id){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO dto = dao.getName(m_id);
		
		return dto;
	}
	
	public MDetailDTO getPhoto(String m_id){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MDetailDTO dto = dao.getPhoto(m_id);
		
		return dto;
	}
	
	public int approveCount(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int appcount = dao.approveCount();
		
		return appcount;
	}
	public int getRegul(String m_id){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		System.out.println("여긴옴?");
		int dto=dao.getregul(m_id);
		System.out.println("디티오"+dto);
		return  dto;
	}
	
	public List<Integer> csStatic(String m_id){
		Calendar cal = java.util.Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		
		String date_12 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		MemberDTO dto = dao.getName(m_id);
		String m_name = dto.getM_name();
		
		
		String date_11 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_10 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_9 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_8 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_7 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_6 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_5 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_4 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_3 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_2 = format.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String date_1 = format.format(cal.getTime());
		System.out.println("1월" + date_1);
		int dec = dao.csstatic(m_name, date_12);
		int nov = dao.csstatic(m_name, date_11);
		int oct = dao.csstatic(m_name, date_10);
		int sep = dao.csstatic(m_name, date_9);
		int aug = dao.csstatic(m_name, date_8);
		int jul = dao.csstatic(m_name, date_7);
		int jun = dao.csstatic(m_name, date_6);
		int may = dao.csstatic(m_name, date_5);
		int apr = dao.csstatic(m_name, date_4);
		int mar = dao.csstatic(m_name, date_3);
		int feb = dao.csstatic(m_name, date_2);
		int jan = dao.csstatic(m_name, date_1);
		
		int dec2 = dao.csestatic(m_name, date_12);
		int nov2 = dao.csestatic(m_name, date_11);
		int oct2 = dao.csestatic(m_name, date_10);
		int sep2 = dao.csestatic(m_name, date_9);
		int aug2 = dao.csestatic(m_name, date_8);
		int jul2 = dao.csestatic(m_name, date_7);
		int jun2 = dao.csestatic(m_name, date_6);
		int may2 = dao.csestatic(m_name, date_5);
		int apr2 = dao.csestatic(m_name, date_4);
		int mar2 = dao.csestatic(m_name, date_3);
		int feb2 = dao.csestatic(m_name, date_2);
		int jan2 = dao.csestatic(m_name, date_1);
		List<Integer> list = new ArrayList<Integer>();
		list.add(jan);
		list.add(feb);
		list.add(mar);
		list.add(apr);
		list.add(may);
		list.add(jun);
		list.add(jul);
		list.add(aug);
		list.add(sep);
		list.add(oct);
		list.add(nov);
		list.add(dec);
		   
		list.add(jan2);
		list.add(feb2);
		list.add(mar2);
		list.add(apr2);
		list.add(may2);
		list.add(jun2);
		list.add(jul2);
		list.add(aug2);
		list.add(sep2);
		list.add(oct2);
		list.add(nov2);
		list.add(dec2);

		return list;
	}
	public List<RouteDTO> getRouteNum(){
		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);
		List<RouteDTO> list = dao.getRouteNum();
		
		return list;
	}
	
	public JSONObject busStop(String year , String month , String route) throws Exception{
		
		
		JSONObject jsontemp = null;
		
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); // URL
		urlBuilder.append("/75547649756f6b3237326a46706472/json/CardBusTimeNew/1/60"); // key
		urlBuilder.append("/" + year + month + "/" + route + "/");
		
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
	
}
