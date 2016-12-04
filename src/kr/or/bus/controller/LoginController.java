/*
*	@FileName : LoginController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.16
*	@Author	: 박문수
*	@Discription : 로그인 페이지 Controller
*/

package kr.or.bus.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MemberJoinJobDTO;
import kr.or.bus.service.BusManageService;
import kr.or.bus.service.LoginService;
import net.sf.json.JSONObject;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private BusManageService service2;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping("/login.htm")
	public String login(){
		System.out.println("오냐");
		return "login/login";
	}
	
	@RequestMapping("/main.htm")
	public String mainGo(Principal principal , Model model){
		
		System.out.println("username :" + principal.getName());
		MemberJoinJobDTO dto = service.mainGo(principal.getName());
		String jobname = dto.getJ_name();
		model.addAttribute("jobname", jobname);
 
		return "main/main";
	}
	@RequestMapping("/adminmain.admin")
	public String adminmain(Model model){
		int count = service2.busCount();
		int acount = service2.aBus(); //공항
		int mcount = service2.mBus(); //간선
		int ncount = service2.nBus(); //지선
		int wcount = service2.wBus(); //순환
		int gcount = service2.gBus(); //광역
		int icount = service2.iBus(); //인천
		int kcount = service2.kBus(); //경기
		int dcount = service2.dBus(); //폐지
		int pcount = service2.pBus(); //공용
		int noroute = service2.noRoute();
		//1:공항, 3:간선, 4:지선, 5:순환, 6:광역, 7:인천, 8:경기, 9:폐지, 0:공용
		model.addAttribute("a", acount);
		model.addAttribute("m", mcount);
		model.addAttribute("n", ncount);
		model.addAttribute("w", wcount);
		model.addAttribute("g", gcount);
		model.addAttribute("i", icount);
		model.addAttribute("k", kcount);
		model.addAttribute("d", dcount);
		model.addAttribute("p", pcount);
		model.addAttribute("no", noroute);
		model.addAttribute("count", count);
		
		return "main/adminmain";
	}
	
	
	@RequestMapping("/search.htm")
	public String search(){
		return "login/search";
	}
	
	@RequestMapping("/searchid.htm")
	public String searchId(String m_name , String m_email) throws Exception{
		String viewpage = "";
		
		if(service.searchName(m_name, m_email).equals("")){
			viewpage = "login/searchidfail";
		}else{
			viewpage = "login/searchidsuccess";
		}
		
		return viewpage;
	}
	
	@RequestMapping("/searchpw.htm")
	public String searchPw(String m_id , String m_email) throws Exception{
		String viewpage = "";
		
		if(service.searchPw(m_id, m_email).equals("")){
			viewpage = "login/searchidfail";
		}else{
			viewpage = "login/searchpwsuccess";
		}
		
		return viewpage;
	}
	
	//json
	@RequestMapping("/weather.htm")
	public View weather(Model model) throws Exception{

		JSONObject temp =  service.temp();
		JSONObject day6 =  service.day6();
		
		model.addAttribute("temp", temp);
		model.addAttribute("day6", day6);
		
		return jsonview;
	}
}
