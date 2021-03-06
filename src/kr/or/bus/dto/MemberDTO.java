/*
*	@FileName : MemberDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : Member table DTO
*/



package kr.or.bus.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MemberDTO {
	private String m_id;
	private String j_code;
	private String b_vehiclenum;
	private String m_pw;
	private String m_name;
	
	private String m_addr;
	private String m_daddr;
	private String m_phone;
	private String m_email;
	private String m_license;
	private String m_photo;
	private String m_birth;
	private String m_annual;
	private String m_gender;
	private String m_echeck;
	private String m_check;
	private String m_regdate;
	private String m_resume;
	
	private String j_name;
	
	private int r;
	
	private String o_date;
	private String temp;
	
	

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	////////////////////////////////////////////////
	//턱봉 이력쪽 파일 업로드 추가하려면 list로 바꿀것
	private CommonsMultipartFile file;

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
///////////////////////////////////////////////
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

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
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

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_echeck() {
		return m_echeck;
	}

	public void setM_echeck(String m_echeck) {
		this.m_echeck = m_echeck;
	}

	public String getM_check() {
		return m_check;
	}

	public void setM_check(String m_check) {
		this.m_check = m_check;
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

	@Override
	public String toString() {
		return "MemberJoinMDetailDTO [m_id=" + m_id + ", j_code=" + j_code + ", b_vehiclenum=" + b_vehiclenum
				+ ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_addr=" + m_addr + ", m_daddr=" + m_daddr + ", m_phone="
				+ m_phone + ", m_email=" + m_email + ", m_license=" + m_license + ", m_photo=" + m_photo + ", m_birth="
				+ m_birth + ", m_annual=" + m_annual + ", m_gender=" + m_gender + ", m_echeck=" + m_echeck
				+ ", m_check=" + m_check + ", m_regdate=" + m_regdate + ", m_resume=" + m_resume + ", j_name=" + j_name
				+ ", r=" + r + ", file=" + file + "]";
	}
}
