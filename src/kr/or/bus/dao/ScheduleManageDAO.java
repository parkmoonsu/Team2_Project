
package kr.or.bus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;
import kr.or.bus.dto.SelectDistinctDTO;
import kr.or.bus.dto.TimeDTO;
import kr.or.bus.dto.RouteDTO;

public interface ScheduleManageDAO {
	// 정기휴무가 정해지지 않은 노선의 사원들
	public List<MemberJoinRegulOffDTO> getUndecideReguloffMember(String r_num);

	// 전체 노선 불러오기
	public List<RouteJoinGarageDTO> getTotalRoute(String g_num);

	// 전체 차고지 불러오기
	public List<GarageDTO> getTotalGarage();

	// 정기휴무가 정해진 노선의 사원들
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> getDecideReguloffMember(String r_num);

	// 휴무가 정해지지 않은 노선의 사원 정규 휴무 코드 가져오기
	public String getOcode(String o_date);

	// 휴무가 정해지지 않은 노선의 사원 휴무 정하기
	public int insertReguloff(String m_id, String o_code);

	// 정해진 휴무를 변경해주기
	public int updateReguloff(String m_id, String o_code);

	// history
	public List<RegulOffrJoinDTO> history_select();

	public void history_agree(@Param("m_id") String m_id, @Param("ro_object") String ro_object);

	// timetable
	public List<SelectDistinctDTO> selectdistinct();

	public String[] selecttime(SelectDistinctDTO selectdistinctdto);

	// 최증스케줄
	public List<MemberJoinRegulOffDTO> getmemberjoinreg();

	public List<MemberJoinRegulOffDTO> getmemberjoinreg(String m_id, String m_name, String o_date);

	public List<RouteDTO> getrnum();

	// 휴무 상태 정보 가져오기
	public int getRequestNum();

	public int getRequestRefuseNum();

	public List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO> getRequestMember();

	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> getRequestInfoCal(String r_num);

	public List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2> getMemberTempTrue(String r_num);

	public int updateFirstRegister(String m_id, String o_code); // 승인

	public int updateFirstRegisterRecord(String m_id); // 승인

	public int refuseFirstRegisterRecord(String m_id); // 거절
}
