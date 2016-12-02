package kr.or.bus.dao;

import kr.or.bus.dto.StopDTO;

public interface StopDAO {
	public int selectS_NUM(StopDTO dto);
	public void insertStopData(StopDTO dto);
}
