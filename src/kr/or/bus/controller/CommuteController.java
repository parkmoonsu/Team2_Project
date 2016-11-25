package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;
import kr.or.bus.service.CommuteService;

@Controller
public class CommuteController {

	@Autowired
	private CommuteService service;
	
	@Autowired
	private View jsonview;

	//출근
	@RequestMapping(value="/gotowork.member", method=RequestMethod.GET)
	public String gotoworkview() {
		System.out.println("gotoworkviw get 시작");
		
		return "commute/gotowork";
	}
	
	@RequestMapping(value="/gotowork.member", method=RequestMethod.POST)
	public View gotowork(String m_id, Model model) {
		System.out.println("gotowork post 시작");
		System.out.println("m_id값:" + m_id);
		
		CommuteJoinCstartJoinCendDTO dto = service.getCommuteInfo(m_id);

		model.addAttribute("dto",dto);
		
		return jsonview;
	}
	
	//퇴근
	@RequestMapping(value="/getoffwork.member", method=RequestMethod.GET)
	public String getoffworkview() {
		System.out.println("getoffworkviw get 시작");
		
		return "commute/getoffwork";
	}
	
	@RequestMapping(value="/getoffwork.member", method=RequestMethod.POST)
	public View getoffwor(String m_id, Model model) {
		System.out.println("getoffwork post 시작");
		System.out.println("m_id값:" + m_id);
		
		CommuteJoinCstartJoinCendDTO dto = service.getoffCommuteInfo(m_id);
		
		model.addAttribute("dto",dto);
		
		return jsonview;
	}
		
	@RequestMapping("/comsearch.member")
	public String showlist(String pg , String m_id, Model model) {
		
		List<CommuteJoinCstartJoinCendDTO> list = service.getSelect(pg, m_id);
		int page = service.pg(pg);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		System.out.println(list.toString()+"asfasd");
		return "commute/comsearch";	
	}
	
	@RequestMapping("/comsearchstartinfo.member")
	public String showstartinfolist(String pg , String m_id, Model model) {
		
		List<CommuteJoinCstartJoinCendDTO> list = service.getSelect(pg, m_id);
		int page = service.pg(pg);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		System.out.println(list.toString()+"asfasd");
		return "commute/commutesearchtable";	
	}
	
}
