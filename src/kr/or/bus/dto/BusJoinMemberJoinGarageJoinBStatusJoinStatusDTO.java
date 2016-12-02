/*
*	@FileName : BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.25
*	@Author	: 박문수
*	@Discription : 버스,멤버,차고지,버스상태,상태 테이블 DTO
*/


package kr.or.bus.dto;


public class BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO {
	//필요한 컬럼만 가져왔으니 이 DTO를 사용하려면 필요한 컬럼 추가할것
	private int r; // ROWNUM
	
	private String b_vehiclenum;
	private String r_num;
	private String g_num;
	private int b_order;
	
	private String g_name;
	
	private String m_name;
	private String m_id;
	private String s_name;
	
	
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
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
	public String getG_num() {
		return g_num;
	}
	public void setG_num(String g_num) {
		this.g_num = g_num;
	}
	public int getB_order() {
		return b_order;
	}
	public void setB_order(int b_order) {
		this.b_order = b_order;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}	
	
	
	

	///임시 노선별 출결현황
	private String c_date;
	private BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO dto;
	
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	
	private String cs_stat;


	public String getCs_stat() {
		return cs_stat;
	}
	public void setCs_stat(String cs_stat) {
		this.cs_stat = cs_stat;
	}
	public BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO getDto() {
		return dto;
	}
	public void setDto(BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO dto) {
		this.dto = dto;
	}
	@Override
	public String toString() {
		return "BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO [r=" + r + ", b_vehiclenum=" + b_vehiclenum + ", r_num="
				+ r_num + ", g_num=" + g_num + ", b_order=" + b_order + ", g_name=" + g_name + ", m_name=" + m_name
				+ ", m_id=" + m_id + ", s_name=" + s_name + ", c_date=" + c_date + ", dto=" + dto + ", cs_stat="
				+ cs_stat + "]";
	}


	

		
}
