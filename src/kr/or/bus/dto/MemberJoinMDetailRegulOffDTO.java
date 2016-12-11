/*
	*	@FileName : MemberJoinMDetailRegulOffDTO.java
	*	@Project	: KosBus
	*	@Date	: 2016. 11.23
	*	@Author	: 강민수
	*	@Discription : Member join Reguloff table DTO
	*/

package kr.or.bus.dto;

public class MemberJoinMDetailRegulOffDTO {
	
	private String m_id;
	private String j_code;
	private String b_vehiclenum;
	private String m_name;
	
	private String m_addr;
	private String m_daddr;
	private String m_phone;
	private String m_email;
	private String m_license;
	private String m_photo;
	private String m_birth;
	private String m_annual;
	private String m_regdate;
	private String m_resume;
	
	private String j_name;
	
	private String o_date;

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

	public String getB_vehiclenum() {
		return b_vehiclenum;
	}

	public void setB_vehiclenum(String b_vehiclenum) {
		this.b_vehiclenum = b_vehiclenum;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
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

	public String getM_annual() {
		return m_annual;
	}

	public void setM_annual(String m_annual) {
		this.m_annual = m_annual;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	public String getM_resume() {
		return m_resume;
	}

	public void setM_resume(String m_resume) {
		this.m_resume = m_resume;
	}

	public String getJ_name() {
		return j_name;
	}

	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	@Override
	public String toString() {
		return "MemberJoinMDetailRegulOffDTO [m_id=" + m_id + ", j_code=" + j_code + ", b_vehiclenum=" + b_vehiclenum
				+ ", m_name=" + m_name + ", m_addr=" + m_addr + ", m_daddr=" + m_daddr + ", m_phone=" + m_phone
				+ ", m_email=" + m_email + ", m_license=" + m_license + ", m_photo=" + m_photo + ", m_birth=" + m_birth
				+ ", m_annual=" + m_annual + ", m_regdate=" + m_regdate + ", m_resume=" + m_resume + ", j_name="
				+ j_name + ", o_date=" + o_date + "]";
	}
	
	
}
