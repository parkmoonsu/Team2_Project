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

import kr.or.bus.dao.CalendarDAO;
import kr.or.bus.dto.CalendarDTO;
import kr.or.bus.dto.RegulOffDTO;

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
		CalendarDTO dto=new CalendarDTO();
		dto.setTitle(title);
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sqldate=new Date(sdf.parse(sstart).getTime());
		dto.setSstart(sqldate);
		sqldate=new Date(sdf.parse(eend).getTime());
		dto.setEend(sqldate);
		dto.setAllDay(allDay);
		dto.setUrl("http"+url);
		
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		
		dao.insert(dto);
		CalendarDTO dto2=dao.selectseq();
		map.addAttribute("data", dto2);
		return jsonview;//str;
	}
	
	@RequestMapping(value="/production/selectSchedule.htm", method=RequestMethod.POST)
	public View selectSchedule(ModelMap map) throws ClassNotFoundException, SQLException{
		System.out.println("전체일정 불러오기");
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		List<CalendarDTO> dtolist=dao.select();
		
		map.addAttribute("data", dtolist);
		return jsonview;
	}
	
	@RequestMapping(value="/production/updateSchedule.htm", method=RequestMethod.POST)
	public View updateSchedule(String id, String title, String sstart, String eend, String allDay, String url, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정수정");
		CalendarDTO dto=new CalendarDTO();
		dto.setId(id);
		dto.setTitle(title);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sqldate=new Date(sdf.parse(sstart).getTime());
		dto.setSstart(sqldate);
		sqldate=new Date(sdf.parse(eend).getTime());
		dto.setEend(sqldate);
		dto.setAllDay(allDay);
		dto.setUrl("http"+url);
	
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		dao.update(dto);
		
		map.addAttribute("data", "성공");
		return jsonview;
	}
	
	@RequestMapping(value="/production/deleteSchedule.htm", method=RequestMethod.POST)
	public String updateSchedule(String id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		dao.delete(id);
		
		return "bus";
	}
	
	////////////////////////
	@RequestMapping(value="/production/reguloff_insert.htm", method=RequestMethod.POST)
	public View reguloffInsert(String m_id, String o_code, ModelMap map)
			throws ClassNotFoundException, SQLException, ParseException{
		
		System.out.println("일정 저장하기");
		RegulOffDTO dto=new RegulOffDTO();
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		
		dao.reguloff_insert(dto);
		map.addAttribute("data", dto);
		return jsonview;//str;
	}
	
	@RequestMapping(value="/production/reguloff_select.htm", method=RequestMethod.POST)
	public View reguloffSelect(ModelMap map) throws ClassNotFoundException, SQLException{
		System.out.println("전체일정 불러오기");
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		List<RegulOffDTO> dtolist=dao.reguloff_select();
		System.out.println(dtolist);
		map.addAttribute("data", dtolist);
		return jsonview;
	}
	
	@RequestMapping(value="/production/reguloff_delete.htm", method=RequestMethod.POST)
	public String reguloffDelete(String id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		dao.reguloff_delete(id);
		
		return "bus";
	}
	
	@RequestMapping(value="/production/reguloff_update.htm", method=RequestMethod.POST)
	public View reguloffUpdate(String id, String m_id, String o_code, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정수정");
		RegulOffDTO dto=new RegulOffDTO();
		dto.setId(id);
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		System.out.println(dto);	
		CalendarDAO dao=sqlsession.getMapper(CalendarDAO.class);
		dao.reguloff_update(dto);
		
		map.addAttribute("data", "성공");
		return jsonview;
	}
	
}
