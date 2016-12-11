/*
*	@FileName : BusLocationInfoDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.27
*	@Author	:  김용현, 김지현
*	@Discription : bus ... ect DAO interface
*/

package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.BusLocationInfoDTO;

public interface BusLocationInfoDAO {
	public BusLocationInfoDTO SearchRider(String busno);
	public List<BusLocationInfoDTO> simulationdata(String r_num);
}
