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
import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.RnumcommuteDTO;

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
			String c_date = list.get(i).getC_date();
			String r_num = list.get(i).getR_num();

			String[] tdate = dao.getStat(m_name); // 날짜
			String[] stat = dao.getShow(m_name, r_num); // 상태

			RnumcommuteDTO dto = new RnumcommuteDTO();

			dto.setM_name(list.get(i).getM_name());
			dto.setC_date(tdate);
			dto.setCs_stat(stat);

			list2.add(dto);
		}

		return list2;
	}
	
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getselect(String r_num){
		
		RnumcommuteDAO dao = sqlsession.getMapper(RnumcommuteDAO.class);
		
		List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> list = dao.getselect(r_num);
		
		return list;
		
	}

}
