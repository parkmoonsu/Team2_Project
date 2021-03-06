/*
*	@FileName : BusManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : 버스 관리 페이지 Service
*/



package kr.or.bus.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.BusDAO;
import kr.or.bus.dao.MemberDAO;
import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.BusJoinRdetailJoinRepairDTO;
import kr.or.bus.dto.MemberDTO;

@Service
public class BusManageService {
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
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
	
	public int count(){	
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int count=dao.count();
		return count;
	}
	
	public int scount(String g_name){
		
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int scount = dao.scount(g_name);
		
		return scount;
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
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getAllStat(String pg){
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		System.out.println("page : " + page);
		
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getAllStat(page);
		
		return list;		
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getStat(String g_name, String pg){
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		System.out.println("page : " + page);
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> sclist =dao.getStat(g_name, page);
		
		return sclist;
	}

	public List<BusJoinRdetailJoinRepairDTO> getSearch(String b_vehiclenum){
		
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinRdetailJoinRepairDTO> list = dao.getSearch(b_vehiclenum);
		
		return list;
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
	
	
	public int alreadyUse(String b_vehiclenum){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int count = dao.alreadyUse(b_vehiclenum);
		
		return count;
		
	}
	
	public void updateBus(String b_vehiclenum , String g_num , String r_num , String m_name , String hidden){
		System.out.println("여기 버스번호 뭥미 ? : " + b_vehiclenum);
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		
		dao.updateBus(b_vehiclenum, g_num, r_num , hidden);
		String m_id = "";
		
		if(dao.selectMemberId(b_vehiclenum) != null){
			m_id = dao.selectMemberId(b_vehiclenum).getM_id();
		}else{
			m_id = null;
		}
		
		
		if(m_name.equals("(미정)") || m_name.equals("선택")){ // 등록하는 아이디가 없는경우
			if(m_id != null){ // 원래 등록되어있던 아이디의 버스번호가 있다면
				dao.updateVehicleNull(m_id);
			}else{
				// 등록되어있던 버스가 없다면 값 놔둠
			}
			
		}else{ //등록한 아이디가 있는 경우
			if(m_id != null){ // 버스번호에 해당하는 id가 있는 경우
				
				if(!m_name.equals(dao.selectMemberId(b_vehiclenum).getM_id())){ // 버스번호에 해당하는 아이디와 등록하려는 버스번호의 아이디가 같지 않은 경우
					
					dao.updateMember(b_vehiclenum, m_name); // 등록하려는 버스번호의 아이디에 버스번호를 등록
					dao.updateVehicleNull(m_id); // 원래 등록되어있던 아이디에 버스번호를 null로 바꿈
					
				}
			}else{ // 버스번호에 해당하는 아이디와 등록하려는 버스번호의 아이디가 같은 경우
				
				dao.updateMember(b_vehiclenum, m_name); // 원래 값으로 놔둠
			
			}
		}
	}
	
	public boolean getPass(String m_id , String m_pw){
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		String pw = dao.passMatch(m_id).getM_pw();
		
		System.out.println("m_pw : " + m_pw);
		System.out.println("encodePass : " + pw);
		
		boolean result = bCryptPasswordEncoder.matches(m_pw, pw);
		
		return result;
	}
	
	public void deleteBus(String b_vehiclenum){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		dao.deleteBus(b_vehiclenum);
		

	}
	
	public int mBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int mcount = dao.mBus();
		return mcount;
	}
	
	public int nBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int ncount = dao.nBus();
		return ncount;
	}
	
	public int wBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int wcount = dao.wBus();
		return wcount;
	}
	
	public int gBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int gcount = dao.gBus();
		return gcount;
	}
	//공항
	public int aBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int acount = dao.aBus();
		return acount;
	}
	//인천
	public int iBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int icount = dao.iBus();
		return icount;
	} 
	//경기
	public int kBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int kcount = dao.kBus();
		return kcount;
	}
	//폐지
	public int dBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int dcount = dao.dBus(); 
		return dcount; 
	}
	//공용
	public int pBus(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int pcount = dao.pBus();
		return pcount;
	}
	public int noRoute(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int noroute = dao.noRoute();
		return noroute;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> noRouteInfo(String pg){
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.noRouteInfo(page);

		return list;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> mBusInfo(){

		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.mBusInfo();

		return list;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> nBusInfo(){

		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.nBusInfo();

		return list;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> wBusInfo(){

		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.wBusInfo();

		return list;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> gBusInfo(){

		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.gBusInfo();

		return list;
	}
///////////////////////////버스 운영관리////////////////////////////////////////////////////////
	
	public int busReg(String b_vehiclenum,String b_sdate,String b_sprice,String b_manuf,String b_pcount,String b_effic,String b_model,String b_caryear){
		
		Date date = Date.valueOf(b_sdate);
		
		int pcount = Integer.parseInt(b_pcount);
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		
		int result = dao.busReg(b_vehiclenum, date, b_sprice, b_manuf, pcount, b_model, b_caryear);
		
		return result;
	}
	//////////////////////////////////////////////////////////
	
	public int origarage(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int ori = dao.origarage();
		
		return ori;
		
	}
	
	public int sngarage(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int sn = dao.sngarage();
		
		return sn;
	}
	
	public int pggarage(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int pg = dao.pggarage();
		
		return pg;
	}
	
	public int nullgarage(){
		BusDAO dao = sqlsession.getMapper(BusDAO.class);
		int nullgarage = dao.nullgarage();
		
		return nullgarage;
	}
}
