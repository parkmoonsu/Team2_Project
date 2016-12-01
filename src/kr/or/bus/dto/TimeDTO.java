package kr.or.bus.dto;

public class TimeDTO {
	private java.sql.Time o_time;

	public java.sql.Time getO_time() {
		return o_time;
	}

	public void setO_time(java.sql.Time o_time) {
		this.o_time = o_time;
	}

	@Override
	public String toString() {
		return "TimeDTO [o_time=" + o_time + "]";
	}
	
	
}
