package kr.or.bus.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;

@Controller
public class MainService {

	@Autowired
	private SqlSession sqlsession;
	
	
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
}
