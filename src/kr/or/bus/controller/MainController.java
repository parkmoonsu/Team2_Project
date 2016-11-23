/*
*	@FileName : MainController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.18
*	@Author	: 박문수
*	@Discription : 메인 페이지 Controller
*/


package kr.or.bus.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinJobDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;
import kr.or.bus.dto.ResRecordDTO;
import kr.or.bus.service.LoginService;
import kr.or.bus.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	@Autowired
	private LoginService service2;
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("/SearchMember.htm")
	public View select(String search, Model model) {

		List<MemberDTO> dto = service.selectall(search);
		model.addAttribute("dto", dto);

		return jsonview;
	}

	@RequestMapping("/ChangeForm.htm")
	public String ChangeForm(Model model, Principal principal) {
		System.out.println("세션 ID : " + principal.getName());
		MemberJoinMDetailDTO dto = service.getMemberInfo(principal.getName());
		
		List<MemberJoinResRecordDTO> list = service.getResRecordInfo(principal.getName());
	

		MemberJoinJobDTO dto2 = service2.mainGo(principal.getName());
		String jobname = dto2.getJ_name();
		 
		model.addAttribute("list",list);
		model.addAttribute("dto", dto);
		model.addAttribute("jobname", jobname);

		return "main/ChangeForm";
	}

	@RequestMapping("/updateinfo.htm")
	public String updateinfo(Model model , Principal principal , String m_pw){
		System.out.println("세션 ID : " + principal.getName());
		
		String encodepass = service.getPass(principal.getName());
		System.out.println("m_pw : " + m_pw);
		System.out.println("encodePass : " + encodepass);
		
		boolean result = bCryptPasswordEncoder.matches(m_pw, encodepass);
		
		System.out.println("result : " + result);
		
		String viewpage = "";
		
		MemberJoinMDetailDTO dto = service.getMemberInfo(principal.getName());
		
		model.addAttribute("dto", dto);
		
		MemberJoinJobDTO dto2 = service2.mainGo(principal.getName());
		String jobname = dto2.getJ_name();
		
		model.addAttribute("jobname", jobname);
		if(result){
			viewpage = "main/updateinfo";
		}else{
			viewpage = "main/matchfailpass";
		}
		
		return viewpage;
	}
	
	@RequestMapping(value="/updateMember.htm",method=RequestMethod.POST)
	public String updateMember(MemberDTO mdto ,MDetailDTO ddto ,Principal principal,String hidden, HttpServletRequest request ,Model model) throws Exception{
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		System.out.println("hidden : " + hidden);
		service.updateMember(mdto, ddto, principal.getName(), hidden, request);

		return "main/updatesuccess";
	}
	
	@RequestMapping("/name.htm")
	public View getName(String m_id , Model model){
		System.out.println("getName의 m_id : " + m_id);
		MemberDTO dto = service.getName(m_id);
		System.out.println("가져온 이름 : " + dto.getM_name());
		model.addAttribute("m_name", dto.getM_name());
		return jsonview;
	}

	@RequestMapping("/photo.htm")
	public View getPhoto(String m_id , Model model){
		MDetailDTO dto = service.getPhoto(m_id);
		model.addAttribute("m_photo",dto.getM_photo());
		return jsonview;
	}
}
