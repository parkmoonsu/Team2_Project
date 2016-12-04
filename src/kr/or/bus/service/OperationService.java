/*
*	@FileName : OperationService.java
*	@Project	: KosBus
*	@Date	: 2016. 12. 01
*	@Author	: 조한솔
*	@Discription : 노선별 출결현황 페이지 Service
*/


package kr.or.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bus.dao.BusDAO;
import kr.or.bus.dao.RnumcommuteDAO;
import kr.or.bus.dao.RouteDAO;
import kr.or.bus.dao.ScheduleManageDAO;
import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.RnumcommuteDTO;
import kr.or.bus.dto.RnumcommuteDTO2;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RouteJoinGarageDTO;

@Service
public class OperationService {

	@Autowired
	private SqlSession sqlsession;

	// 임시노선별 출결현황에서 이름 가져오기
	public List<RnumcommuteDTO> getNdselect() {

		RnumcommuteDAO dao = sqlsession.getMapper(RnumcommuteDAO.class);

		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getNdselect();
		List<RnumcommuteDTO> list2 = new ArrayList<RnumcommuteDTO>();
		for (int i = 0; i < list.size(); i++) {

			// list {이름+ 날짜[] + 상태[]}
			String m_name = list.get(i).getM_name();
			//String c_date = list.get(i).getC_date();
			
			//String r_num = list.get(i).getR_num();

			String[] tdate = dao.getStat(m_name); // 날짜
			String[] stat = dao.getShow(m_name); // 상태
			
			RnumcommuteDTO dto = new RnumcommuteDTO();

			dto.setM_name(list.get(i).getM_name());
			dto.setC_date(tdate);
			dto.setCs_stat(stat);

			list2.add(dto);
		}

		return list2;
	}
	
	public List<RnumcommuteDTO> getMember(String r_num){
		System.out.println("여기능??");
		RnumcommuteDAO dao = sqlsession.getMapper(RnumcommuteDAO.class);

		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getMember(r_num);
		List<RnumcommuteDTO> list2 = new ArrayList<RnumcommuteDTO>();
		//String[] tdate = null;
		RnumcommuteDTO dto = new RnumcommuteDTO();
		for (int i = 0; i < list.size(); i++) {

			// list {이름+ 날짜[] + 상태[]}
			String m_name = list.get(i).getM_name();
			String c_date = list.get(i).getC_date();
					
			//ArrayList<String> tdate = dao.getStat2(r_num, m_name);
			//String[] tdate = dao.getStat2(r_num, m_name); // 날짜
			//String[] stat = dao.getShow2(r_num, m_name); // 상태
			System.out.println("#####" +dao.getStat2(r_num, m_name));
			dto = new RnumcommuteDTO();
			
			dto.setM_name(list.get(i).getM_name());
			//dto.setC_date(tdate);
			//dto.setCs_stat(stat);
		
			list2.add(dto);
		}
	
		return list2;		
	}
	
	public List<String> getStat2(String r_num){
		RnumcommuteDAO dao = sqlsession.getMapper(RnumcommuteDAO.class);

		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getMember(r_num);
		List<String> list2 = null;
		
		for (int i = 0; i < list.size(); i++) {

			// list {이름+ 날짜[] + 상태[]}
			
			String m_name = list.get(i).getM_name();
			String date =  dao.getStat2(r_num, m_name).get(i).getC_date();
			list2.add(date);
		}
		
		return list2;
	}
	
	public List<String> getShow2(String r_num){
		RnumcommuteDAO dao = sqlsession.getMapper(RnumcommuteDAO.class);

		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getMember(r_num);
		List<String> list2 = null;
		
		for (int i = 0; i < list.size(); i++) {

			// list {이름+ 날짜[] + 상태[]}
			
			String m_name = list.get(i).getM_name();
			String cs_stat =  dao.getShow2(r_num, m_name).get(i).getCs_stat();
			list2.add(cs_stat);
		}
		
		return list2;
	}
	
	//전체 노선
	public List<RouteDTO> getRout(){
		
		RouteDAO dao = sqlsession.getMapper(RouteDAO.class);
		List<RouteDTO> rdto = dao.route();
		return rdto;
		
	}
	
	
/*	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getselect(String r_num){
		
		RnumcommuteDAO dao = sqlsession.getMapper(RnumcommuteDAO.class);
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getselect(r_num);
		
		return list;
		
	}*/

}
