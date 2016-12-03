package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.RouteDTO;

public interface RouteDAO {
	public RouteDTO routeidSearch(String r_num);
	
	//전체 노선 불러오기
	public List<RouteDTO> route();
}
