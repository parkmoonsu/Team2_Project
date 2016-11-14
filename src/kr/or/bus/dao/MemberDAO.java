/*
*	@FileName : MemberDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : Member , MDTAIL table DAO interface
*/

package kr.or.bus.dao;

public interface MemberDAO {
	//아이디 중복 체크
	public int checkId(String m_id);
	//이메일 인증번호 보내기
	public String emailApp();
}
