package kr.or.bus.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;

	@Autowired
	private View jsonview;

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
	public String updateinfo(){
		return "main/updateinfo";
	}

}
