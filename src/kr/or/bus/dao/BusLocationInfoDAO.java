package kr.or.bus.dao;

import kr.or.bus.dto.BusLocationInfoDTO;

public interface BusLocationInfoDAO {
	public BusLocationInfoDTO SearchRider(String busno);
}
