/*
*	@FileName : OperationController.java
*	@Project	: KosBus
*	@Date	: 2016. 12. 01
*	@Author	: 조한솔
*	@Discription : (관리자)운영 관리 페이지 Controller
*/


package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.RnumcommuteDTO;
import kr.or.bus.service.OperationService;

@Controller
public class OperationController {

	@Autowired
	private OperationService service;
	
	//노선별 출결현황
	@RequestMapping("/routename.admin")
	public String showlist(ModelMap map){
		List<RnumcommuteDTO> list = service.getNdselect();

		map.addAttribute("list",list);
		return "operation/attendance";
	}
	
/*	@RequestMapping("/optionselect.admin")
	public String selectlist(ModelMap map){
		List<RnumcommuteDTO> list = service.getNdselect();

		map.addAttribute("list",list);
		return "operation/attendance";
	}*/
}
