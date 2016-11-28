/*
 * @File Name: ScheduleController.java
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리 컨트롤러
 */


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
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.RegulOffDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;

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
	
	//reguloff(정기휴무)
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
		MemberJoinRegulOffDTO dto2=dao.reguloff_selectseq(m_id);
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
	public String reguloffDelete(String m_id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_delete(m_id);
		
		return "bus";
	}
	
	@RequestMapping(value="/reguloff_update.htm", method=RequestMethod.POST)
	public View reguloffUpdate(String m_id, String o_code, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정수정");
		RegulOffDTO dto=new RegulOffDTO();
		dto.setM_id(m_id);
		dto.setO_code(o_code);
			
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_update(dto);
		MemberJoinRegulOffDTO dto2=dao.reguloff_selectseq(m_id);
		
		map.addAttribute("data", dto2);
		return jsonview;
	}
	
	@RequestMapping(value="/dowcount.member",method=RequestMethod.POST)
	public View dowcount(String o_code , Model model){
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		int dow = dao.dowcount(o_code);
	
		model.addAttribute("dow", dow);
		
		return jsonview;
	}
	
	@RequestMapping(value="/checkmid.member",method=RequestMethod.POST)
	public View checkmid(String m_id , Model model){
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		int row = dao.checkmid(m_id);
	
		model.addAttribute("row", row);
		
		return jsonview;
	}
		
	@RequestMapping(value="/mid.member",method=RequestMethod.POST)
	public View mid(String m_id , Model model){
		System.out.println("여기는 옵니까");
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		String rid = dao.returnid(m_id);
	
		model.addAttribute("rid", rid);
		
		return jsonview;
	}
	
	//기록보기
	@RequestMapping("/schedule_history.htm")
	public String viewHistory(Model model){
		System.out.println("여긴 타냐?");
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		List<RegulOffrJoinDTO> list=dao.history_select();
		model.addAttribute("list", list);
		return "schedule/schedule_history";
	}
	
}
