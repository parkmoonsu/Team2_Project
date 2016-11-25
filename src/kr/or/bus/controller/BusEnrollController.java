package kr.or.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusEnrollController {
	
	@RequestMapping("/busenroll.admin")
	public String menu(){
		return "busmanage/busenroll";
	}
	
}
