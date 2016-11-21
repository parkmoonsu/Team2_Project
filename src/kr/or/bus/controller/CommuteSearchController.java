package kr.or.bus.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bus.dao.CommuteDAO;
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;


@Controller
public class CommuteSearchController {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/comsearch.htm", method=RequestMethod.GET)
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
		//String field = "C_DATE";
		String query ="%%";
		
		if(pg != null && pg.equals("")){
			page = Integer.parseInt(pg);
		}
		/*if(f != null && f.equals("")){
			field = f;
		}*/
		if(q != null && q.equals("")){
			query = q;
		}
			
		CommuteDAO  comdao = sqlsession.getMapper(CommuteDAO.class);
		List<CommuteJoinCstartJoinCendDTO> list= comdao.getSelect(page, query, id);	
		//List<CommuteDTO> list= comdao.getSelect(page, field, query, id);
		//List<CommuteDTO> list = comdao.getSelect(id);
		
		for(int i=0; i<list.size(); i++){	
			System.out.println("asdfsaf" +list.get(i).getC_start());
			System.out.println("asdfsaf" +list.get(i).getC_end());
			System.out.println("asdfsaf" +list.get(i).getC_date());
		}
		
		System.out.println("ddd" + list);
		model.addAttribute("list",list);
		
		return "commute/comsearch";	
	}

	@RequestMapping(value="/gotowork.htm", method=RequestMethod.GET)
	public String show(){
		System.out.println("이거는 들어왔냐고~~");
		
			
		return "commute/gotowork";
	}
	
	@RequestMapping(value="/show.htm", method=RequestMethod.POST)
	public String go(){
		System.out.println("이거는~");
		
		CommuteDAO  comdao = sqlsession.getMapper(CommuteDAO.class);
		CommuteJoinCstartJoinCendDTO dto = new CommuteJoinCstartJoinCendDTO();
		CommuteJoinCstartJoinCendDTO cjdto = comdao.csupdate(dto);
		cjdto=csselect();
		model.addAttribute("cjdto",cjdto);
			
		return "commute/gotowork";
	}
	
	
	/*@RequestMapping(value="/getoffwork.htm")
	public String get(){
		
		return "commute/getoffwork";
		
	}*/
}
