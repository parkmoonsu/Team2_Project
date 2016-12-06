/*
*	@FileName : RegulOffRDAO.java
*	@Project	: KosBus
*	@Date	: 2016.12.06
*	@Author	: 박문수
*	@Discription : reguloffr DAO
*/

package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO;

public interface RegulOffRDAO {
	
	//휴무변경 이력확인 전체 리스트
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> regulList(int page);
	
	//전체리스트 개수
	public int countList();
}
