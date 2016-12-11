/*
*	@FileName : MemberJoinBusJoinRouteJoinReguloffDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.17
*	@Author	: 김용현
*	@Discription : Member,Bus,Route,Reguloff table DTO
*/

package kr.or.bus.dto;

public class MemberJoinBusJoinRouteJoinReguloffDTO {
	private String m_id;
	private String m_name;
	private String o_code;
	private String b_vehiclenum;
	private String r_num;
	private String r_start;
	private String r_last;
	private String r_interval;
	private String b_order;
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
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public String getB_vehiclenum() {
		return b_vehiclenum;
	}
	public void setB_vehiclenum(String b_vehiclenum) {
		this.b_vehiclenum = b_vehiclenum;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public String getR_last() {
		return r_last;
	}
	public void setR_last(String r_last) {
		this.r_last = r_last;
	}
	public String getR_interval() {
		return r_interval;
	}
	public void setR_interval(String r_interval) {
		this.r_interval = r_interval;
	}
	public String getB_order() {
		return b_order;
	}
	public void setB_order(String b_order) {
		this.b_order = b_order;
	}
	@Override
	public String toString() {
		return "MemberJoinBusJoinRouteJoinReguloffDTO [m_id=" + m_id + ", m_name=" + m_name + ", o_code=" + o_code
				+ ", b_vehiclenum=" + b_vehiclenum + ", r_num=" + r_num + ", r_start=" + r_start + ", r_last=" + r_last
				+ ", r_interval=" + r_interval + ", b_order=" + b_order + "]";
	}
	
	

	
	

	
	
	
	
	
	
	
	
}
