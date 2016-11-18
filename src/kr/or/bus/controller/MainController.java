package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MemberDTO;
import kr.or.bus.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
	private View jsonview;

	
@RequestMapping("/InfoChange.htm")
public String login(){
		return "main/InfoChange";
	}
	
@RequestMapping("/SearchMember.htm")
public View select(String search,Model model){
		
		List<MemberDTO> dto=service.selectall(search);
		model.addAttribute("dto", dto);
	
		return jsonview;
	}
@RequestMapping("/ChangeForm.htm")
public String ChangeForm(){
		return "main/ChangeForm";
	}

@RequestMapping("/Allow.htm")
public String alloew(Model model){
	List<MemberDTO> dto=service.Mcheck();
	
	model.addAttribute("dto",dto);
		return "main/Allow";
	}


}
