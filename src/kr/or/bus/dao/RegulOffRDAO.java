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
import kr.or.bus.dto.RouteDTO;

public interface RegulOffRDAO {
	
	//휴무변경 이력확인 전체 리스트
	public List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> regulList(int page);
	
	//전체리스트 개수
	public int countList();
	
	//날짜별 검색 리스트
	public  List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> dayList(String search);
	
	//상태별 데이터 가져오기
	public  List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> codeList(String search);
	
	//이름별 리스트
	public  List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> nameList(String search);
	
	//노선 목록 ajax로 불러오기
	public List<RouteDTO> getrouteajax();
	
	//경로별 리스트
	public  List<ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO> routeList(String search);
}
