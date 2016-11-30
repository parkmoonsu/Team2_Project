package kr.or.bus.dto;

public class SelectDistinctDTO {
	private String m_name;
	private java.sql.Date o_date;
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public java.sql.Date getO_date() {
		return o_date;
	}
	public void setO_date(java.sql.Date o_date) {
		this.o_date = o_date;
	}
	@Override
	public String toString() {
		return "SelectDistinctDTO [m_name=" + m_name + ", o_date=" + o_date + "]";
	}

}
