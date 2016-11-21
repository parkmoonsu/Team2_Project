/*
*	@FileName : MemberDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : Member , Commute table DAO interface
*/

package kr.or.bus.dao;

import java.util.List;
import kr.or.bus.dto.CommuteDTO;

public interface CommuteDAO {
	public List<CommuteDTO> getSelect(String m_id);
	//public List<CommuteDTO> getSelect(int page, String field, String query,String m_id);
}