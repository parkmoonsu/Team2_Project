package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.RouteDTO;

public interface RouteDAO {
	public RouteDTO routeidSearch(String r_num);
	
	//메인 - 셀렉트 박스 - r_num 가져오기
	public List<RouteDTO> getRouteNum();
}
