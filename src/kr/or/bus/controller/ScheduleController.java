/*
 * @File Name: ScheduleController.java
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리 컨트롤러
 */


package kr.or.bus.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/*import org.apache.ibatis.session.SqlSession;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MemberJoinBusDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.RegulOffrJoinMemberJoinBusDTO;
import kr.or.bus.service.BusManageService;
import kr.or.bus.service.ScheduleManageService;

@Controller
public class ScheduleController {
	
/*	@Autowired
	private SqlSession sqlsession;
	*/
	@Autowired
	private BusManageService service2;
	
	@Autowired
	private ScheduleManageService service;
	
	@Autowired
	private View jsonview;
	
/*	@RequestMapping(value="/production/insertSchedule.htm", method=RequestMethod.POST)
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
		
		dao.insert(jdto);
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
	}*/
	
	
	@RequestMapping(value="/reguloff_insert.htm", method=RequestMethod.POST)
	public View reguloffInsert(String m_id, String o_code, String temp, ModelMap map)
			throws ClassNotFoundException, SQLException, ParseException{
		
		MemberJoinRegulOffDTO dto=service.reguloffInsert(m_id, o_code, temp);
		
		map.addAttribute("data", dto);
		return jsonview;
	}
	
	@RequestMapping(value="/reguloff_select.htm", method=RequestMethod.POST)
	public View reguloffSelect(String m_id, ModelMap map) throws ClassNotFoundException, SQLException{
		
		List<MemberJoinRegulOffDTO> dtolist=service.reguloffSelect(m_id);
		
		map.addAttribute("data", dtolist);
		return jsonview;
	}
		
	@RequestMapping(value="/reguloffr_select.htm", method=RequestMethod.POST)
	public View reguloffrSelect(String m_id, ModelMap map) throws ClassNotFoundException, SQLException{
		
		List<RegulOffrJoinMemberJoinBusDTO> dtolist=service.reguloffrSelect(m_id);

		map.addAttribute("data", dtolist);
		return jsonview;
	}
	
	@RequestMapping(value="/reguloff_delete.htm", method=RequestMethod.POST)
	public String reguloffDelete(String m_id) throws ClassNotFoundException, SQLException, ParseException{
		
		service.reguloffDelete(m_id);
		
		return "bus";
	}
	
	@RequestMapping(value="/reguloff_update.htm", method=RequestMethod.POST)
	public View reguloffUpdate(String m_id, String o_code, String temp, ModelMap map) throws ClassNotFoundException, SQLException, ParseException{
		
		MemberJoinRegulOffDTO dto=service.reguloffUpdate(m_id, o_code, temp);
		
		map.addAttribute("data", dto);
		return jsonview;
	}
	
	//기타-----------------------------
	@RequestMapping(value="/dowcount.member",method=RequestMethod.POST)
	public View dowcount(String o_code , Model model){
	
		int dow = service.dowcount(o_code);
	
		model.addAttribute("dow", dow);
		
		return jsonview;
	}
	
	@RequestMapping(value="/checkmid.member",method=RequestMethod.POST)
	public View checkmid(String m_id , Model model){

		int row = service.checkmid(m_id);
	
		model.addAttribute("row", row);
		
		return jsonview;
	}
		
	@RequestMapping(value="/mid.member",method=RequestMethod.POST)
	public View mid(String m_id , Model model){

		String rid = service.mid(m_id);
	
		model.addAttribute("rid", rid);
		
		return jsonview;
	}
	
	@RequestMapping(value="/selectseq.member",method=RequestMethod.POST)
	public View selectSeq(String m_id , Model model) throws ClassNotFoundException, SQLException{

		MemberJoinRegulOffDTO dto= service.selectSeq(m_id);

		model.addAttribute("dto", dto);
		
		return jsonview;
	}
	
	@RequestMapping(value="/checkstatus.member",method=RequestMethod.POST)
	public View checkStatus(String m_id , Model model) throws ClassNotFoundException, SQLException{

		int row= service.checkStatus(m_id);

		model.addAttribute("row", row);
		
		return jsonview;
	}	
	
	//이거 없어진듯
	@RequestMapping("/schedule_reguloff.htm")
	public String schedule_reguloff() throws ClassNotFoundException, SQLException{

		return "schedule/schedule_reguloff";
	}
	
	//기록보기
	@RequestMapping("/schedule_history.htm")
	public String viewHistory(String m_id, Model model , String pg) throws ClassNotFoundException, SQLException{

		List<RegulOffrJoinDTO> list=service.viewHistory(m_id , pg);
		int page = service2.pg(pg);
		int count = service.historycount();
		int pagecount = 0;
		if(count % 10 == 0){
			pagecount = count/10;
		}else{
			pagecount = count/10 + 1;
		}
		System.out.println("#### pagecount " + pagecount);
		model.addAttribute("list", list);
		model.addAttribute("pgs", page);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("count", count); 
		return "schedule/schedule_history";
	}
	
	@RequestMapping(value="/history_insert.htm", method=RequestMethod.POST)
	public View insertHistory(
		String ko_code, 
		String m_id,
		String o_code,
		String ro_code,
		java.sql.Date ro_reqdate,
		java.sql.Date ro_regdate,
		String ro_object,
		String o_check,
		Model model
	) throws ClassNotFoundException, SQLException{
	
		service.insertHistory(ko_code,
				m_id, o_code, ro_code,
				ro_reqdate,
				ro_regdate,
				ro_object,
				o_check
		);	

		MemberJoinRegulOffDTO dto2=service.selectSeq(m_id);

		model.addAttribute("data", dto2);
		return jsonview;
	}
	
	//최종스케줄 -> schedule_last
	@RequestMapping("/schedule_last.htm")
	public String schedule_last(Model model){
		
		return "schedule/schedule_last";
	}
	
	@RequestMapping("/reguloffschedulecheck.member")
	public View reguloff_schedulecheck(Model model){
		String str=service.reguloff_schedulecheck();
		model.addAttribute("str", str);		
		return jsonview;
	}
	
	@RequestMapping("/rnumcheck.member")
	public View rnumcheck(String m_id, Model model){
		System.out.println("1");
		System.out.println(m_id);
		MemberJoinBusDTO dto=service.rnumcheck(m_id);
		model.addAttribute("dto", dto);		
		return jsonview;
	}
	
}
