package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.StopDTO;

public interface StopDAO {
	public int selectS_NUM(StopDTO dto);
	
	//public List<StopDTO> overlapNotSearch();
	//public int insertTempStop(StopDTO dto);
	public int insertStopData(StopDTO dto);
}
