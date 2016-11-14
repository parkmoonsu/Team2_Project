/*
*	@FileName : MemberDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : MDTAIL table DTO
*/


package kr.or.bus.dto;

import java.sql.Date;

public class MDetailDTO {
	private String m_id;
	private String m_addr;
	private String m_daddr;
	private String m_phone;
	private String m_email;
	private String m_echeck;
	private String m_license;
	private String m_photo;
	private Date m_birth;
	private int m_annual;
	private String m_gender;
	
	
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public Date getM_birth() {
		return m_birth;
	}
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}
	public int getM_annual() {
		return m_annual;
	}
	public void setM_annual(int m_annual) {
		this.m_annual = m_annual;
	}
	@Override
	public String toString() {
		return "MDetailDTO [m_id=" + m_id + ", m_addr=" + m_addr + ", m_daddr=" + m_daddr + ", m_phone=" + m_phone
				+ ", m_email=" + m_email + ", m_echeck=" + m_echeck + ", m_license=" + m_license + ", m_photo="
				+ m_photo + ", m_birth=" + m_birth + ", m_annual=" + m_annual + ", m_gender=" + m_gender + "]";
	}
	
	
}
