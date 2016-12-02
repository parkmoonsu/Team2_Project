/*
 * @File Name: MemberJoinRegulOffDTO.java
 * @Author: 길한종
 * @Data: 2016. 11. 25
 * @Desc: 일정관리(정기휴무) - 캘린더dto
 */

package kr.or.bus.dto;

public class MemberJoinRegulOffDTO {
	private String m_id;
	private String o_code;
	private String m_name;
	private String r_num;
	private String b_vehiclenum;
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
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getB_vehiclenum() {
		return b_vehiclenum;
	}
	public void setB_vehiclenum(String b_vehiclenum) {
		this.b_vehiclenum = b_vehiclenum;
	}
	@Override
	public String toString() {
		return "MemberJoinRegulOffDTO [m_id=" + m_id + ", o_code=" + o_code + ", m_name=" + m_name + ", r_num=" + r_num
				+ ", b_vehiclenum=" + b_vehiclenum + "]";
	}
	
	
	
	
	

}
