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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinMDetailRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrDTO;
import kr.or.bus.service.MemberManageService;
@Controller
public class MemberManageController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private MemberManageService service;
	
	@RequestMapping("/membermanage.admin")
	public String memberInfo(String pg , Model model) {
		
		List<MemberJoinMDetailDTO> list = service.memberInfo(pg);
		int membercount = service.memberCount();
		int page = service.pg(pg);
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",membercount);
		return "membermanage/memberinfo";
	}
	

	@RequestMapping(value="/mailsend.htm", method=RequestMethod.POST)
	public ModelAndView msendToMember(String subject, String to, String content, @RequestParam("filename") MultipartFile filename){
		
		service.mailSendToMember(subject, to, content, filename);
		
		return new ModelAndView("redirect:/membermanage.htm");
	}
	@RequestMapping("/joinapprove.admin")
	public String joinapprove(String pg , Model model){
		List<MemberJoinMDetailDTO> list = service.memberNList(pg);
		int page = service.pg(pg);
		int ncount = service.memberNCount();
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",ncount);
		
		return "membermanage/joinapprove";
	}

	@RequestMapping("/searching.htm")
	public View searching(String param){
		System.out.println("param"+param);
		return jsonview;
	}
	
	@RequestMapping("/approveMember.admin")
	public String approveMember(String m_id){
		System.out.println("m_id : " + m_id);
		
		service.updateCheck(m_id);
		
		return "membermanage/updatesuccess";

	}

	@RequestMapping("/memberdetail.htm")
	public String memberDetail(String param, Model model){
		System.out.println("memberdetail.htm시작");
		System.out.println("param"+param);
		MemberJoinMDetailRegulOffDTO dto = service.memberDetail(param);
		model.addAttribute("dto", dto);
		return "membermanage/memberdetailmodal";
	}
	@RequestMapping("/memberreguloffr.htm")
	public String memberreguloffr(String param, Model model){
		System.out.println("memberreguloffr.htm 시작");
		System.out.println("param"+param);
		
		List<MemberJoinRegulOffrDTO> list = service.memberreguloffr(param);
		model.addAttribute("offrlist", list);
		
		return "membermanage/memberdetailmodaltable";
	}

	

	@RequestMapping("/deleteMember.admin")
	public View deleteMember(String param , Model model , String pg){
	  System.out.println("member id가 삭제가 될까욧?");
      System.out.println("삭제 아이디 띄워주세요"+param);
      service.delete(param);
      
      return jsonview;
   }


}
