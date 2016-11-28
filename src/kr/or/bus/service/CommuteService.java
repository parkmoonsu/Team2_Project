package kr.or.bus.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.bus.dao.CommuteDAO;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;

@Controller
public class CommuteService {

	@Autowired
	private SqlSession sqlsession;
	
	public CommuteJoinCstartJoinCendDTO getCommuteInfo(String m_id){
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        
        String today = (new SimpleDateFormat("yyyy-MM-dd HHmm").format(date));
        String tdate = today.substring(0, 10).trim();
        String dhour = today.substring(11,15).trim();

        CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		String m_name=dao.getName(m_id);
		System.out.println("m_name :" + m_name);
		
		//if(dao.csselect(tdate)==true){
			
			int result = dao.gotowork(m_id, m_name,tdate,dhour);
			System.out.println("result 값" + result);
			
			dao.updateCommute(m_id,tdate,dhour);
			CommuteJoinCstartJoinCendDTO dto = dao.csselect(m_id);
			
		//}
		return dto;
	}
	
	//////
	public CommuteJoinCstartJoinCendDTO getoffCommuteInfo(String m_id){
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        
        String today = (new SimpleDateFormat("yyyy-MM-dd HHmm").format(date));
        String tdate = today.substring(0, 10).trim();
        String dhour = today.substring(11,15).trim();

		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		String m_name=dao.getName(m_id);
		System.out.println("m_name :" + m_name);

		dao.updateendtime(dhour, m_id, tdate);
		dao.updateCommuteoff(m_id,tdate,dhour);
		
		CommuteJoinCstartJoinCendDTO dto = dao.ceselect(m_id);
		
		return dto;
	}
		
	public List<CommuteJoinCstartJoinCendDTO> getSelect(String pg, String m_id){
	
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		List<CommuteJoinCstartJoinCendDTO> list = dao.getSelect(page, m_id);

		return list;
	}
	
	
	//test
	public List<CommuteJoinCstartJoinCendDTO> getoffSelect(String pg, String m_id){
		
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		List<CommuteJoinCstartJoinCendDTO> list = dao.getoffSelect(page, m_id);

		return list;
	}
	
	public int pg(String pg){
		int page = 1;
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		return page;
	}
}
