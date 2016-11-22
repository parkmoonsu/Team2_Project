/*
*	@FileName : MemberDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : Member , Commute table DAO interface
*/

package kr.or.bus.dao;

import java.util.List;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;


public interface CommuteDAO {
	//public List<CommuteDTO> getSelect(String m_id);
	//public List<CommuteDTO> getSelect(int page, String field, String query, String m_id);
	
	//회원의 출/퇴근 시간조회
	public List<CommuteJoinCstartJoinCendDTO> getSelect(int page, String query, String m_id);
	
	//회원의 출근 시간
	public void csupdate(CommuteJoinCstartJoinCendDTO dto);	
	public String csselect(String m_id);
	
	//회원의 퇴근 시간
	//public void ceupdate();	
	//public String ceselect(String m_id, String c_end);

	
}