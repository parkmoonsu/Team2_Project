package kr.or.bus.dto;

import java.sql.Date;

public class RegulOffDTO {
	private String m_id;
	private String o_code;
	private Date ro_regdate;
	private String id;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public Date getRo_regdate() {
		return ro_regdate;
	}
	public void setRo_regdate(Date ro_regdate) {
		this.ro_regdate = ro_regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "RegulOffDTO [m_id=" + m_id + ", o_code=" + o_code + ", ro_regdate=" + ro_regdate + ", id=" + id + "]";
	}
	

}
