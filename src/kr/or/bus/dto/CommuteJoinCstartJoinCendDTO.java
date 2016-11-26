/*
*	@FileName : CommuteJoinCstartJoinCend.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 조한솔
*	@Discription : Cstart, Cend, Commute join table DTO
*/

package kr.or.bus.dto;

public class CommuteJoinCstartJoinCendDTO {

	private int rownum;
	private String m_id;
	private String m_name;
	private String c_date;	
	private int cs_code;	//출근코드
	private int ce_code;	//퇴근코드
	private String cs_stat;	//출근상태
	private String ce_stat;	//퇴근상태
	private String c_start;	//출근시간
	private String c_end; 	//퇴근시간
	private String cs_ams;
	private String ce_pms;
	
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
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
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getCs_code() {
		return cs_code;
	}
	public void setCs_code(int cs_code) {
		this.cs_code = cs_code;
	}
	public int getCe_code() {
		return ce_code;
	}
	public void setCe_code(int ce_code) {
		this.ce_code = ce_code;
	}
	public String getCs_stat() {
		return cs_stat;
	}
	public void setCs_stat(String cs_stat) {
		this.cs_stat = cs_stat;
	}
	public String getCe_stat() {
		return ce_stat;
	}
	public void setCe_stat(String ce_stat) {
		this.ce_stat = ce_stat;
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
	public String getCs_ams() {
		return cs_ams;
	}
	public void setCs_ams(String cs_ams) {
		this.cs_ams = cs_ams;
	}
	public String getCe_pms() {
		return ce_pms;
	}
	public void setCe_pms(String ce_pms) {
		this.ce_pms = ce_pms;
	}
	@Override
	public String toString() {
		return "CommuteJoinCstartJoinCendDTO [rownum=" + rownum + ", m_id=" + m_id + ", m_name=" + m_name + ", c_date="
				+ c_date + ", cs_code=" + cs_code + ", ce_code=" + ce_code + ", cs_stat=" + cs_stat + ", ce_stat="
				+ ce_stat + ", c_start=" + c_start + ", c_end=" + c_end + ", cs_ams=" + cs_ams + ", ce_pms=" + ce_pms
				+ "]";
	}
	
	
	
	
}
