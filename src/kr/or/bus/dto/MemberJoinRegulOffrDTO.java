/*
*	@FileName : MemberJoinRegulOffrDTO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.23
*	@Author	: 강민수
*	@Discription : Member join Reguloffr table DTO
*/
package kr.or.bus.dto;

public class MemberJoinRegulOffrDTO {
	private String m_id;
	private String m_name;
	
	private String o_date;
	
	private String m_id1;
	private String m_name1;
	
	private String o_date1;
	
	private String ro_reqdate;
	private String ro_regdate;
	
	private String ko_name;

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

	public String getM_id1() {
		return m_id1;
	}

	public void setM_id1(String m_id1) {
		this.m_id1 = m_id1;
	}

	public String getM_name1() {
		return m_name1;
	}

	public void setM_name1(String m_name1) {
		this.m_name1 = m_name1;
	}

	public String getO_date1() {
		return o_date1;
	}

	public void setO_date1(String o_date1) {
		this.o_date1 = o_date1;
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
	
	
	
}
