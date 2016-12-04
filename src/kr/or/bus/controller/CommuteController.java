/*
*	@FileName : CommuteController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : 출/퇴근 관리 페이지 컨트롤러
*/


package kr.or.bus.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.reguloffrDTO2;
import kr.or.bus.service.CommuteService;
import kr.or.bus.service.MemberManageService;

@Controller
public class CommuteController {

	@Autowired
	private CommuteService service;
	
	@Autowired
	private MemberManageService service2;
	@Autowired
	private View jsonview;

	//출근	
	@RequestMapping(value="/gotowork.member", method=RequestMethod.POST)
	public View gotowork(String m_id, Model model) {
		System.out.println("gotowork post 시작");
		System.out.println("m_id값:" + m_id);
		
		CommuteJoinCstartJoinCendDTO dto = service.getCommuteInfo(m_id);

		model.addAttribute("dto",dto);
		
		return jsonview;
	}
	
	//퇴근
	@RequestMapping(value="/getoffwork.member", method=RequestMethod.POST)
	public View getoffwor(String m_id, Model model) {
		System.out.println("getoffwork post 시작");
		System.out.println("m_id값:" + m_id);
		
		CommuteJoinCstartJoinCendDTO dto = service.getoffCommuteInfo(m_id);
		
		model.addAttribute("dto",dto);
		
		return jsonview;
	}
		
	@RequestMapping("/comsearch.member")
	public String showlist(String pg , String m_id, String tdate, Model model) {
		
		List<CommuteJoinCstartJoinCendDTO> list = service.getSelect(pg, m_id);
		int page = service.pg(pg);
		
		int cscheck = service.csCheck(m_id);
		int cecheck = service.ceCheck(m_id);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("cscheck", cscheck);
		model.addAttribute("cecheck", cecheck);
		System.out.println(list.toString()+"asfasd");
		
		return "commute/comsearch";	
	}
	
	@RequestMapping("/comsearchstartinfo.member")
	public String showstartinfolist(String pg , String m_id, Model model) {
		
		List<CommuteJoinCstartJoinCendDTO> list = service.getSelect(pg, m_id);
		int count=service.count(m_id);
		int page = service.pg(pg);
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("count",count);
		
		return "commute/commutesearchtable";	 
	}
	
	
	
	
	@RequestMapping("/joinapprove.member")
	public String joinapprove(String pg , Model model,String m_id){
		System.out.println("????"+m_id);
		List<reguloffrDTO2> list = service2.regul(pg,m_id);
		int page = service.pg(pg);
		int ncount = service2.regulCount(m_id);
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",ncount);
		
		return "main/jasonNewApprove";
	}
	
	
	@RequestMapping("/Okay.member")
	public String Okay(String m_id) throws IOException{
		System.out.println("???"+m_id);
		service2.Okay(m_id);
		return "main/Okay";
	}
}	
