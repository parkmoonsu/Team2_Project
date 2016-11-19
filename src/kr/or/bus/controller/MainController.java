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
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.ResRecordDTO;
import kr.or.bus.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;

	@Autowired
	private View jsonview;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("/InfoChange.htm")
	public String login() {
		return "main/InfoChange";
	}

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
		
		model.addAttribute("dto", dto);
		return "main/ChangeForm";
	}

@RequestMapping("/Allow.htm")
public String allow(Model model){
	List<MemberJoinMDetailDTO> list = service.ncheck();
	
	model.addAttribute("list",list);
		return "main/Allow";
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
		
		if(result){
			viewpage = "main/updateinfo";
		}else{
			viewpage = "main/matchfailpass";
		}
		
		return viewpage;
	}
	
	@RequestMapping(value="/updateMember.htm",method=RequestMethod.POST)
	public String updateMember(MemberDTO mdto ,MDetailDTO ddto ,Principal principal, HttpServletRequest request ,Model model) throws Exception{
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		service.updateMember(mdto, ddto, principal.getName(), request);

		return "main/updatesuccess";
	}

}
