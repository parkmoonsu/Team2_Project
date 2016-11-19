/*
*	@FileName : ApproveDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : Member, Commute join table DTO
*/

package kr.or.bus.dto;

import java.util.Date;

public class MemberJoinCommuteDTO {
	private String m_id;
	private String m_name;
	private Date c_date;
	private String c_start;
	private String c_end;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
		
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_start() {
		return c_start;
	}
	public void setC_start(String c_start) {
		this.c_start = c_start;
	}
	public String getC_end() {
		return c_end;
	}
	public void setC_end(String c_end) {
		this.c_end = c_end;
	}
		
}
