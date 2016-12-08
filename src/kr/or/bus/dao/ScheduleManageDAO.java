
package kr.or.bus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinBusJoinRouteJoinReguloffDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;

import kr.or.bus.dto.MemberJoinReguloffrJoinMoffDTO;

import kr.or.bus.dto.OscheduleJoinMemberDTO;

import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.ReguloffJoinMemberJoinBusJoinRouteDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RouteDTO2;
import kr.or.bus.dto.RouteJoinGarageDTO;
import kr.or.bus.dto.SelectDistinctDTO;

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
	public List<OscheduleJoinMemberDTO> timetable_get();
	/*public List<SelectDistinctDTO> selectdistinct();
	public String[] selecttime(SelectDistinctDTO selectdistinctdto);*/
	
	//가상스케줄 복사
	public void copy_vschedule();
	public void delete_vschedule();
	
	//스케줄상태 자동변경
	public void reguloffscheduler(String reguloff);
	
	//스케줄 상태 불러오기
	public String reguloff_schedulecheck();

	//최증스케줄
	public List<MemberJoinBusJoinRouteJoinReguloffDTO> getmemberjoinreg(String r_num); 
	public List<RouteDTO>getrnum();
	public List<RouteDTO2> getIntervalStartLast();
	
	/*//로그인된 사용자의 차량번호, 노선번호 검색
	public MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO rnumcheck(String m_id);*/
	

	// 휴무 상태 정보 가져오기
	public int getRequestNum();

	public int getRequestRefuseNum();

	public List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO> getRequestMember();
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> getRequestInfoCal(String r_num);
	public List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2> getMemberTempTrue(String r_num);
	public List<MemberJoinReguloffrJoinMoffDTO> getReqRescheduled(String r_num);
	
	public int updateFirstRegister(String m_id, String o_code); //승인
	public int updateFirstRegisterRecord(String m_id); //승인
	public int refuseFirstRegisterRecord(String m_id); //거절
	public int refuseFirstRegister(String m_id, String o_code); //거절
	public int refuseSameDelete(String m_id);//거절 if 휴무가 같을때 삭제
	public int updateBtwReqRegr(String m_id, String o_code);//승인 변경 요청자 update reguloffr
	public int updateBtwReqRego(String m_id, String o_code_1);//승인 변경 요청자 update reguloff
	public int updateBtwByRegr(String m_id_1,String o_code_1); //승인 변경 대상자 update reguloffr
	public int updateBtwByRego(String m_id_1,String o_code); //승인 변경 대상자 update reguloff
	public int updateBtwReqRegrre(String m_id, String o_code);//거절 변경 요청자 update reguloffr
	public int updateBtwReqRegore(String m_id, String o_code);//거절 변경 요청자 update reguloff
	public int updateBtwByRegrre(String m_id_1,String o_code_1); //거절 변경 대상자 update reguloffr
	public int updateBtwByRegore(String m_id_1,String o_code_1); //거절 변경 대상자 update reguloff
	
}
