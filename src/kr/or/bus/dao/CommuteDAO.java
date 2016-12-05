/*
*	@FileName : CommuteDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : Cstart, Cend, Commute join table DAO interface
*/

package kr.or.bus.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;

public interface CommuteDAO {
	
	//이름 값 가져오기
	public String getName(String m_id);
	
	//회원의 출/퇴근 시간조회  
	public List<CommuteJoinCstartJoinCendDTO> getSelect(int page,String m_id);	
	
	//출/퇴근 목록 개수
	public int count(String m_id);
	
	//출근insert
	public int gotowork(String m_id, String m_name, String tdate,String dhour);
		
	//출근코드 update
	public int updateCommute(@Param("m_id")String m_id,  @Param("tdate")String tdate,@Param("dhour")String dhour);
	
	//출근상태보여주기
	public CommuteJoinCstartJoinCendDTO csselect(String m_id, String tdate);
			
	//퇴근시간 update
	public int updateendtime(String dhour, String m_id, String tdate);
	
	//퇴근코드 update
	public int updateCommuteoff(@Param("m_id")String m_id,  @Param("tdate")String tdate,@Param("dhour")String dhour);
	
	//퇴근상태보여주기
	public CommuteJoinCstartJoinCendDTO ceselect(String m_id, String tdate);
	
	//출근했는지 체크
	public int csCheck(String m_id, @Param("tdate")String tdate);
	
	//퇴근했는지 체크
	public int ceCheck(String m_id, @Param("tdate")String tdate);
}
