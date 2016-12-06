/*
*	@FileName : ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO.java
*	@Project	: KosBus
*	@Date	: 2016.12.06
*	@Author	: 박문수
*	@Discription : reguloffr , member , bus , koff , moff join DTO
*/
package kr.or.bus.dto;

import java.sql.Date;

public class ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO {
	private int r;
	public int getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	private String ko_name;
	private String m_id;
	private String m_name;
	private String o_date;
	private String o_code;
	private String c_date;
	private String c_code;
	private Date ro_reqdate;
	private Date ro_regdate;
	private String c_id;
	private String c_name;
	private String r_num;
	public String getKo_name() {
		return ko_name;
	}
	public void setKo_name(String ko_name) {
		this.ko_name = ko_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public Date getRo_reqdate() {
		return ro_reqdate;
	}
	public void setRo_reqdate(Date ro_reqdate) {
		this.ro_reqdate = ro_reqdate;
	}
	public Date getRo_regdate() {
		return ro_regdate;
	}
	public void setRo_regdate(Date ro_regdate) {
		this.ro_regdate = ro_regdate;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	@Override
	public String toString() {
		return "ReguloffrJoinMemberJoinBusJoinKoffJoinMoffDTO [ko_name=" + ko_name + ", m_id=" + m_id + ", m_name="
				+ m_name + ", o_date=" + o_date + ", o_code=" + o_code + ", c_date=" + c_date + ", c_code=" + c_code
				+ ", ro_reqdate=" + ro_reqdate + ", ro_regdate=" + ro_regdate + ", c_id=" + c_id + ", c_name=" + c_name
				+ ", r_num=" + r_num + "]";
	}
	
	
}
