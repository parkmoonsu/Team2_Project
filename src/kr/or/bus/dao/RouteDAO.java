package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.RouteDTO;

public interface RouteDAO {
	public RouteDTO routeidSearch(String r_num);
	
	//전체 노선 불러오기
	public List<RouteDTO> route();

	//메인 - 셀렉트 박스 - r_num 가져오기
	public List<RouteDTO> getRouteNum();

	//route insert
	public int routeInsertData(RouteDTO routedto);
	
	//route 중복체크
	public int routeDataCheck(RouteDTO routedto);
}
