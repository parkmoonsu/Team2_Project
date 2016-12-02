/*
*	@FileName : MemberJoinRegulOffrDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.23
*	@Author	: 강민수
*	@Discription : Member join Reguloffr table DTO
*/
package kr.or.bus.dto;

public class MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2 {
	private String m_id;
	private String m_name;
	
	private String o_date;
	private String o_code;
	
	private String m_id_1;
	private String m_name_1;
	
	private String o_date_1;
	private String o_code_1;
	
	private String ro_reqdate;
	private String ro_regdate;
	
	private String ko_name;
	
	private String r_num;

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

	public String getO_date_1() {
		return o_date_1;
	}

	public void setO_date_1(String o_date_1) {
		this.o_date_1 = o_date_1;
	}

	public String getO_code_1() {
		return o_code_1;
	}

	public void setO_code_1(String o_code_1) {
		this.o_code_1 = o_code_1;
	}

	public String getRo_reqdate() {
		return ro_reqdate;
	}

	public void setRo_reqdate(String ro_reqdate) {
		this.ro_reqdate = ro_reqdate;
	}

	public String getRo_regdate() {
		return ro_regdate;
	}

	public void setRo_regdate(String ro_regdate) {
		this.ro_regdate = ro_regdate;
	}

	public String getKo_name() {
		return ko_name;
	}

	public void setKo_name(String ko_name) {
		this.ko_name = ko_name;
	}

	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	@Override
	public String toString() {
		return "MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2 [m_id=" + m_id + ", m_name=" + m_name + ", o_date="
				+ o_date + ", o_code=" + o_code + ", m_id_1=" + m_id_1 + ", m_name_1=" + m_name_1 + ", o_date_1="
				+ o_date_1 + ", o_code_1=" + o_code_1 + ", ro_reqdate=" + ro_reqdate + ", ro_regdate=" + ro_regdate
				+ ", ko_name=" + ko_name + ", r_num=" + r_num + "]";
	}

	
	
}
