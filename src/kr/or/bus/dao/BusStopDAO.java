package kr.or.bus.dao;

import java.util.ArrayList;
import kr.or.bus.dto.BusStopDTO;


public interface BusStopDAO {
	public ArrayList<BusStopDTO> makeBusStop(String r_id);
}
