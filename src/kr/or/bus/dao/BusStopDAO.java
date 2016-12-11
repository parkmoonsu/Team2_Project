/*
*	@FileName : BusStopDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.23
*	@Author	: 김지현
*	@Discription : BusStop DAO interface
*/


package kr.or.bus.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.bus.dto.BusStopDTO;
import net.sf.json.JSONArray;


public interface BusStopDAO {
	public JSONArray makeBusStop(String r_id);
	
	public List<BusStopDTO> editBusStopreturn(String r_num);
}
