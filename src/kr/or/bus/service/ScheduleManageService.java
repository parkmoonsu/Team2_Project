package kr.or.bus.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.ScheduleManageDAO;
import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;

@Service
public class ScheduleManageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<GarageDTO> showGarage(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<GarageDTO> gdto = dao.getTotalGarage();
		return gdto;
	}
	
	public List<RouteJoinGarageDTO> showRoute(String g_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RouteJoinGarageDTO> rdto = dao.getTotalRoute(g_num);
		return rdto;
	}
	
	public List<MemberJoinRegulOffDTO> unScheduledMember(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinRegulOffDTO> mjrdto = dao.getUndecideReguloffMember(r_num);
		return mjrdto;
	}
	
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> scheduledMember(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> mrmbrjdto = dao.getDecideReguloffMember(r_num);
		System.out.println("mrmbrjdto"+mrmbrjdto.toString());
		return mrmbrjdto;
	}
	
	public String decideReguloffMember(String m_id, String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.insertReguloff(m_id, dao.getOcode(o_date));
		return dao.getOcode(o_date);
	}
	
	public void modifyReguloffMember(String m_id, String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.updateReguloff(m_id, dao.getOcode(o_date));
	}
	
	
	//history
	public List<RegulOffrJoinDTO> history_select(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RegulOffrJoinDTO> list=dao.history_select();
		return list;
	}
	public void history_agree(String m_id, String ro_object){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.history_agree(m_id, ro_object);
	}
}
