package kr.or.bus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.bus.service.BusStopManageService;

@Controller
public class BusStopManageController {
	@Autowired
	BusStopManageService busStopManageService;
}
