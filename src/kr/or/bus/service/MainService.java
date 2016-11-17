package kr.or.bus.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberDTO;

@Controller
public class MainService {

	@Autowired
	private SqlSession sqlsession;
	
	public void selectall(){
		MemberDAO dao =sqlsession.getMapper(MemberDAO.class);
		dao.SelectAll();
	}
}
