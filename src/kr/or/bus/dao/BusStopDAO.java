package kr.or.bus.dao;

import java.util.ArrayList;
import kr.or.bus.dto.BusStopDTO;
import net.sf.json.JSONArray;


public interface BusStopDAO {
	public JSONArray makeBusStop(String r_id);
}
