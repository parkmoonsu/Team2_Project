package kr.or.bus.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;

public interface CommuteDAO {
	
	//이름 값 가져오기
	public String getName(String m_id);
	
	//회원의 퇴근 시간조회  
	public List<CommuteJoinCstartJoinCendDTO> getSelect(int page,String m_id);	
	
	//test
	public List<CommuteJoinCstartJoinCendDTO> getoffSelect(int page, String m_id);	


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
	public CommuteJoinCstartJoinCendDTO ceselect(String m_id,String tdate);
}
