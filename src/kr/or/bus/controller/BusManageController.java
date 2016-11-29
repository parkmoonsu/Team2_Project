/*
*	@FileName : BusManageController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : (관리자)버스 관리 페이지 Controller
*/


package kr.or.bus.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		int mcount = service.mBus();
		int ncount = service.nBus();
		int wcount = service.wBus();
		int gcount = service.gBus();
		
		model.addAttribute("m", mcount);
		model.addAttribute("n", ncount);
		model.addAttribute("w", wcount);
		model.addAttribute("g", gcount);
		
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
		
		System.out.println("b_vehiclenum.length : " + b_vehiclenum.length);
		for(int i = 0 ; i < b_vehiclenum.length ; i++){
				System.out.println(b_vehiclenum[i] + "/" + g_name[i]);
				System.out.println(service.alreadyUse(b_vehiclenum[i]));
				if(service.alreadyUse(b_vehiclenum[i]) == 0){
					
					service.insertBus(b_vehiclenum[i], r_num[i], g_name[i]);
					
					if(!mname[i].equals("선택")){
						service.updateVehicle(b_vehiclenum[i], mname[i]);
					}
					
					service.insertBStatus(b_vehiclenum[i], r_num[i]);
				}
					
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
	@RequestMapping("/chagozi.admin")
	public String chagozi(){
		
		
		return "redirect:chagozi.jsp";

	}
	

	//임시 노선별 출결현황
	@RequestMapping("/commutebus.admin")
	public String showlist(String r_num, Model model){
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = service.getShow(r_num);
		
		model.addAttribute("list", list);
		
		return "commute/attendance";
		
	}
	

	@RequestMapping("/update.admin")
	public String update(String b_vehiclenum_u , String g_name_u , String r_num_u , String mname_u , String hidden){
		System.out.println("update column : " + b_vehiclenum_u + "/" + g_name_u + "/" + r_num_u + "/" + mname_u + "/" + hidden);
		service.updateBus(b_vehiclenum_u, g_name_u, r_num_u , mname_u , hidden);
		  
		
		return "busmanage/updatesuccess";
	}
	
	@RequestMapping("/alreadyuse.admin")
	public View alreadyUse(String b_vehiclenum , Model model){
		String [] array = b_vehiclenum.split(",");
		System.out.println("받은것 : " +array.length);
		int result = 0;
		for(int i = 0; i < array.length; i++){
			System.out.println("넘어온 값 : "+array[i]);
			result = service.alreadyUse(array[i]);
		}
		//int data = service.alreadyUse(b_vehiclenum);
		System.out.println("#####data### : " + result );
		model.addAttribute("result", result);
		model.addAttribute("num", b_vehiclenum);
		return jsonview;
	}
	
	@RequestMapping("/matchpass.admin")
	public View matchPass(Principal principal , String m_pw , Model model){
		boolean result = service.getPass(principal.getName(), m_pw);
		String data = "";
		if(result){
			data = "true";
		}else{
			data = "false";
		}
		
		model.addAttribute("data", data);
		return jsonview;
	}
	
	@RequestMapping("/deleteBus.admin")
	public View deleteBus(String b_vehiclenum){
		System.out.println("삭제할 아이디는  : " + b_vehiclenum);
		service.deleteBus(b_vehiclenum);
		
		return jsonview;
	}

}
