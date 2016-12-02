package kr.or.bus.dto;

public class RouteStopDTO {
	String s_num; //정류장 고유번호
	String r_num; //노선번호
	String rs_order; //정차순서
	String r_id; //노선 id
	String rs_start; //첫차시간
	String rs_end; //막차시간
	
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getRs_order() {
		return rs_order;
	}
	public void setRs_order(String rs_order) {
		this.rs_order = rs_order;
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
	
	@Override
	public String toString() {
		return "RouteStopDTO [s_num=" + s_num + ", r_num=" + r_num + ", rs_order=" + rs_order + ", r_id=" + r_id
				+ ", rs_start=" + rs_start + ", rs_end=" + rs_end + "]";
	}
	
}
