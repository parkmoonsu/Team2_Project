/*
*	@FileName : MemberJoinReguloffrJoinMoffDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.19
*	@Author	: 김수현
*	@Discription : Member , Reguloggr,MoffDTO table DTO
*/

package kr.or.bus.dto;

public class MemberJoinReguloffrJoinMoffDTO {
	private String ko_code;
	
	private String m_id;
	private String m_name;
	
	private String o_code;
	private String o_date;
	
	private String m_id_1;
	private String m_name_1;
	
	private String o_code_1;
	private String o_date_1;
	
	private String o_check;

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

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getO_code() {
		return o_code;
	}

	public void setO_code(String o_code) {
		this.o_code = o_code;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public String getM_id_1() {
		return m_id_1;
	}

	public void setM_id_1(String m_id_1) {
		this.m_id_1 = m_id_1;
	}

	public String getM_name_1() {
		return m_name_1;
	}

	public void setM_name_1(String m_name_1) {
		this.m_name_1 = m_name_1;
	}

	public String getO_code_1() {
		return o_code_1;
	}

	public void setO_code_1(String o_code_1) {
		this.o_code_1 = o_code_1;
	}

	public String getO_date_1() {
		return o_date_1;
	}

	public void setO_date_1(String o_date_1) {
		this.o_date_1 = o_date_1;
	}

	public String getO_check() {
		return o_check;
	}

	public void setO_check(String o_check) {
		this.o_check = o_check;
	}

	@Override
	public String toString() {
		return "MemberJoinReguloffrJoinMoffDTO [ko_code=" + ko_code + ", m_id=" + m_id + ", m_name=" + m_name
				+ ", o_code=" + o_code + ", o_date=" + o_date + ", m_id_1=" + m_id_1 + ", m_name_1=" + m_name_1
				+ ", o_code_1=" + o_code_1 + ", o_date_1=" + o_date_1 + ", o_check=" + o_check + "]";
	}
	
	
}
