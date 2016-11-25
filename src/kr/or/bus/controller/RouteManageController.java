package kr.or.bus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bus.service.RouteManageService;

@Controller
public class RouteManageController {
	@Autowired
	RouteManageService routeManageSerivce;
	
	//파일의 마커 좌표 저장
	@RequestMapping(value="/Maplist2.do",method=RequestMethod.GET)
	public void routeSave(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationSave(request , response);
	}
		
	//파일에서 마커 좌표를 읽어온다
	@RequestMapping(value="/Maplist3.do",method=RequestMethod.GET)
	public void routeLoad(HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationRead(response);
	}
}
