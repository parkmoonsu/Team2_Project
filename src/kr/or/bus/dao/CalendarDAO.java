package kr.or.bus.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.bus.dto.CalendarDTO;

//CRUD
public interface CalendarDAO {
	
	public int delete(String id) throws ClassNotFoundException, SQLException;
	public int update(CalendarDTO dto) throws ClassNotFoundException, SQLException;
	public List<CalendarDTO> select() throws ClassNotFoundException, SQLException;
	public int insert(CalendarDTO dto) throws ClassNotFoundException, SQLException;
	public CalendarDTO selectseq() throws ClassNotFoundException, SQLException;
	
}	