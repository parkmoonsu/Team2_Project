/*
*	@FileName : RouteSelectGisaDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.23
*	@Author	: 김지현
*	@Discription :Route, Member table DTO
*/

package kr.or.bus.dto;

public class RouteSelectGisaDTO {
	private String m_name; //배정된 기사 이름
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	private String b_venid; // 해당 노선 에 배정된 차량 id
	
	public String getB_venid() {
		return b_venid;
	}
	public void setB_venid(String b_venid) {
		this.b_venid = b_venid;
	}
}
