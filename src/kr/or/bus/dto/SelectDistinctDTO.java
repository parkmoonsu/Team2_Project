package kr.or.bus.dto;

public class SelectDistinctDTO {
	private String m_name;
	private String r_num;
	private String b_vehiclenum;
	
	private java.sql.Date o_date;
	
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
	public java.sql.Date getO_date() {
		return o_date;
	}
	public void setO_date(java.sql.Date o_date) {
		this.o_date = o_date;
	}
	@Override
	public String toString() {
		return "SelectDistinctDTO [m_name=" + m_name + ", r_num=" + r_num + ", b_vehiclenum=" + b_vehiclenum
				+ ", o_date=" + o_date + "]";
	}
	
	

}
