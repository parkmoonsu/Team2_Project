package kr.or.bus.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;


import kr.or.bus.dao.CommuteDAO;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;


@Controller
public class CommuteController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="/comsearch.member", method=RequestMethod.GET)
	//public String csearch(CommuteDTO m_id, Model model){
	//public String csearch(String pg , String f , String q , CommuteDTO m_id, Model model){
	public String csearch(String pg , String q , CommuteJoinCstartJoinCendDTO m_id, Model model){
		
		System.out.println("들어왔으??");
		System.out.println("m_id" + m_id);
		String id = m_id.getM_id();
		System.out.println("dto id"+id);
		
		//System.out.println("m_id????"+comdao.getSelect(m_id));
		////
		int page = 1;
		String query ="%%";
		
		if(pg != null && pg.equals("")){
			page = Integer.parseInt(pg);
		}
		if(q != null && q.equals("")){
			query = q;
		}
			
		CommuteDAO  comdao = sqlsession.getMapper(CommuteDAO.class);
		List<CommuteJoinCstartJoinCendDTO> list= comdao.getSelect(page, query, id);	

		for(int i=0; i<list.size(); i++){	
			System.out.println("asdfsaf" +list.get(i).getC_start());
			System.out.println("asdfsaf" +list.get(i).getC_end());
			System.out.println("asdfsaf" +list.get(i).getC_date());
		}
		
		System.out.println("ddd" + list);
		model.addAttribute("list",list);
		
		return "commute/comsearch";	
	}


/*	@RequestMapping(value="/gotowork.htm", method=RequestMethod.GET)
	public String show(String m_id, Model model){
		System.out.println("이거는 들어왔냐고~~"); 
		
		CommuteDAO  comdao = sqlsession.getMapper(CommuteDAO.class);		
		CommuteJoinCstartJoinCendDTO dto = comdao.csselect(m_id);
				
		model.addAttribute("dto", dto);
		
		return "commute/gotowork";
	}*/
	
	
	@RequestMapping(value="/gotowork.member", method=RequestMethod.GET)
	public String show(Model model, CommuteJoinCstartJoinCendDTO cs_code, String m_id){
		System.out.println("이거는 들어왔냐고~~"); 
		
		return "commute/gotowork";
	}
	
	
	@RequestMapping(value="/gotowork.member", method=RequestMethod.POST)
	public View go(ModelMap map, String m_id){
		System.out.println("이거는~");
		
		CommuteDAO  dao = sqlsession.getMapper(CommuteDAO.class);
		CommuteJoinCstartJoinCendDTO dto2=new CommuteJoinCstartJoinCendDTO();
		dto2.setM_id(m_id);
		dao.csupdate(dto2);
		CommuteJoinCstartJoinCendDTO dto= dao.csselect(dto2);
			
		map.addAttribute("dto",dto);
		return jsonview;
		
		//System.out.println("dto값" + dto.getC_start() + dto.getCe_stat());
	
	}
	
	//회원의 퇴근시간
	@RequestMapping(value="/getoffwork.member", method=RequestMethod.GET)
	public String eshow(Model model, CommuteJoinCstartJoinCendDTO ce_code, String m_id){
		System.out.println("이거는 들어왔냐고~~"); 
		
		return "commute/getoffwork";
	}
	
	
	@RequestMapping(value="/getoffwork.member", method=RequestMethod.POST)
	public View ego(ModelMap map, String m_id){
		System.out.println("이거는~");
		
		CommuteDAO  dao = sqlsession.getMapper(CommuteDAO.class);
		CommuteJoinCstartJoinCendDTO dto2=new CommuteJoinCstartJoinCendDTO();
		dto2.setM_id(m_id);
		dao.ceupdate(dto2);
		CommuteJoinCstartJoinCendDTO dto= dao.ceselect(dto2);
				
		map.addAttribute("dto",dto);
		return jsonview;
	}
	
	@RequestMapping(value="/test.member")
	public String test(){
		System.out.println("이거는 들어왔냐고~~"); 
		
		return "commute/test";
	}
}
