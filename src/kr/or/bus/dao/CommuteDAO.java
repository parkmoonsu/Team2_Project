package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;
import kr.or.bus.dto.CstandardDTO;

public interface CommuteDAO {
		
		//회원의 출/퇴근 시간조회
		public List<CommuteJoinCstartJoinCendDTO> getSelect(int page, String query, String m_id);		
		
		//출근하기
		public void insertCommuteInfo(String m_id, String m_name);
		
		//회원의 출근 시간
		public int csupdate(CommuteJoinCstartJoinCendDTO dto);		
		public CommuteJoinCstartJoinCendDTO csselect(CommuteJoinCstartJoinCendDTO dto);
		
		//퇴근하기
		public void offinsertCommuteInfo(String m_id, String m_name);
				
		//회원의 퇴근 시간
		public int ceupdate(CommuteJoinCstartJoinCendDTO dto);		
		public CommuteJoinCstartJoinCendDTO ceselect(CommuteJoinCstartJoinCendDTO dto);
		
		//기준시간 가져오기
		public CstandardDTO getStandardTime();
		
		//회원 정보 이름만 가져오기
		public String getOnlyName(String m_id);
		
}
