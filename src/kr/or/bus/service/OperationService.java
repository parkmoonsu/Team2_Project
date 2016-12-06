/*
*	@FileName : OperationService.java
*	@Project	: KosBus
*	@Date	: 2016.12.06
*	@Author	: 박문수
*	@Discription : 운영 관리 페이지 service
*/

package kr.or.bus.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.RegulOffRDAO;
import kr.or.bus.dto.ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO;
import kr.or.bus.dto.RouteDTO;

@Service
public class OperationService{
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> regulList(String pg){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class); 
		int page = 1;
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = dao.regulList(page);
		
		return list;
	}
	
	public int countList(){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class); 
		int count = dao.countList();
		
		return count;
	}
	
	public int pg(String pg){
		int page = 1;
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		return page;
	}
	
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> dayList(String search){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class); 
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list =  dao.dayList(search);
		
		return list; 
	}
	
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> codeList(String search){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class); 
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = dao.codeList(search);
		
		return list;
	}
	
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> nameList(String search){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class); 
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = dao.nameList(search);
		
		return list;
	}
	
	public List<RouteDTO> getRoute(){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class);
		List<RouteDTO> list = dao.getrouteajax();
		 
		return list;
	}
	
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> routeList(String search){
		RegulOffRDAO dao = sqlsession.getMapper(RegulOffRDAO.class); 
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = dao.routeList(search);
		
		return list;
	}
}