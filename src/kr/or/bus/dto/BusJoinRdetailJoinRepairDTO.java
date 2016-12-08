package kr.or.bus.dto;

public class BusJoinRdetailJoinRepairDTO {
//b_vehiclenum, rep_name, re_detail, rd_cost, rd_date
	private String r_num;
	private String b_vehiclenum;
	private String rep_naem;
	private String re_detail;
	private int rd_cost;
	private String rd_date;
	
	
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


	public String getRep_naem() {
		return rep_naem;
	}


	public void setRep_naem(String rep_naem) {
		this.rep_naem = rep_naem;
	}


	public String getRe_detail() {
		return re_detail;
	}


	public void setRe_detail(String re_detail) {
		this.re_detail = re_detail;
	}


	public int getRd_cost() {
		return rd_cost;
	}


	public void setRd_cost(int rd_cost) {
		this.rd_cost = rd_cost;
	}


	public String getRd_date() {
		return rd_date;
	}


	public void setRd_date(String rd_date) {
		this.rd_date = rd_date;
	}


	
	
}
