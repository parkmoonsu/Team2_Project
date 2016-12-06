package kr.or.bus.dao;

import java.util.ArrayList;

import kr.or.bus.dto.BusDTO;
import net.sf.json.JSONObject;

public interface BusDataDAO {
	public int insertBusno(BusDTO busdto);
	public int busnoCheck(BusDTO busdto);
}
