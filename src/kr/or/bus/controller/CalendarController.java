package kr.or.bus.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import calendar.dao;
import calendar.dto;

@Controller

public class CalendarController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="/production/insertSchedule.htm", method=RequestMethod.POST)
	public View insertSchedule(String title, String sstart, String eend, String allDay, String url, ModelMap map)
			throws ClassNotFoundException, SQLException, ParseException{
		
		System.out.println("일정 저장하기");
		dto dto=new dto();
		dto.setTitle(title);
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sqldate=new Date(sdf.parse(sstart).getTime());
		dto.setSstart(sqldate);
		sqldate=new Date(sdf.parse(eend).getTime());
		dto.setEend(sqldate);
		dto.setAllDay(allDay);
		dto.setUrl("http"+url);
		
		dao dao=sqlsession.getMapper(dao.class);
		
		dao.insert(dto);
		dto dto2=dao.selectseq();
		map.addAttribute("data", dto2);
		return jsonview;//str;
	}
	
	@RequestMapping(value="/production/selectSchedule.htm", method=RequestMethod.POST)
	public View selectSchedule(ModelMap map) throws ClassNotFoundException, SQLException{
		System.out.println("전체일정 불러오기");
		dao dao=sqlsession.getMapper(dao.class);
		List<dto> dtolist=dao.select();
		
		map.addAttribute("data", dtolist);
		return jsonview;
	}
	
	@RequestMapping(value="/production/updateSchedule.htm", method=RequestMethod.POST)
	public View updateSchedule(String id, String title, String sstart, String eend, String allDay, String url, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정수정");
		dto dto=new dto();
		dto.setId(id);
		dto.setTitle(title);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sqldate=new Date(sdf.parse(sstart).getTime());
		dto.setSstart(sqldate);
		sqldate=new Date(sdf.parse(eend).getTime());
		dto.setEend(sqldate);
		dto.setAllDay(allDay);
		dto.setUrl("http"+url);
	
		dao dao=sqlsession.getMapper(dao.class);
		dao.update(dto);
		
		map.addAttribute("data", "성공");
		return jsonview;
	}
	
	@RequestMapping(value="/production/deleteSchedule.htm", method=RequestMethod.POST)
	public String updateSchedule(String id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		dao dao=sqlsession.getMapper(dao.class);
		dao.delete(id);
		
		return "bus";
	}
}
