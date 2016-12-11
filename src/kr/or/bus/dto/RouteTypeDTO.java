/*
*	@FileName : RouteTypeDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 김용현
*	@Discription :Route table DTO
*/

package kr.or.bus.dto;

public class RouteTypeDTO {
	String bd_name;
	String bd_num;
	String r_num;
	

	public String getBd_num() {
		return bd_num;
	}
	public void setBd_num(String bd_num) {
		this.bd_num = bd_num;
	}
	public String getBd_name() {
		return bd_name;
	}
	public void setBd_name(String bd_name) {
		this.bd_name = bd_name;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
}
