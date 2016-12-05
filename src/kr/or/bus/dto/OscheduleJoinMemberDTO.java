package kr.or.bus.dto;

public class OscheduleJoinMemberDTO {
	private String m_id;
	private String m_name;
	private String b_vehiclenum;
	private String r_num;
	private String o_date;
	private String o_time1;
	private String o_time2;
	private String o_time3;
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
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getO_time1() {
		return o_time1;
	}
	public void setO_time1(String o_time1) {
		this.o_time1 = o_time1;
	}
	public String getO_time2() {
		return o_time2;
	}
	public void setO_time2(String o_time2) {
		this.o_time2 = o_time2;
	}
	public String getO_time3() {
		return o_time3;
	}
	public void setO_time3(String o_time3) {
		this.o_time3 = o_time3;
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
	@Override
	public String toString() {
		return "OscheduleJoinMemberDTO [m_id=" + m_id + ", m_name=" + m_name + ", b_vehiclenum=" + b_vehiclenum
				+ ", r_num=" + r_num + ", o_date=" + o_date + ", o_time1=" + o_time1 + ", o_time2=" + o_time2
				+ ", o_time3=" + o_time3 + "]";
	}

}
