package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;

public interface ScheduleManageDAO {
	//정기휴무가 정해지지 않은 노선의 사원들
	public List<MemberJoinRegulOffDTO> getUndecideReguloffMember(String r_num);
	
	//전체 노선 불러오기
	public List<RouteJoinGarageDTO> getTotalRoute(String g_num);
	
	//전체 차고지 불러오기
	public List<GarageDTO> getTotalGarage();
	
}
