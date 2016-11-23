package kr.or.bus.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import kr.or.bus.dao.CommuteDAO;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;
import kr.or.bus.dto.CstandardDTO;

@Service
public class CommuteService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int go(String m_id, ModelMap map){
		
		/*
		CommuteJoinCstartJoinCendDTO dto2=new CommuteJoinCstartJoinCendDTO();
		dto2.setM_id(m_id);
		dao.ceupdate(dto2);
		CommuteJoinCstartJoinCendDTO dto= dao.ceselect(dto2);
				
		map.addAttribute("dto",dto);
		 */

		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		String m_name = dao.getOnlyName(m_id);
		CstandardDTO cdto = dao.getStandardTime();
		System.out.println("go service -> m_name:="+m_name);
		dao.insertCommuteInfo(m_id, m_name);
		System.out.println("go service -> m_id:="+m_id);
		CommuteJoinCstartJoinCendDTO cdto2=new CommuteJoinCstartJoinCendDTO();
		cdto2.setM_id(m_id);
		System.out.println("여기는 값이 들어있나?" + m_id);
		System.out.println("여기탓니?");
		dao.csupdate(cdto2);
		
		System.out.println("꺄륵꺄륵꺄륵");

		CommuteJoinCstartJoinCendDTO cdto3=dao.csselect(cdto2);
	
		map.addAttribute("cdto3",cdto3);
		return 0;
	}
}
