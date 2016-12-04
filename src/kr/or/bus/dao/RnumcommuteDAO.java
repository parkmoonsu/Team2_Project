/*
*	@FileName : RnumcommuteDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 12. 01
*	@Author	: 조한솔
*	@Discription : 운영관리메뉴  노선별 출근 현황 DAO interface
*/


package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;

public interface RnumcommuteDAO {

	//노선별 출결현황 날짜
	public String[] getShow(String m_name);
	
	//노선별 출결현황 상태
	public String[] getStat(String m_name);
	
	//노선별 출결상황에서 이름,날짜 가져오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getNdselect();
	
	//
}
