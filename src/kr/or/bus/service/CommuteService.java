/*
*	@FileName : CommuteService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.26
*	@Author	: 조한솔
*	@Discription : 회원메뉴 출/퇴근 관리 Service
*/

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
		System.out.println("오늘 날짜"+tdate);
			
			int result = dao.gotowork(m_id, m_name,tdate,dhour);
			System.out.println("result 값" + result);
			
			dao.updateCommute(m_id,tdate,dhour);
			CommuteJoinCstartJoinCendDTO dto = dao.csselect(m_id, tdate);
			
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
		
		CommuteJoinCstartJoinCendDTO dto = dao.ceselect(m_id, tdate);
		
		return dto;
	}
		
	public List<CommuteJoinCstartJoinCendDTO> getSelect(String pg, String m_id){
		System.out.println("회원 정보 페이지");
		System.out.println("파라미터로 넘어오는 pg : " + pg);

		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		List<CommuteJoinCstartJoinCendDTO> list = dao.getSelect(page, m_id);

		return list;
	}


	public int pg(String pg){
		System.out.println("pg함수 들어왔어여");
		int page = 1;
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		return page;
	}
	
	public int count(String m_id){
		System.out.println("count함수 들어왔어여");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		int size = dao.count(m_id);
		
		return size;
	}
	
	
	
	public int csCheck(String m_id){
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        
		String today = (new SimpleDateFormat("yyyy-MM-dd HHmm").format(date));
        String tdate = today.substring(0, 10).trim();
        
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		int check = dao.csCheck(m_id,tdate);
		
		return check;
	}
	
	public int ceCheck(String m_id){
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        
		String today = (new SimpleDateFormat("yyyy-MM-dd HHmm").format(date));
        String tdate = today.substring(0, 10).trim();
        
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		int echeck = dao.ceCheck(m_id, tdate);
		
		return echeck;
	}
}
