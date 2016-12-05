/*
 * @File Name: ReguloffJoinMemberJoinBusDTO.java
 * @Author: 길한종
 * @Data: 2016. 12. 4
 * @Desc: reguloff의 정보를 vschedule에 넘기기 위한 dto
 */


package kr.or.bus.dto;

public class ReguloffJoinMemberJoinBusDTO {
	private String b_vehiclenum;
	private String r_num;
	private String o_code;
	private String v_time;
	
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
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public String getV_time() {
		return v_time;
	}
	public void setV_time(String v_time) {
		this.v_time = v_time;
	}
	@Override
	public String toString() {
		return "ReguloffJoinMemberJoinBusDTO [b_vehiclenum=" + b_vehiclenum + ", r_num=" + r_num + ", o_code=" + o_code
				+ ", v_time=" + v_time + "]";
	}
	
}
