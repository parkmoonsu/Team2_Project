package kr.or.bus.dto;

import java.sql.Date;

public class BusDTO {
	private String b_vehiclenum;
	private String r_num;
	private String g_num;
	private String b_order;
	private Date b_sdate;
	private String b_sprice;
	private String b_manuf;
	private int b_pcount;
	private String b_effic;
	private String b_model;
	private String b_caryear;
	
	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public String getB_vehiclenum() {
		return b_vehiclenum;
	}

	public void setB_vehiclenum(String b_vehiclenum) {
		this.b_vehiclenum = b_vehiclenum;
	}

	public String getG_num() {
		return g_num;
	}

	public void setG_num(String g_num) {
		this.g_num = g_num;
	}

	public String getB_order() {
		return b_order;
	}

	public void setB_order(String b_order) {
		this.b_order = b_order;
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

	public int getB_pcount() {
		return b_pcount;
	}

	public void setB_pcount(int b_pcount) {
		this.b_pcount = b_pcount;
	}

	public String getB_effic() {
		return b_effic;
	}

	public void setB_effic(String b_effic) {
		this.b_effic = b_effic;
	}

	public String getB_model() {
		return b_model;
	}

	public void setB_model(String b_model) {
		this.b_model = b_model;
	}

	public String getB_caryear() {
		return b_caryear;
	}

	public void setB_caryear(String b_caryear) {
		this.b_caryear = b_caryear;
	}

	@Override
	public String toString() {
		return "BusDTO [b_vehiclenum=" + b_vehiclenum + ", r_num=" + r_num + ", g_num=" + g_num + ", b_order=" + b_order
				+ ", b_sdate=" + b_sdate + ", b_sprice=" + b_sprice + ", b_manuf=" + b_manuf + ", b_pcount=" + b_pcount
				+ ", b_effic=" + b_effic + ", b_model=" + b_model + ", b_caryear=" + b_caryear + "]";
	}
	
}
