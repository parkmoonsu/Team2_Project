/*
*	@FileName : MainController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.18
*	@Author	: 박문수
*	@Discription : 메인 페이지 Controller
*/


package kr.or.bus.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;


import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinJobDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.service.LoginService;
import kr.or.bus.service.MainService;
import net.sf.json.JSONObject;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	@Autowired
	private LoginService service2;
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("/SearchMember.htm")
	public View select(String search,String search2, Model model) {
			System.out.println("search1 :"+search);
			System.out.println("search2 :"+search2);
		List<MemberDTO> dto = service.selectall(search,search2);
		model.addAttribute("dto", dto);

		return jsonview;
	}

	
	
	@RequestMapping("/ChangeForm.htm")
	public String ChangeForm(Model model, Principal principal) {
		System.out.println("세션 ID : " + principal.getName());
		MemberJoinMDetailDTO dto = service.getMemberInfo(principal.getName());
		
		List<MemberJoinResRecordDTO> list = service.getResRecordInfo(principal.getName());
		List<Integer> list2 = service.csStatic(principal.getName());
		
		MemberJoinJobDTO dto2 = service2.mainGo(principal.getName());
		String jobname = dto2.getJ_name();
		  
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("dto", dto);
		model.addAttribute("jobname", jobname);

		return "main/changform";
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
		
		MemberJoinJobDTO dto2 = service2.mainGo(principal.getName());
		String jobname = dto2.getJ_name();
		
		model.addAttribute("jobname", jobname);
		if(result){
			viewpage = "main/updateinfo";
		}else{
			viewpage = "main/matchfailpass";
		}
		
		return viewpage;
	}
	
	@RequestMapping(value="/updateMember.htm",method=RequestMethod.POST)
	public String updateMember(MemberDTO mdto ,MDetailDTO ddto ,Principal principal,String hidden, HttpServletRequest request ,Model model) throws Exception{
		System.out.println(ddto.toString());
		System.out.println(mdto.toString());
		System.out.println("hidden : " + hidden);
		service.updateMember(mdto, ddto, principal.getName(), hidden, request);

		return "main/updatesuccess";
	}
	
	@RequestMapping("/name.htm")
	public View getName(String m_id , Model model){
		System.out.println("getName의 m_id : " + m_id);
		MemberDTO dto = service.getName(m_id);
		System.out.println("가져온 이름 : " + dto.getM_name());
		model.addAttribute("m_name", dto.getM_name());
		return jsonview;
	}

	@RequestMapping("/photo.htm")
	public View getPhoto(String m_id , Model model){
		MDetailDTO dto = service.getPhoto(m_id);
		model.addAttribute("m_photo",dto.getM_photo());
		return jsonview;
	}
	
	@RequestMapping("/bell.htm")
	public View getApproveCount(Model model){
		int appcount = service.approveCount();
		
		model.addAttribute("appcount", appcount);
		return jsonview;
		
	}
	@RequestMapping("/route.htm")
	public View getRoute(Model model){
		List<RouteDTO> rlist = service.getRouteNum();
		
		model.addAttribute("rlist", rlist);
		
		return jsonview;
	}
	

	@RequestMapping(value="/bell2.htm",method=RequestMethod.POST)
	public View getReqdate(String m_id, Model model){
		System.out.println("오셨나요?");
		int dto=service.getRegul(m_id);
		System.out.println("dto:"+dto);
		model.addAttribute("dto",dto);
		
		return jsonview;
		
	}

	@RequestMapping("/busstop.htm")
	public View getBusStop(Model model , String flotyear , String flotmonth , String flotroute) throws Exception{
		System.out.println("flotyear : " + flotyear + "flotmonth : " + flotmonth );
		JSONObject jsonroute = service.busStop(flotyear, flotmonth, flotroute);
		
		model.addAttribute("jroute", jsonroute);
		return jsonview;
	}

}
