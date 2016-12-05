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
import kr.or.bus.dto.RnumcommuteDTO;
import kr.or.bus.dto.RnumcommuteDTO2;

public interface RnumcommuteDAO {

	//노선별 출결현황 날짜
	public String[] getShow(String m_name , String date);
	
	//노선 선택시 출결현황 날짜
	public List<RnumcommuteDTO2> getShow2(String m_name, String r_num);
	
	//노선별 출결현황 상태
	public String[] getStat(String m_name);
	
	//노선 선택시 출결현황 상태
	public List<RnumcommuteDTO2> getStat2(String m_name, String r_num);
	//public ArrayList<String> getStat2(String m_name, String r_num);
	
	//노선별 출결상황에서 이름,날짜 가져오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getNdselect();
	
	//노선 선택시 보여지는 특정 회원의 출결현황
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getMember(String r_num);
	
	//
	//public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getselect(String r_num);
}
