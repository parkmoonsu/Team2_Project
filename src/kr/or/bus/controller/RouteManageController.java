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
		
	//파일에서 마커 원본좌표를 읽어온다
	@RequestMapping(value="/routeRead.admin",method=RequestMethod.GET)
	public void routeRead(HttpServletRequest request,HttpServletResponse response) throws Exception{
		routeManageSerivce.busStopPointRead(request,response);
	}
	
	//마커 좌표 수정
	@RequestMapping(value="/routeEdit.admin",method=RequestMethod.GET)
	public void routeEdit(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationEdit(request , response);
	}
	
	//수정된 마커 좌표 불러오기
	@RequestMapping(value="/routeEditRead.admin",method=RequestMethod.GET)
	public void routeEditRead(HttpServletRequest request , HttpServletResponse response) throws Exception{
		routeManageSerivce.routelocationEditRead(request , response);
	}
	
	//실시간 위치추적 30초마다 갱신됨
	@RequestMapping(value="/RealTimeSearch.admin",method=RequestMethod.GET)
	public void buslocationLoad(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		routeManageSerivce.busLocationSearch(request, response);;
	}
}
