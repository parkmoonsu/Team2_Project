/*
*	@FileName : BusManageController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : (관리자)버스 관리 페이지 Controller
*/


package kr.or.bus.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.service.BusManageService;

@Controller
public class BusManageController {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private BusManageService service;
	
	@RequestMapping("/busenroll.admin")
	public String menu(String pg , Model model){
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = service.busInfo(pg);
		int page = service.pg(pg);
		int count = service.busCount();
		   
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("count",count);
		return "busmanage/busenroll";
	}
	
	@RequestMapping("/enrollpage.admin")
	public String enrollpage(){
		return "busmanage/enroll";
	}
	
	@RequestMapping("/getgarage.admin")
	public View getGarageName(Model model){
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> g_name = service.getGarageName();
		List<String> gname = new ArrayList<String>();
		List<String> gnum = new ArrayList<String>();
		
		for(int i = 0 ; i < g_name.size() ; i++ ){
			gname.add(g_name.get(i).getG_name());
			gnum.add(g_name.get(i).getG_num());
			System.out.println("gname : " + gnum.get(i));
		}
		model.addAttribute("gname", gname);
		model.addAttribute("gnum", gnum);
		return jsonview;
	}
	
	@RequestMapping(value="/getroute.admin",method=RequestMethod.POST)
	public View getRouteNum(String g_num , Model model){
		System.out.println("차고지번호 :" + g_num);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> r_num = service.getRouteNum(g_num);
		List<String> rnum = new ArrayList<String>();
		
		for(int i = 0 ; i < r_num.size() ; i++){
			rnum.add(r_num.get(i).getR_num());
			System.out.println("rnum : "  + rnum.get(i));
		}
		
		model.addAttribute("rnum", rnum);
		
		return jsonview;
	}
	
	@RequestMapping("/getmember.admin")
	public View getMember(Model model){
		List<MemberDTO> member = service.getMember();
		List<String> m_id  = new ArrayList<String>();
		List<String> m_name  = new ArrayList<String>();
		
		for(int i = 0 ; i < member.size() ; i++){
			m_id.add(member.get(i).getM_id());
			m_name.add(member.get(i).getM_name());
			
		}
		
		model.addAttribute("m_id", m_id);
		model.addAttribute("m_name", m_name);
		
		return jsonview;
	}
	
	@RequestMapping("/reg.admin")
	public String reg(String[] b_vehiclenum , String[] g_name , String[] r_num , String[] mname){
		for(int i = 0 ; i < b_vehiclenum.length ; i++){
			service.insertBus(b_vehiclenum[i], r_num[i], g_name[i]);
			
			if(!mname[i].equals("선택")){
				service.updateVehicle(b_vehiclenum[i], mname[i]);
			}
			
			service.insertBStatus(b_vehiclenum[i], r_num[i]);
		}
		
		return "busmanage/insertbussuccess";
	}
	
	@RequestMapping("/enrollupdate.admin")
	public String enrollUpdate(String b_vehiclenum , Model model){
		BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO dto = service.getVehicle(b_vehiclenum);
		 
		model.addAttribute("bdto", dto);
		
		return "busmanage/enrollupdate"; 
	}
	
	@RequestMapping(value="/getgarage2.admin",method=RequestMethod.POST)
	public View getGarageName(String g_num , Model model){
		//System.out.println("g_num : " + g_num);
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> g_name = service.getGarageName(g_num);
		List<String> gname = new ArrayList<String>();
		List<String> gnum = new ArrayList<String>();
		
		for(int i = 0 ; i < g_name.size() ; i++ ){
			gname.add(g_name.get(i).getG_name());
			gnum.add(g_name.get(i).getG_num());
			System.out.println("gname : " + gnum.get(i));
		}
		model.addAttribute("gname", gname);
		model.addAttribute("gnum", gnum);
		
		return jsonview;
	}
	
	@RequestMapping(value="/getroutenum2.admin",method=RequestMethod.POST)
	public View getRouteNum2(String g_num , Model model){
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> r_num = service.getRoute(g_num);
		List<String> rnum = new ArrayList<String>();
		
		for(int i = 0 ; i < r_num.size() ; i++){
			rnum.add(r_num.get(i).getR_num());
			System.out.println("rnum : "  + rnum.get(i));
		}
		
		model.addAttribute("rnum", rnum);
		return jsonview;
	}
	
	@RequestMapping("/getmember2.admin")
	public View getMember2(Model model ,String mid){
		List<MemberDTO> member = service.getMembers(mid);
		List<String> m_id  = new ArrayList<String>();
		List<String> m_name  = new ArrayList<String>();
		
		for(int i = 0 ; i < member.size() ; i++){
			m_id.add(member.get(i).getM_id());
			m_name.add(member.get(i).getM_name());
			
		}
		
		model.addAttribute("m_id", m_id);
		model.addAttribute("m_name", m_name);
		
		return jsonview;
	}
	
}
