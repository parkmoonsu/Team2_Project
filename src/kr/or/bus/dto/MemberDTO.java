/*
*	@FileName : MemberDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : Member table DTO
*/



package kr.or.bus.dto;

public class MemberDTO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String j_code;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public String getJ_code() {
		return j_code;
	}
	public void setJ_code(String j_code) {
		this.j_code = j_code;
	}
	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", j_code=" + j_code + "]";
	}
	
	
}
