package kr.or.bus.service;


import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;

@Controller
public class MainService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//모든 유저 구하기
	public List<MemberDTO> selectall(String search){
		MemberDAO dao =sqlsession.getMapper(MemberDAO.class);
		
		List<MemberDTO> dto=dao.SelectAll(search);
		
		return dto;
	}
	//
	public List<MemberJoinMDetailDTO> ncheck(){
		MemberDAO dao =sqlsession.getMapper(MemberDAO.class);
		
		List<MemberJoinMDetailDTO> list=dao.getNcheck();
		
		return list;
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
	
	public void updateMember(MemberDTO mdto , MDetailDTO ddto , String m_id ,HttpServletRequest request) throws Exception{
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
				}	filenames.add(fname); // 실 DB Insert 작업시 .. 파일명
			}
		}
		
		ddto.setM_photo(filenames.get(0));
		mdto.setM_pw(this.bCryptPasswordEncoder.encode(mdto.getM_pw()));
		
		dao.updateMember1(mdto, m_id);
		dao.updateMember2(ddto, m_id);
		
	}
}
