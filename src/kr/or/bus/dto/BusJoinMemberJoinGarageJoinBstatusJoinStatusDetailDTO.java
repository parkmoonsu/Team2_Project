/*
*	@FileName : BusJoinMemberJoinGarageJoinBStatusJoinStatusDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 강민수
*	@Discription : bus, garage,Bstatus,StatusDetail table  DTO
*/

package kr.or.bus.dto;

import java.sql.Date;

public class BusJoinMemberJoinGarageJoinBstatusJoinStatusDetailDTO {
	private int r;
	private String b_vehiclenum;
	private Date b_sdate;
	private String b_sprice;
	private String b_manuf;
	private String b_caryear;
	private String b_model;
	private String b_effic;
	private int b_pcount;
	private String r_num;
	private String m_name;
	private String g_name;
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
	public Date getB_sdate() {
		return b_sdate;
	}
	public void setB_sdate(Date b_sdate) {
		this.b_sdate = b_sdate;
	}
	public String getB_sprice() {
		return b_sprice;
	}
	public void setB_sprice(String b_sprice) {
		this.b_sprice = b_sprice;
	}
	public String getB_manuf() {
		return b_manuf;
	}
	public void setB_manuf(String b_manuf) {
		this.b_manuf = b_manuf;
	}
	public String getB_caryear() {
		return b_caryear;
	}
	public void setB_caryear(String b_caryear) {
		this.b_caryear = b_caryear;
	}
	public String getB_model() {
		return b_model;
	}
	public void setB_model(String b_model) {
		this.b_model = b_model;
	}
	public String getB_effic() {
		return b_effic;
	}
	public void setB_effic(String b_effic) {
		this.b_effic = b_effic;
	}
	public int getB_pcount() {
		return b_pcount;
	}
	public void setB_pcount(int b_pcount) {
		this.b_pcount = b_pcount;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	@Override
	public String toString() {
		return "BusJoinMemberJoinGarageJoinBstatusJoinStatusDetailDTO [r=" + r + ", b_vehiclenum=" + b_vehiclenum
				+ ", b_sdate=" + b_sdate + ", b_sprice=" + b_sprice + ", b_manuf=" + b_manuf + ", b_caryear="
				+ b_caryear + ", b_model=" + b_model + ", b_effic=" + b_effic + ", b_pcount=" + b_pcount + ", r_num="
				+ r_num + ", m_name=" + m_name + ", g_name=" + g_name + ", s_name=" + s_name + "]";
	}
	
	
}
