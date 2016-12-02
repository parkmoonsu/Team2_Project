package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;
import kr.or.bus.dto.TimetableDTO;
import kr.or.bus.service.ScheduleManageService;


@Controller
public class ScheduleManageController {
	
	@Autowired
	private View jsonview;

	@Autowired
	private ScheduleManageService service;
	
	/*
	제목 : 기사 휴무 및 스케쥴 관리 
	작성자 : 강민수
	목적 : 스케쥴 관리 view
	*/
	
	@RequestMapping("/managereguloff.admin")
	public String managereguloff(Model model){
		List<GarageDTO> gdto = service.showGarage();
		model.addAttribute("gdto", gdto);
		return "schedule/schedule_managereguloff";
	}
	@RequestMapping("/getselectedroute.admin")
	public View getSelectedGarageRoute(String g_num, Model model){
		List<RouteJoinGarageDTO> rdto = service.showRoute(g_num);
		model.addAttribute("rdto", rdto);
		return jsonview;
	}
	
	@RequestMapping("/getselectedmember.admin")
	public View getSelectedRouteMember(String r_num,Model model){
		System.out.println("r_num"+r_num);
		List<MemberJoinRegulOffDTO> mjrdto = service.unScheduledMember(r_num);
		List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> mrmbrjdto = service.scheduledMember(r_num);
		model.addAttribute("mjrdto", mjrdto);
		model.addAttribute("mrmbrjdto", mrmbrjdto);
		return jsonview;
	}
	//유효성 처리 해줘야 함
	@RequestMapping("/makingschedule.admin")
	public View makingSchedule(String m_id, String o_date, Model model){
		System.out.println(m_id+"/"+o_date);
		String o_code = service.decideReguloffMember(m_id, o_date);
		model.addAttribute("o_code", o_code);
		return jsonview;
	}
	//유효성 처리 해줘야 함,reguloffr
	@RequestMapping("/modifyingschedule.admin")
	public View modifyingSchedule(String m_id, String o_date, Model model){
		System.out.println(m_id+"/"+o_date);
		service.modifyReguloffMember(m_id, o_date);
		return jsonview;
	}
	
	/*
	제목 : 기사 휴무 및 스케쥴 관리 
	작성자 : 길한종
	목적 : 내용 추가(일정 승인)
	*/
	
	@RequestMapping("/gethistory.admin")
	public String getHistory(ModelMap map){
		
		List<RegulOffrJoinDTO> list=service.history_select();
		
		map.addAttribute("list", list);
		return "schedule/schedule_managerhistory";
	}
	
	@RequestMapping("/agreehistory.admin")
	public View agreeHistory(String m_id, String ro_object, ModelMap map){	
		service.history_agree(m_id, ro_object);
		map.addAttribute("list", "성공");
		return jsonview;
	}
	
	/*
	제목 : 기사 휴무 및 스케쥴 관리 
	작성자 : 길한종
	목적 : 내용 추가(운행 스케줄)
	*/
	
	@RequestMapping("/gettimetable.admin")
	public String getTimetable(ModelMap map){
		List<TimetableDTO> list=service.timetable_get();
		map.addAttribute("list", list);
		System.out.println(list);
		return "schedule/schedule_managertimetable";
	}
	/*
	제목 : 기사 휴무 및 스케쥴 관리 
	작성자 : 강민수
	목적 : cal 구현
	*/
	

	/*
	제목 : 예상 스케쥴 뽑기
	작성자 : 김수현
	목적 : 예상 스케쥴 가져오기
	*/
	
	
	@RequestMapping("/getvirtualschedule.admin")
	public String getVirtualSchedule(ModelMap map){
		List<RouteDTO> routelist= service.rnum_get();
		map.addAttribute("routelist",routelist);
		System.out.println("routelist : "+routelist);
		return "schedule/schedule_virtual";
	}
	
	//full calendar
	@RequestMapping("/lastpredictschedule.admin")
	public View lastpredictschedule(String m_id,String m_name, String o_date,Model model){
		service.predictschedule(m_id, m_name, o_date);
		System.out.println("m_id : "+m_id);
		return jsonview;
	}
	
	

	

	@RequestMapping(value = "/gethistorycal.admin", method = RequestMethod.GET)
	public String getHistoryCal(Model model){
		service.getRequestState(model);
		return "schedule/schedule_managechangeapprove";
	}

}
