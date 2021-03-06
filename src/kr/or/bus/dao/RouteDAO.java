/*
*	@FileName : RouteDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 김지현
*	@Discription : 노선관련  DAO interface
*/


package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RoutePathDTO;
import kr.or.bus.dto.RouteSelectGisaDTO;
import kr.or.bus.dto.RouteStopCopyJoinStopDTO;
import kr.or.bus.dto.RouteTypeDTO;
import kr.or.bus.dto.StopDTO;

public interface RouteDAO {
	public RouteDTO routeidSearch(String r_num);
	
	public List<RouteDTO> routeidselect(String r_num);
	
	//공공데이터 로 부터 노선경로 데이터를 저장함.
	public void insertOrgRoute(RoutePathDTO dto);
	
	
	public void InsertRoute(RoutePathDTO dto); //원본을 불러와서 수정 노선테이블에 저장.
	
	public List<RoutePathDTO> editRouteRead(String r_num);
	
	//전체 노선 불러오기
	public List<RouteDTO> route();

	//메인 - 셀렉트 박스 - r_num 가져오기
	public List<RouteDTO> getRouteNum();

	//route insert
	public int routeInsertData(RouteDTO routedto);
	
	//route 중복체크
	public int routeDataCheck(RouteDTO routedto);
	
	//추가
	public List<StopDTO> routeRead();
	
	//노선 타입 조회
	
	public List<RouteTypeDTO> searchRouteType();
	
	//입력받아 같은 타입 인경우 노선번호리스트출력
	
	public List<RouteTypeDTO> searchRouteNumber(String no);
	
	public List<RouteTypeDTO> routeEdit(String name);
	
	//노선번호 셀렉트박스 의 선택된 노선번호에 따라 해당 노선에 배정된 버스기사 출력
	public List<RouteSelectGisaDTO> searchBusGisa(String r_num);
	
}
