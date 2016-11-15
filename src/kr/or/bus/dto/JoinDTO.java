/*
*	@FileName : JoinDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.15
*	@Author	: 박문수
*	@Discription : Member,MDetail,ResRecord Join DTO
*/


package kr.or.bus.dto;

public class JoinDTO {
	private String m_id;
	private String j_code;
	private String m_name;
	private String m_pw;
	
	private String m_addr;
	private String m_daddr;
	private String m_phone;
	private String m_email;
	private String m_echeck;
	private String m_license;
	private String m_photo;
	private String m_birth;
	private int m_annual;
	private String m_gender;
	
	private String res_num;
	private String rr_detail;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getJ_code() {
		return j_code;
	}
	public void setJ_code(String j_code) {
		this.j_code = j_code;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_daddr() {
		return m_daddr;
	}
	public void setM_daddr(String m_daddr) {
		this.m_daddr = m_daddr;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_echeck() {
		return m_echeck;
	}
	public void setM_echeck(String m_echeck) {
		this.m_echeck = m_echeck;
	}
	public String getM_license() {
		return m_license;
	}
	public void setM_license(String m_license) {
		this.m_license = m_license;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public int getM_annual() {
		return m_annual;
	}
	public void setM_annual(int m_annual) {
		this.m_annual = m_annual;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getRes_num() {
		return res_num;
	}
	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}
	public String getRr_detail() {
		return rr_detail;
	}
	public void setRr_detail(String rr_detail) {
		this.rr_detail = rr_detail;
	}
	@Override
	public String toString() {
		return "JoinDTO [m_id=" + m_id + ", j_code=" + j_code + ", m_name=" + m_name + ", m_pw=" + m_pw + ", m_addr="
				+ m_addr + ", m_daddr=" + m_daddr + ", m_phone=" + m_phone + ", m_email=" + m_email + ", m_echeck="
				+ m_echeck + ", m_license=" + m_license + ", m_photo=" + m_photo + ", m_birth=" + m_birth
				+ ", m_annual=" + m_annual + ", m_gender=" + m_gender + ", res_num=" + res_num + ", rr_detail="
				+ rr_detail + "]";
	}
	
	
}
