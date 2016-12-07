/*
*	@FileName : BusDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : Bus etc.. table DAO interface
*/


package kr.or.bus.dao;

import java.sql.Date;
import java.util.List;

import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBstatusJoinStatusDetailDTO;
import kr.or.bus.dto.MemberDTO;

public interface BusDAO {
	////////////////////////////////////////////////////////////////운영관리로 빠짐//////////////////////////
	//(관리자) 버스관리 - 버스 등록/삭제에 뿌려질 리스트
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> busInfo(int page); 				////
	
	//등록된 버스의 개수
	public int busCount();																			////
	
	//등록된 차고지의 이름 가지고오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getGarageName();					////
	
	//모든 버스현황 리스트
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getAllStat(int page);
	
	//차고지별 버스현황 개수
	public int count();
	
	public int scount(String g_name);
	
	//차고지별 버스현황 리스트 
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getStat(String g_name, int page);
	
	//등록된 차고지의 이름을 통해 차고지에 맞는 노선 번호 가져오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getRouteNum(String g_num);			////
	
	//등록된 기사들의 이름 가져오기
	public List<MemberDTO> getMember();																////
	
	//버스 등록하기(전체)
	public void insertBus(String b_vehiclenum , String r_num , String g_name);						////
	//기사 차량번호 update
	public void updateVehicle(String b_vehiclenum , String mname);									////
	//버스 상태 테이블 insert
	public void insertBStatus(String b_vehiclenum ,String r_num);
	
	//버스 수정 시 vehiclenum으로 원래 있던 값 뿌려주기
	public BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO getVehicle(String b_vehiclenum);			/////
	
	//버스 수정 - 차고지 이름 가져오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getGarage(String g_num);		//////////
	
	//버스 수정 - 경로 번호 가져오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getRoute(String g_num);//////////////////
	
	//버스 수정 - 기사 가져오기
	public List<MemberDTO> getMembers(String mid);
		
	//버스 수정/////////////////////////////////////////////////////////////////////////////////////////////////
	public void updateBus(String b_vehiclenum , String g_name , String r_num , String hidden);///////////////
	
	//내가 등록하려는 버스의 번호가 이미 있는 버스번호인지 확인(실수로 잘못 입력한 경우까지 처리)
	public int alreadyUse(String b_vehiclenum);
	
	//기사의 버스가 등록되어있는데 다른 기사로 변경 할 경우															/////////
	public void updateMember(String b_vehiclenum , String m_id);										/////
	public void updateVehicleNull(String m_id);															/////
	public MemberDTO selectMemberId(String b_vehiclenum);												/////
	
	//차량 번호 삭제
	public void deleteBus(String b_vehiclenum);															/////

	//마을버스 개수
	public int mBus();
	//시내버스 개수
	public int nBus();
	//시외버스 개수
	public int wBus();
	//고속버스 개수
	public int gBus();
	//공항버스 개수
	public int aBus();
	//인천버스 개수
	public int iBus();
	//경기버스 개수
	public int kBus();
	//폐지버스 개수
	public int dBus();
	//공용버스 개수
	public int pBus();
	//미정
	public int noRoute();
	
	//경로가 지정 안된 리스트
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> noRouteInfo(int page);
	
	//간선버스
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> mBusInfo();
	
	//지선버스
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> nBusInfo();
		
	//순환버스
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> wBusInfo();				
	
	//광역버스																			/////////////
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> gBusInfo();		/////////////
	/////////////////////////////운영관리로 빠짐//////////////////////////////////////////////////////
	
	
	
	/////////////////버스 등록  ////////////////////////////////////////////////////////////////
	public int busReg(String b_vehiclenum , Date b_sdate , String b_sprice , String b_manuf , 
			int b_pcount , String b_model , String b_caryear);
}
