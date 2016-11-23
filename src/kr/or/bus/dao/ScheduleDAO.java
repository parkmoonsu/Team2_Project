/*
 * @File Name: CalendarDAO.java
 * @Author: 길한종
 * @Data: 2016. 11. 14
 * @Desc: 일정관리 DAO 공통 인터페이스
 */
package kr.or.bus.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.bus.dto.ScheduleDTO;
import kr.or.bus.dto.RegulOffDTO;

//CRUD
public interface ScheduleDAO {
	
	public int delete(String id) throws ClassNotFoundException, SQLException;
	public int update(ScheduleDTO dto) throws ClassNotFoundException, SQLException;
	public List<ScheduleDTO> select() throws ClassNotFoundException, SQLException;
	public int insert(ScheduleDTO dto) throws ClassNotFoundException, SQLException;
	public ScheduleDTO selectseq() throws ClassNotFoundException, SQLException;
	
	public List<RegulOffDTO> reguloff_select() throws ClassNotFoundException, SQLException;
	public int reguloff_insert(RegulOffDTO dto) throws ClassNotFoundException, SQLException;
	public int reguloff_delete(String id) throws ClassNotFoundException, SQLException;
	public int reguloff_update(RegulOffDTO dto) throws ClassNotFoundException, SQLException;
	public RegulOffDTO reguloff_selectseq() throws ClassNotFoundException, SQLException;
}	