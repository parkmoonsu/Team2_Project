package kr.or.bus.service;

import java.util.List;

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
	
	public List<CommuteJoinCstartJoinCendDTO> go(String m_id, ModelMap map){
		
		/*
		CommuteJoinCstartJoinCendDTO dto2=new CommuteJoinCstartJoinCendDTO();
		dto2.setM_id(m_id);
		dao.ceupdate(dto2);
		CommuteJoinCstartJoinCendDTO dto= dao.ceselect(dto2);
				
		map.addAttribute("dto",dto);
		 */

		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		//dao.csupdate(m_id);
		//dao.csudate(m_id);
		System.out.println("꺄륵꺄륵꺄륵");

		List<CommuteJoinCstartJoinCendDTO> cdto3=dao.csselect(m_id);
		System.out.println("cdto3"+cdto3);
		System.out.println(cdto3.size());
		System.out.println(cdto3.get(0).getC_start());
		
		//map.addAttribute("cdto3",cdto3);
		return cdto3;
	}
}
