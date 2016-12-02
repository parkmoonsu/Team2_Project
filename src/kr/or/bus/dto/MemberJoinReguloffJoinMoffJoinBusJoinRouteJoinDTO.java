/*
*	@FileName : MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.29
*	@Author	: 강민수
*	@Discription : Member join Route table DTO
*/
package kr.or.bus.dto;

public class MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO {
	
	private String m_id;
	private String m_name;
	
	private String o_date;
	private String o_code;
	
	private String r_num;
	
	private String temp;
	
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
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
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	@Override
	public String toString() {
		return "MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO [m_id=" + m_id + ", m_name=" + m_name + ", o_date="
				+ o_date + "]";
	}
	
	
}
