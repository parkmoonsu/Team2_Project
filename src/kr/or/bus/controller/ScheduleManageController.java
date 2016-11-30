package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;
import kr.or.bus.service.JoinService;
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
	
}
