package kr.or.bus.dao;

import kr.or.bus.dto.BusDTO;
import net.sf.json.JSONObject;

public interface BusDataDAO {
	public int insertBusno(BusDTO busdto);
	public int busnoCheck(BusDTO busdto);
	public String SearchRider(String busno);
}
