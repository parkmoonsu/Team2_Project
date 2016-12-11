/*
*	@FileName : RegulOffrDTO2.java
*	@Project	: KosBus
*	@Date	: 2016. 11.28
*	@Author	: 박문수
*	@Discription : RegulOffr table DTO
*/

package kr.or.bus.dto;

public class reguloffrDTO2 {
	private String m_id;
	private java.sql.Date ro_reqdate;
	
	private int r;
	
	
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public java.sql.Date getRo_reqdate() {
		return ro_reqdate;
	}
	public void setRo_reqdate(java.sql.Date ro_reqdate) {
		this.ro_reqdate = ro_reqdate;
	}
	@Override
	public String toString() {
		return "reguloffrDTO2 [m_id=" + m_id + ", ro_reqdate=" + ro_reqdate + "]";
	}
	
	
}
