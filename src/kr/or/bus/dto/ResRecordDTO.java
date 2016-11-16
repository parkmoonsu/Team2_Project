/*
*	@FileName : ResRecordDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.15
*	@Author	: 박문수
*	@Discription : ResRecord(이력) table DTO
*/


package kr.or.bus.dto;

public class ResRecordDTO {
	private String res_num;
	private String m_id;
	private String rr_detail;
	public String getRes_num() {
		return res_num;
	}
	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRr_detail() {
		return rr_detail;
	}
	public void setRr_detail(String rr_detail) {
		this.rr_detail = rr_detail;
	}
	@Override
	public String toString() {
		return "ResRecordDTO [res_num=" + res_num + ", m_id=" + m_id + ", rr_detail=" + rr_detail + "]";
	}
	
	
}
