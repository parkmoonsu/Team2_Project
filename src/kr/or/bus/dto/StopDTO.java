package kr.or.bus.dto;

public class StopDTO {
	String s_num; //정류장 고유 번호
	String s_x; //정류장 좌표 X
	String s_y; //정류장 좌표 Y
	String s_name; //정류장 이름
	
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
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
		return "StopDTO [s_num=" + s_num + ", s_x=" + s_x + ", s_y=" + s_y + ", s_name=" + s_name + "]";
	}
}
