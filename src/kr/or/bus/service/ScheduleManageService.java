package kr.or.bus.service;
import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import kr.or.bus.dao.ScheduleManageDAO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;
import kr.or.bus.dto.SelectDistinctDTO;
import kr.or.bus.dto.TimetableDTO;

@Service
public class ScheduleManageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<GarageDTO> showGarage(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<GarageDTO> gdto = dao.getTotalGarage();
		return gdto;
	}
	
	public List<RouteJoinGarageDTO> showRoute(String g_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RouteJoinGarageDTO> rdto = dao.getTotalRoute(g_num);
		return rdto;
	}
	
	public List<MemberJoinRegulOffDTO> unScheduledMember(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinRegulOffDTO> mjrdto = dao.getUndecideReguloffMember(r_num);
		return mjrdto;
	}
	
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> scheduledMember(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> mrmbrjdto = dao.getDecideReguloffMember(r_num);
		System.out.println("mrmbrjdto"+mrmbrjdto.toString());
		return mrmbrjdto;
	}
	
	public String decideReguloffMember(String m_id, String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.insertReguloff(m_id, dao.getOcode(o_date));
		return dao.getOcode(o_date);
	}
	
	public void modifyReguloffMember(String m_id, String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.updateReguloff(m_id, dao.getOcode(o_date));
	}
	
	
	//history
	public List<RegulOffrJoinDTO> history_select(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RegulOffrJoinDTO> list=dao.history_select();
		return list;
	}
	public void history_agree(String m_id, String ro_object){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.history_agree(m_id, ro_object);
	}
	
	//timetable
	public List<TimetableDTO> timetable_get(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		
		List<SelectDistinctDTO> list1=dao.selectdistinct();
		
		List<TimetableDTO> list2=new ArrayList<TimetableDTO>();
		
		//3 select문 돌리면서 시간 뽑아서 배열에 저장
		for(int index=0; index<list1.size(); index++){
			
			TimetableDTO dto=new TimetableDTO();
			SelectDistinctDTO selectdistinctdto=list1.get(index);

			String[] timelist=dao.selecttime(selectdistinctdto);
	
			
			dto.setSelectdistinctdto(list1.get(index));
			dto.setO_time(timelist);

			list2.add(dto);
		}

		return list2;
	}

	

	
	//수행할 최종스케줄 _김수현
	
	//캘린더에 content 뿌리기
	public List<MemberJoinRegulOffDTO> schedule_get(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinRegulOffDTO> list=dao.getmemberjoinreg();
		  return list;
	}
	
	/*public void predictschedule(String m_id,String m_name,String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.getmemberjoinreg();
	
	}*/
	
	//select box에 뿌리는 노선
	public List<RouteDTO> rnum_get(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RouteDTO> list=dao.getrnum();
		return list;
	}
	
	

	//휴무 요청 상태 가져오기
	public int getRequestState(Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int total = dao.getRequestNum(); //변경요청수
		int refuse = dao.getRequestRefuseNum(); //변경거절수
		List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO> mrordto = dao.getRequestMember();
		
		model.addAttribute("mrordto", mrordto);
		model.addAttribute("total", total);
		model.addAttribute("refuse", refuse);
		return total;
	}

	
	//휴무 요청 노선에 따른 정보 가져오기
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> getRequestInfoCal(String r_num, Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> mrmbrdto = dao.getRequestInfoCal(r_num);
		List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2> mbrdto = dao.getMemberTempTrue(r_num);
		System.out.println(mbrdto.toString());
		model.addAttribute("mrmbrdto", mrmbrdto); //정규 휴무 인원
		model.addAttribute("mbrdto", mbrdto); //정규 휴무 temp = true 인원
		return mrmbrdto;
	}
	
	//최초 휴무 등록자 요청 update 하기
	public int approveFirstRegister(String m_id, String o_code){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int result = dao.updateFirstRegister(m_id, o_code);
		return result;
	}
	
	//최초 휴무 등록자 휴무 기록 update 하기
	public int updateFirstRegisterRecord(String m_id, String o_code){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int result = dao.updateFirstRegisterRecord(m_id);
		return result;
	}
	
	//최초 휴무 등록자 거절 하기
	public int updateRefuseFirstRegister(String m_id, String o_code){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int result = dao.refuseFirstRegisterRecord(m_id);
		return result;
	}

}
