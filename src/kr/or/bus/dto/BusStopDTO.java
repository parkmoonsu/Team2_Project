package kr.or.bus.dto;

public class BusStopDTO {
	
	String s_num;
	String s_name;
	String s_x;
	String s_y;
	String rs_order;
	
	@Override
	public String toString() {
		return "BusStopDTO [s_num=" + s_num + ", s_name=" + s_name + ", s_x=" + s_x + ", s_y=" + s_y + ", rs_order="
				+ rs_order + "]";
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_x() {
		return s_x;
	}
	public void setS_x(String s_x) {
		this.s_x = s_x;
	}
	public String getS_y() {
		return s_y;
	}
	public void setS_y(String s_y) {
		this.s_y = s_y;
	}
	public String getRs_order() {
		return rs_order;
	}
	public void setRs_order(String rs_order) {
		this.rs_order = rs_order;
	}
	
	
}
