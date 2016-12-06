package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.RouteStopDTO;
import kr.or.bus.dto.RouteStopJoinStopDTO;
import kr.or.bus.dto.StopDTO;

public interface RouteStopDAO {
	public int insertRouteStopCheck(RouteStopDTO dto);
	public int insertRouteStopData(RouteStopDTO dto);
	
	public int checkStopNum(String s_num);
	public RouteStopDTO getRouteStopInfo(String r_num, String rs_order);
	public int addStopInfo(StopDTO dto);
	public int addRouteStopInfo(RouteStopDTO dto);
	public int updateRouteStopInfo(String r_num, String rs_order, String s_num);
	public List<RouteStopJoinStopDTO> getRouteStopInfoList(String r_num);
}
