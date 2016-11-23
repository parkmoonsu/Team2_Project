package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;

public interface CommuteDAO {
		
		//회원의 출/퇴근 시간조회
		public List<CommuteJoinCstartJoinCendDTO> getSelect(int page, String query, String m_id);		
		
		//회원의 출근 시간
		public int csupdate(CommuteJoinCstartJoinCendDTO dto);		
		public CommuteJoinCstartJoinCendDTO csselect(CommuteJoinCstartJoinCendDTO dto);
		
		//회원의 퇴근 시간
		public int ceupdate(CommuteJoinCstartJoinCendDTO dto);		
		public CommuteJoinCstartJoinCendDTO ceselect(CommuteJoinCstartJoinCendDTO dto);
}
