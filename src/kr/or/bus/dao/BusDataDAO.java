/*
*	@FileName : BusDataDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.28
*	@Author	: 김용현
*	@Discription : Bus data etc.. table DAO interface
*/

package kr.or.bus.dao;

import java.util.ArrayList;

import kr.or.bus.dto.BusDTO;
import kr.or.bus.dto.RouteSelectGisaDTO;
import net.sf.json.JSONObject;

public interface BusDataDAO {
	public int insertBusno(BusDTO busdto);
	public int busnoCheck(BusDTO busdto);
	public RouteSelectGisaDTO selectvenid(String r_num);
}
