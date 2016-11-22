/*
*	@FileName : MemberManageController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.21
*	@Author	: 박문수
*	@Discription : (관리자)회원 관리 페이지 Controller
*/


package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.service.MemberManageService;
@Controller
public class MemberManageController {
	
	@Autowired
	private MemberManageService service;
	
	@RequestMapping("/membermanage.htm")
	public String memberInfo(String pg , Model model) {
		
		List<MemberJoinMDetailDTO> list = service.memberInfo(pg);
		int membercount = service.memberCount();
		int page = service.pg(pg);
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",membercount);
		return "membermanage/memberinfo";
	}
	
	@RequestMapping("/joinapprove.htm")
	public String joinapprove(String pg , Model model){
		List<MemberJoinMDetailDTO> list = service.memberNList(pg);
		int page = service.pg(pg);
		int ncount = service.memberNCount();
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",ncount);
		
		return "membermanage/joinapprove";
	}
	
	@RequestMapping("/approveMember.htm")
	public String approveMember(String m_id){
		System.out.println("m_id : " + m_id);
		
		service.updateCheck(m_id);
		
		return "membermanage/updatesuccess";
	}
}
