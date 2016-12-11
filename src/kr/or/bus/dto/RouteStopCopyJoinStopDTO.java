/*
*	@FileName : RouteStopCopyJoinStopDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.23
*	@Author	: 김지현
*	@Discription :Route, BusStop table DTO
*/

package kr.or.bus.dto;

public class RouteStopCopyJoinStopDTO {
	
	private String r_num;
	private String s_num;
	private String st_type;
	private int rs_order;
	private String rs_check;
	private String r_id;
	private String rs_start;
	private String rs_end;
	private String s_x;
	private String s_y;
	private String s_name;
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getSt_type() {
		return st_type;
	}
	public void setSt_type(String st_type) {
		this.st_type = st_type;
	}
	public int getRs_order() {
		return rs_order;
	}
	public void setRs_order(int rs_order) {
		this.rs_order = rs_order;
	}
	public String getRs_check() {
		return rs_check;
	}
	public void setRs_check(String rs_check) {
		this.rs_check = rs_check;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getRs_start() {
		return rs_start;
	}
	public void setRs_start(String rs_start) {
		this.rs_start = rs_start;
	}
	public String getRs_end() {
		return rs_end;
	}
	public void setRs_end(String rs_end) {
		this.rs_end = rs_end;
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
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	@Override
	public String toString() {
		return "RouteStopCopyJoinStopDTO [r_num=" + r_num + ", s_num=" + s_num + ", st_type=" + st_type + ", rs_order="
				+ rs_order + ", rs_check=" + rs_check + ", r_id=" + r_id + ", rs_start=" + rs_start + ", rs_end="
				+ rs_end + ", s_x=" + s_x + ", s_y=" + s_y + ", s_name=" + s_name + "]";
	}
	
}
