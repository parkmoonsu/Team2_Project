/*
*	@FileName : OperationController.java
*	@Project	: KosBus
*	@Date	: 2016. 12. 01
*	@Author	: 조한솔
*	@Discription : (관리자)운영 관리 페이지 Controller
*/


package kr.or.bus.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.RnumcommuteDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.service.OperationService;

@Controller
public class OperationController {

	@Autowired
	private View jsonview;
	
	
	@Autowired
	private OperationService service;
	
	//노선별 출결현황
	@RequestMapping("/routename.admin")
	public String showlist(ModelMap map){
		List<RnumcommuteDTO> list = service.getNdselect();
		List<RouteDTO> rlist = service.getRout();	
		
		Calendar cal = Calendar.getInstance();
		 
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) +1;
		int date = cal.get(cal.DATE);
		System.out.println("year : " + year + "/month : " + month);
		map.addAttribute("year", year);
		map.addAttribute("month", month);
		map.addAttribute("date", date);
		map.addAttribute("list",list);
		map.addAttribute("rlist",rlist);
		
		//System.out.println(list);
		return "operation/attendance";
	}
	
	//노선 선택시 출결현황
	@RequestMapping("/routelist.admin")
	public String memberlist(String r_num, ModelMap map){
		System.out.println("들어갔어??");
		
		System.out.println(r_num+"ddd");
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> mlist=service.getMember(r_num);
		List<String> nlist = service.getStat2(r_num);
		
		List<String> slist = service.getShow2(r_num);
		System.out.println(r_num+"ddd");
   
		map.addAttribute("mlist",mlist);
		map.addAttribute("nlist", nlist);
		map.addAttribute("slist",slist);
		System.out.println("확인확인" + mlist.toString());
		System.out.println("확인확인" + nlist.toString());
		System.out.println("확인확인" + slist.toString());
		
		return "operation/attendance2";
		
	}
	
	
	//전체 노선
/*	@RequestMapping("/routelist.admin")
	public View route(Model model){
		return jsonview;
	}*/

/*	@RequestMapping("/optionselect.admin")
	public String selectlist(ModelMap map){
		List<RnumcommuteDTO> list = service.getNdselect();

		map.addAttribute("list",list);
		return "operation/attendance";
	}*/
}
