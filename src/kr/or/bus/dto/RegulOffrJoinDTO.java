/*
*	@FileName : RegulOffrJoinDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.23
*	@Author	: 김수현
*	@Discription : RegulOffr table DTO
*/

package kr.or.bus.dto;

public class RegulOffrJoinDTO {
	private int rown;
	public int getRown() {
		return rown;
	}
	public void setRown(int rown) {
		this.rown = rown;
	}
	private String ko_code;
	private String m_id;
	private String o_code;
	private String ro_code;
	private java.sql.Date ro_reqdate;
	private java.sql.Date ro_regdate;
	private String ro_object;
	
	private String ko_name;
	private String bd;
	private String ad;
	private String bn;
	private String an;
	
	

	public String getBd() {
		return bd;
	}
	public void setBd(String bd) {
		this.bd = bd;
	}
	
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}
	public String getBn() {
		return bn;
	}
	public void setBn(String bn) {
		this.bn = bn;
	}

	public String getAn() {
		return an;
	}
	public void setAn(String an) {
		this.an = an;
	}
	public String getKo_code() {
		return ko_code;
	}
	public void setKo_code(String ko_code) {
		this.ko_code = ko_code;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public String getRo_code() {
		return ro_code;
	}
	public void setRo_code(String ro_code) {
		this.ro_code = ro_code;
	}
	public java.sql.Date getRo_reqdate() {
		return ro_reqdate;
	}
	public void setRo_reqdate(java.sql.Date ro_reqdate) {
		this.ro_reqdate = ro_reqdate;
	}
	public java.sql.Date getRo_regdate() {
		return ro_regdate;
	}
	public void setRo_regdate(java.sql.Date ro_regdate) {
		this.ro_regdate = ro_regdate;
	}
	public String getRo_object() {
		return ro_object;
	}
	public void setRo_object(String ro_object) {
		this.ro_object = ro_object;
	}
	public String getKo_name() {
		return ko_name;
	}
	public void setKo_name(String ko_name) {
		this.ko_name = ko_name;
	}


}
