package kr.or.bus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bus.dto.RouteDTO;
import kr.or.bus.service.BusStopManageService;

import nu.xom.*;
@Controller
public class BusStopManageController {
	@Autowired
	BusStopManageService busStopManageService;
	
	@RequestMapping(value="/busStation.admin",method=RequestMethod.GET)
	public String busStopOpen(){
		return "busstopmanage/BusStop";
	}
	//수정된 버스정류장 마커 좌표를 저장한다.
	@RequestMapping(value="/busStoplocationEdit.admin",method=RequestMethod.GET)
	public void busStopEditSave(HttpServletRequest request, HttpServletResponse response) throws Exception{
		busStopManageService.busStoplocationEdit(request, response);
	}
		
	//수정된 버스정류장 좌표를 파일에서 읽어온다.
	@RequestMapping(value="/busStoplocationEditRead.admin",method=RequestMethod.GET)
	public void busStopEditRead(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busStoplocationEditRead(request, response);
	}
		
	
	
	//버스정류장 원본 마커 좌표를 파일에서 읽어온다.
	@RequestMapping(value="/busStopOriginalRead.admin",method=RequestMethod.GET)
	public void busStopOriginRead(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busStopOriginalRead(request, response);
	}
	
	//버스정류장 원본 경로 를 파일에서 읽어온다.
	@RequestMapping(value="/busRoute.admin",method=RequestMethod.GET)	
	public void busStopRouteLoad(HttpServletRequest request , HttpServletResponse response) throws Exception{
		busStopManageService.busRouteRead(request, response);
	}

	//실시간 위치추적 30초마다 갱신됨
	@RequestMapping(value="/RealTimeSearch.admin",method=RequestMethod.GET)
	public void buslocationLoad(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busLocationSearch(request, response);;
	}
	
	//버스정류장 원본 마커 좌표를 디비를 참조해서 읽어온다.
	@RequestMapping(value="/routeidSearch.admin",method=RequestMethod.GET)
	public void busStopOriginRead(String r_num,RouteDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception{
		busStopManageService.routeidInfoSearch(r_num,dto, request,response);
	}
}
