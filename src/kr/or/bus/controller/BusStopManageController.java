package kr.or.bus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bus.service.BusStopManageService;

@Controller
public class BusStopManageController {
	@Autowired
	BusStopManageService busStopManageService;
	
	//수정된 버스정류장 마커 좌표를 저장한다.
	@RequestMapping(value="/busStoplocationEdit.admin",method=RequestMethod.GET)
	public void busStopEditSave(HttpServletRequest request, HttpServletResponse response ) throws Exception{
		busStopManageService.busStoplocationEdit(request, response);
	}
		
	//수정된 버스정류장 좌표를 파일에서 읽어온다.
	@RequestMapping(value="/busStoplocationRead.admin",method=RequestMethod.GET)
	public void busStopEditRead(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busStoplocationEditRead(request, response);
	}
		
	//버스정류장 원본 마커 좌표를 파일에서 읽어온다.
	@RequestMapping(value="/busStopOriginalRead.admin",method=RequestMethod.GET)
	public void busStopOriginRead(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		busStopManageService.busStopOriginalRead(request, response);
	}
}
