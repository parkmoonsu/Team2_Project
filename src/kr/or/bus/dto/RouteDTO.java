/*
*	@FileName : RouteDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 12.2
*	@Author	: 김수현
*	@Discription : 버스 DTO
*/


package kr.or.bus.dto;

public class RouteDTO {

	private String r_num;

	
	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	
	@Override
	public String toString() {
		return "RouteDTO [r_num=" + r_num + "]";
	}
		
}
