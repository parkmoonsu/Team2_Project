/*
*	@FileName : ApproveDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : Member, Commute join table DTO
*/

package kr.or.bus.dto;

import java.util.Date;

public class CommuteJoinCstartJoinCendDTO {
	
	private int rownum;
	private String m_id;
	private Date c_date;	
	private String c_start;	//출근시간
	private int cs_code;	//출근코드
	private int cs_stat;	//출근상태
	private String c_end;	//퇴근시간	
	private int ce_code;	//퇴근코드
	private int ce_stat;	//퇴근상태
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public int getCs_code() {
		return cs_code;
	}
	public void setCs_code(int cs_code) {
		this.cs_code = cs_code;
	}
	public int getCs_stat() {
		return cs_stat;
	}
	public void setCs_stat(int cs_stat) {
		this.cs_stat = cs_stat;
	}
	public int getCe_code() {
		return ce_code;
	}
	public void setCe_code(int ce_code) {
		this.ce_code = ce_code;
	}
	public int getCe_stat() {
		return ce_stat;
	}
	public void setCe_stat(int ce_stat) {
		this.ce_stat = ce_stat;
	}
		
	
	
}
