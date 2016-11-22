/*
 * @File Name: CalendarDAO.java
 * @Author: 길한종
 * @Data: 2016. 11. 14
 * @Desc: 일정관리 DAO 공통 인터페이스
 */
package kr.or.bus.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.bus.dto.CalendarDTO;
import kr.or.bus.dto.RegulOffDTO;

//CRUD
public interface CalendarDAO {
	
	public int delete(String id) throws ClassNotFoundException, SQLException;
	public int update(CalendarDTO dto) throws ClassNotFoundException, SQLException;
	public List<CalendarDTO> select() throws ClassNotFoundException, SQLException;
	public int insert(CalendarDTO dto) throws ClassNotFoundException, SQLException;
	public CalendarDTO selectseq() throws ClassNotFoundException, SQLException;
	
	public List<RegulOffDTO> reguloff_select() throws ClassNotFoundException, SQLException;
	public int reguloff_insert(RegulOffDTO dto) throws ClassNotFoundException, SQLException;
	public int reguloff_delete(String id) throws ClassNotFoundException, SQLException;
	public int reguloff_update(RegulOffDTO dto) throws ClassNotFoundException, SQLException;
	public RegulOffDTO reguloff_selectseq() throws ClassNotFoundException, SQLException;
}	