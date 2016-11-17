/*
*	@FileName : MemberJoinJobDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.17
*	@Author	: 박문수
*	@Discription : Member,Job table Join DTO
*/

package kr.or.bus.dto;

public class MemberJoinJobDTO {
	private String m_id;
	private String j_code;
	private String b_vehiclenum;
	private String m_pw;
	private String m_name;
	
	private String j_name;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getJ_code() {
		return j_code;
	}

	public void setJ_code(String j_code) {
		this.j_code = j_code;
	}

	public String getB_vehiclenum() {
		return b_vehiclenum;
	}

	public void setB_vehiclenum(String b_vehiclenum) {
		this.b_vehiclenum = b_vehiclenum;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getJ_name() {
		return j_name;
	}

	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}

	@Override
	public String toString() {
		return "MemberJoinJobDTO [m_id=" + m_id + ", j_code=" + j_code + ", b_vehiclenum=" + b_vehiclenum + ", m_pw="
				+ m_pw + ", m_name=" + m_name + ", j_name=" + j_name + "]";
	}
	
	
}
