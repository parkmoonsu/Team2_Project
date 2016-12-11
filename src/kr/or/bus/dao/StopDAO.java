/*
*	@FileName : StopDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.24
*	@Author	: 버스정류장
*	@Discription : 버스정류장  관련 DAO interface
*/

package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.StopDTO;

public interface StopDAO {
	public int selectS_NUM(StopDTO dto);
	
	//public List<StopDTO> overlapNotSearch();
	//public int insertTempStop(StopDTO dto);
	public int insertStopData(StopDTO dto);
}
