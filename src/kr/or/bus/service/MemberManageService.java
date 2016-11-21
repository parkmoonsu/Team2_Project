/*
*	@FileName : MemberManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.21
*	@Author	: 박문수
*	@Discription : 회원 관리 페이지 Service
*/



package kr.or.bus.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.MemberJoinMDetailDTO;

@Service
public class MemberManageService {
	
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
	
	public int pg(String pg){
		int page = Integer.parseInt(pg);
		return page;
	}
	
	public int memberCount(){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		int size = dao.memberCount();
		
		return size;
	}
}
