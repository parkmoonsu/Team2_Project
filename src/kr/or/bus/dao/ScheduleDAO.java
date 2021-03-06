/*
 * @File Name: ScheduleDAO.java
 * @Author: 길한종
 * @Data: 2016. 11. 14
 * @Desc: 일정관리 DAO 공통 인터페이스
 */
package kr.or.bus.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.bus.dto.ScheduleDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.RegulOffDTO;
import kr.or.bus.dto.RegulOffrDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.RegulOffrJoinMemberJoinBusDTO;

//CRUD
public interface ScheduleDAO {
	
	public int delete(String id) throws ClassNotFoundException, SQLException;
	public int update(ScheduleDTO dto) throws ClassNotFoundException, SQLException;
	public List<ScheduleDTO> select() throws ClassNotFoundException, SQLException;
	public int insert(ScheduleDTO dto) throws ClassNotFoundException, SQLException;
	public ScheduleDTO selectseq() throws ClassNotFoundException, SQLException;
	
	public List<RegulOffrJoinMemberJoinBusDTO> reguloffr_select(String m_id) throws ClassNotFoundException, SQLException;
	public List<MemberJoinRegulOffDTO> reguloff_select(String m_id) throws ClassNotFoundException, SQLException;
	public int reguloff_insert(RegulOffDTO dto) throws ClassNotFoundException, SQLException;
	public int reguloff_delete(String m_id) throws ClassNotFoundException, SQLException;
	public int reguloff_update(RegulOffDTO dto) throws ClassNotFoundException, SQLException;
	public MemberJoinRegulOffDTO reguloff_selectseq(String m_id) throws ClassNotFoundException, SQLException;
	
	//dow count 를 가져와서 3개이상일시
	public int dowcount(String o_code);
	//동일 m_id가 존재하는지 검색
	public int checkmid(String m_id);
	//로그인아이디와 일정m_id 비교
	public String returnid(String id);
	//ko_code=600인 것 중 m_id가 있는지 찾음
	public int reguloffr_checkstatus(String m_id);
	
	public List<RegulOffrJoinDTO> history_select(String m_id , int page) throws ClassNotFoundException, SQLException;
	public int history_insert(RegulOffrDTO dto) throws ClassNotFoundException, SQLException;
	
	public int historycount();
	//public int history_update(RegulOffrDTO dto) throws ClassNotFoundException, SQLException;
}