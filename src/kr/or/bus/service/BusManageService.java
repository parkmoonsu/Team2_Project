/*
*	@FileName : BusManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : 버스 관리 페이지 Service
*/



package kr.or.bus.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.BusDAO;
import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.MemberDTO;

@Service
public class BusManageService {
	@Autowired
	private SqlSession sqlsession;
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> busInfo(String pg){
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("page : " + page);
		
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.busInfo(page);

		return list;
	}
	
	public int pg(String pg){
		int page = 1;
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		return page;
	}
	
	public int busCount(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int count = dao.busCount();
		return count;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getGarageName(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> g_name = dao.getGarageName();
		
		return g_name;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getRouteNum(String g_num){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> r_num = dao.getRouteNum(g_num);
		
		return r_num;
	}
	
	public List<MemberDTO> getMember(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<MemberDTO> member = dao.getMember();
		
		return member;
	}
	
	public void insertBus(String b_vehiclenum , String r_num , String g_name){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		dao.insertBus(b_vehiclenum, r_num, g_name);
	}
	
	public void updateVehicle(String b_vehiclenum , String mname){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		dao.updateVehicle(b_vehiclenum, mname);
	}
	
	public void insertBStatus(String b_vehiclenum, String r_num){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		dao.insertBStatus(b_vehiclenum, r_num);
	}
	
	public BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO getVehicle(String b_vehiclenum){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO dto = dao.getVehicle(b_vehiclenum);
		return dto;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getGarageName(String g_num){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> garage = dao.getGarage(g_num);
		return garage;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getRoute(String g_num){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> route = dao.getRoute(g_num);
		
		return route;
	}
	
	public List<MemberDTO> getMembers(String mid){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<MemberDTO> member = dao.getMembers(mid);
		
		return member;
	}
}
