/*
*	@FileName : RnumcommuteDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 12. 01
*	@Author	: 조한솔
*	@Discription : 운영관리 메뉴 노선별 출근현황 DTO
*/

package kr.or.bus.dto;

import java.util.Arrays;

public class RnumcommuteDTO2 {
	
	private String m_name;
	private String c_date;
	private String cs_stat;
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getCs_stat() {
		return cs_stat;
	}
	public void setCs_stat(String cs_stat) {
		this.cs_stat = cs_stat;
	}
	@Override
	public String toString() {
		return "RnumcommuteDTO2 [m_name=" + m_name + ", c_date=" + c_date + ", cs_stat=" + cs_stat + "]";
	}

	
	
	
}
