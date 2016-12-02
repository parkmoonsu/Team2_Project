package kr.or.bus.dto;

public class RegulOffrJoinMemberJoinBusDTO {
	private String ko_code;
	private String m_id;
	private String o_code;
	private String ro_code;
	private String ro_object;
	private String m_name;
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
	public String getRo_object() {
		return ro_object;
	}
	public void setRo_object(String ro_object) {
		this.ro_object = ro_object;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	@Override
	public String toString() {
		return "RegulOffrJoinMemberJoinBusDTO [ko_code=" + ko_code + ", m_id=" + m_id + ", o_code=" + o_code
				+ ", ro_code=" + ro_code + ", ro_object=" + ro_object + ", m_name=" + m_name + "]";
	}
	
}
