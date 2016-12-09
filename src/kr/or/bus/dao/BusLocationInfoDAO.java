package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.BusLocationInfoDTO;

public interface BusLocationInfoDAO {
	public BusLocationInfoDTO SearchRider(String busno);
	public List<BusLocationInfoDTO> simulationdata(String r_num);
}
