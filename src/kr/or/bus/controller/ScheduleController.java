package kr.or.bus.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dao.ScheduleDAO;
import kr.or.bus.dto.ScheduleDTO;
import kr.or.bus.dto.RegulOffDTO;

@Controller

public class ScheduleController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="/production/insertSchedule.htm", method=RequestMethod.POST)
	public View insertSchedule(String title, String sstart, String eend, String allDay, String url, ModelMap map)
			throws ClassNotFoundException, SQLException, ParseException{
		
		System.out.println("일정 저장하기");
		ScheduleDTO dto=new ScheduleDTO();
		dto.setTitle(title);
			
		java.sql.Date sqldate=java.sql.Date.valueOf(sstart);
		dto.setSstart(sqldate);
		sqldate=java.sql.Date.valueOf(eend);
		dto.setEend(sqldate);
		dto.setAllDay(allDay);
		dto.setUrl("http"+url);
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		
		dao.insert(dto);
		ScheduleDTO dto2=dao.selectseq();
		map.addAttribute("data", dto2);
		return jsonview;//str;
	}
	
	@RequestMapping(value="/production/selectSchedule.htm", method=RequestMethod.POST)
	public View selectSchedule(ModelMap map) throws ClassNotFoundException, SQLException{
		System.out.println("전체일정 불러오기");
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		List<ScheduleDTO> dtolist=dao.select();
		
		map.addAttribute("data", dtolist);
		return jsonview;
	}
	
	@RequestMapping(value="/production/updateSchedule.htm", method=RequestMethod.POST)
	public View updateSchedule(String id, String title, String sstart, String eend, String allDay, String url, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정수정");
		ScheduleDTO dto=new ScheduleDTO();
		dto.setId(id);
		dto.setTitle(title);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sqldate=new Date(sdf.parse(sstart).getTime());
		dto.setSstart(sqldate);
		sqldate=new Date(sdf.parse(eend).getTime());
		dto.setEend(sqldate);
		dto.setAllDay(allDay);
		dto.setUrl("http"+url);
	
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.update(dto);
		
		map.addAttribute("data", "성공");
		return jsonview;
	}
	
	@RequestMapping(value="/production/deleteSchedule.htm", method=RequestMethod.POST)
	public String updateSchedule(String id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.delete(id);
		
		return "bus";
	}
	
	//추가시작
	@RequestMapping("/schedule_reguloff.htm")
	public String schedule_reguloff(){
		return "schedule/schedule_reguloff";
	}
	
	@RequestMapping(value="/reguloff_insert.htm", method=RequestMethod.POST)
	public View reguloffInsert(String m_id, String o_code, ModelMap map)
			throws ClassNotFoundException, SQLException, ParseException{
		
		System.out.println("일정 저장하기");
		RegulOffDTO dto=new RegulOffDTO();
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_insert(dto);
		RegulOffDTO dto2=dao.reguloff_selectseq();
		map.addAttribute("data", dto2);
		return jsonview;//str;
	}
	
	@RequestMapping(value="/reguloff_select.htm", method=RequestMethod.POST)
	public View reguloffSelect(ModelMap map) throws ClassNotFoundException, SQLException{
		System.out.println("전체일정 불러오기");
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		List<RegulOffDTO> dtolist=dao.reguloff_select();
		System.out.println(dtolist);
		map.addAttribute("data", dtolist);
		return jsonview;
	}
	
	@RequestMapping(value="/reguloff_delete.htm", method=RequestMethod.POST)
	public String reguloffDelete(String id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_delete(id);
		
		return "bus";
	}
	
	@RequestMapping(value="/reguloff_update.htm", method=RequestMethod.POST)
	public View reguloffUpdate(String id, String m_id, String o_code, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정수정");
		RegulOffDTO dto=new RegulOffDTO();
		dto.setId(id);
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		
		/*java.sql.Date sqldate=java.sql.Date.valueOf(startdate);
		dto.setStartdate(sqldate);*/
		
		System.out.println(dto);	
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_update(dto);
		
		map.addAttribute("data", "성공");
		return jsonview;
	}
	
	@RequestMapping(value="/dowcount.member",method=RequestMethod.POST)
	public View dowcount(String o_code , Model model){
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		int dow = dao.dowcount(o_code);
	
		model.addAttribute("dow", dow);
		
		return jsonview;
	}
	
}
