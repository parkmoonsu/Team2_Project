/*
*	@FileName : ResRecordDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.15
*	@Author	: 박문수
*	@Discription : ResRecord(이력) table DTO
*	
*	수정
*	@FileName : ResRecordDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 강민수
*	@Discription : ResRecord(이력) table DTO
*				   table column 수정에 따른 멤버 변수 추가
*/


package kr.or.bus.dto;

public class ResRecordDTO {
	private String res_num;
	private String m_id;
	private String res_com;
	private String res_start;
	private String res_end;
	private String res_period;
	
	public String getRes_period() {
		return res_period;
	}
	public void setRes_period(String res_period) {
		this.res_period = res_period;
	}
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
	public String getRes_com() {
		return res_com;
	}
	public void setRes_com(String res_com) {
		this.res_com = res_com;
	}
	public String getRes_start() {
		return res_start;
	}
	public void setRes_start(String res_start) {
		this.res_start = res_start;
	}
	public String getRes_end() {
		return res_end;
	}
	public void setRes_end(String res_end) {
		this.res_end = res_end;
	}
	
	
	
	
}
