package kr.or.bus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bus.dto.MemberJoinCommuteDTO;

@Controller
public class CommuteSearchController {

	@RequestMapping(value="/comsearch.htm", method=RequestMethod.GET)
	public String csearch(MemberJoinCommuteDTO dto){
	
		return "main/comsearch";	
	}
}
