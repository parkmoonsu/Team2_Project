package kr.or.bus.dao;

import kr.or.bus.dto.RouteStopDTO;

public interface RouteStopDAO {
	public int insertRouteStopCheck(RouteStopDTO dto);
	public int insertRouteStopData(RouteStopDTO dto);
}
