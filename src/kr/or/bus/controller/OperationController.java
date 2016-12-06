/*
*	@FileName : OperationController.java
*	@Project	: KosBus
*	@Date	: 2016.12.06
*	@Author	: 박문수
*	@Discription : (관리자)운영 관리 페이지 Controller
*/
package kr.or.bus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.service.OperationService;

@Controller
public class OperationController{
	
	@Autowired
	private OperationService service;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping("/changehistory.admin")
	public String history(Model model , String pg){
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = service.regulList(pg);
		int count = service.countList();
		int page = service.pg(pg);
		int pagecount = 0;
		if(count % 10 == 0){
			pagecount = count/10;
		}else{
			pagecount = count/10 + 1;
		}
		 
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pagecount", pagecount);
		 
		return "operation/changehistory";
	}
	
	@RequestMapping("/searchHistory.admin")
	public String search(Model model ,String search){
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = service.dayList(search);
		model.addAttribute("list", list);
		return "operation/daylist";
	}
	
	@RequestMapping("/searchCode.admin")
	public String searchCode(Model model , String search){
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = service.codeList(search);
		model.addAttribute("list", list);
		return "operation/daylist";
	}
	
	@RequestMapping("/searchName.admin")
	public String searchName(Model model , String search){
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = service.nameList(search);
		model.addAttribute("list", list);
		return "operation/daylist";
	}
	
	@RequestMapping("/getrouteajax.admin")
	public View getRoute(Model model){
		List<RouteDTO> list = service.getRoute();
		model.addAttribute("list", list);
		
		return jsonview;
	}
	
	@RequestMapping("/searchRoute.admin")
	public String searchRoute(Model model , String search){
		List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> list = service.routeList(search);
		model.addAttribute("list", list);
		return "operation/daylist";
	}
}
