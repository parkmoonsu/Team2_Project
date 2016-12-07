package kr.or.bus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.BusStopDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RouteStopDTO;
import kr.or.bus.dto.StopDTO;
import kr.or.bus.service.BusStopManageService;

import nu.xom.*;
@Controller
public class BusStopManageController {
	@Autowired
	BusStopManageService busStopManageService;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="/busStation.admin",method=RequestMethod.GET)
	public String busStopOpen(ModelMap map){		
		map.addAttribute("list", busStopManageService.routeList());
		return "busstopmanage/BusStop";
		
	}
	//수정된 버스정류장 마커 좌표를 저장한다.
	/*@RequestMapping(value="/busStoplocationEdit.admin",method=RequestMethod.GET)
	public void busStopEditSave(HttpServletRequest request, HttpServletResponse response) throws Exception{
		busStopManageService.busStoplocationEdit(request, response);
	}*/
		
	//수정된 버스정류장 좌표를 파일에서 읽어온다.
	/*@RequestMapping(value="/busStoplocationEditRead.admin",method=RequestMethod.GET)
	public void busStopEditRead(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busStoplocationEditRead(request, response);
	}*/
		
	
	
	//버스정류장 원본 마커 좌표를 파일에서 읽어온다.
	/*@RequestMapping(value="/busStopOriginalRead.admin",method=RequestMethod.GET)
	public void busStopOriginRead(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busStopOriginalRead(request, response);
	}*/
	
	//버스 원본 경로 를 파일에서 읽어온다.
	/*@RequestMapping(value="/busRoute.admin",method=RequestMethod.GET)	
	public void busStopRouteLoad(HttpServletRequest request , HttpServletResponse response) throws Exception{
		busStopManageService.busRouteRead(request, response);
	}*/

	//실시간 위치추적 30초마다 갱신됨
	@RequestMapping(value="/RealTimeSearch.admin",method=RequestMethod.GET)
	public void buslocationLoad(String r_num, RouteDTO dto, HttpServletRequest request ,HttpServletResponse response, ModelMap model) throws Exception{
		busStopManageService.busLocationSearch(r_num, dto, request, response);	
	}
	
	//버스번호 를 가져와 해당 버스가 다니는 정류장 정보를 디비에 저장한다.
	@RequestMapping(value="/routeidSearch.admin",method=RequestMethod.GET)
	public void busStopOriginRead(String r_num,RouteDTO dto, StopDTO stopdto, RouteStopDTO routestopdto, HttpServletRequest request, HttpServletResponse response) throws Exception{
		busStopManageService.routeidInfoSearch(r_num, dto, stopdto, routestopdto, request, response);
	}
	
	//버스 원본 노선경로 를 디비를 이용해 공공데이터에 접근
	@RequestMapping(value="/busRouteSearch.admin",method=RequestMethod.GET)	
	public void busRouteSearch(String r_num, RouteDTO dto ,HttpServletRequest request , HttpServletResponse response) throws Exception{
		busStopManageService.busRouteCall(r_num, dto, request, response);
	}
	
	//디비에서 조회해 버스정류장 마커를 생성하는 함수.
	@RequestMapping(value="/busStopRoad.admin",method=RequestMethod.GET)
	public void busStopRoad(String r_num,RouteDTO dto, BusStopDTO busstopdto, HttpServletRequest request, HttpServletResponse response) throws Exception{
		busStopManageService.busStopRoadSearch(r_num, dto, busstopdto, request, response);
	}
	
}
