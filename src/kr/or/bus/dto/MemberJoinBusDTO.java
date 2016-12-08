package kr.or.bus.dto;

public class MemberJoinBusDTO {
	private String m_id;
	private String b_vehiclenum;
	private String m_name;
	private String r_num;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getB_vehiclenum() {
		return b_vehiclenum;
	}
	public void setB_vehiclenum(String b_vehiclenum) {
		this.b_vehiclenum = b_vehiclenum;
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
	@Override
	public String toString() {
		return "MemberJoinBusDTO [m_id=" + m_id + ", b_vehiclenum=" + b_vehiclenum + ", m_name=" + m_name + ", r_num="
				+ r_num + "]";
	}
	
}
