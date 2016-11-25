/*
*	@FileName : BusDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : Bus etc.. table DAO interface
*/


package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO;
import kr.or.bus.dto.MemberDTO;

public interface BusDAO {
	
	//(관리자) 버스관리 - 버스 등록/삭제에 뿌려질 리스트
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> busInfo(int page); 
	
	//등록된 버스의 개수
	public int busCount();
	
	//등록된 차고지의 이름 가지고오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getGarageName();
	
	//등록된 차고지의 이름을 통해 차고지에 맞는 노선 번호 가져오기
	public List<BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO> getRouteNum(String g_num);
	
	//등록된 기사들의 이름 가져오기
	public List<MemberDTO> getMember();
}
