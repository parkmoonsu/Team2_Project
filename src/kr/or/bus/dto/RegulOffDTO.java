/*
 * @File Name: RegulOffDTO.java
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리(정기휴무) - 캘린더dto
 */

package kr.or.bus.dto;

import java.sql.Date;

public class RegulOffDTO {
	private String m_id;
	private String o_code;
	private Date ro_regdate;
	private String temp;

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
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	@Override
	public String toString() {
		return "RegulOffDTO [m_id=" + m_id + ", o_code=" + o_code + ", ro_regdate=" + ro_regdate + ", temp=" + temp
				+ "]";
	}
}
