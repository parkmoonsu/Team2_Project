package kr.or.bus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.RouteStopCopyJoinStopDTO;
import kr.or.bus.service.RouteManageService;

@Controller
public class RouteManageController {
	
	@Autowired
	RouteManageService routeManageSerivce;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="/route.admin",method=RequestMethod.GET)
	public String routePageOpen(){
		return "routemanage/RouteManage";	
	}
	//현재 불러오기 버튼이 두개지만.. 추후 하나로 통합할예정.
	
	//파일의 마커 좌표 저장
	@RequestMapping(value="/routeSave.admin",method=RequestMethod.GET)
	public void routeSave(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationSave(request , response);
	}
		
	//수정된 마커 좌표 불러오기
	@RequestMapping(value="/routeEditRead.admin",method=RequestMethod.GET)
	public void routeEditRead(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationEditRead(request , response);
	}
	
	
	//추가
	@RequestMapping(value="/routeRead.admin",method=RequestMethod.POST)
	public View routeRead(HttpServletRequest request , HttpServletResponse response, Model model) throws Exception{

		List<RouteStopCopyJoinStopDTO> list=routeManageSerivce.routeRead(request , response);

		model.addAttribute("list", list);
		return jsonview;
	}
}
