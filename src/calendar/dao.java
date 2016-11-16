package calendar;

import java.sql.SQLException;
import java.util.List;

//CRUD
public interface dao {
	
	public int delete(String id) throws ClassNotFoundException, SQLException;
	public int update(dto dto) throws ClassNotFoundException, SQLException;
	public List<dto> select() throws ClassNotFoundException, SQLException;
	public int insert(dto dto) throws ClassNotFoundException, SQLException;
	public dto selectseq() throws ClassNotFoundException, SQLException;
	
}	