/*
*	@FileName : MemberDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : Member , MDTAIL table DAO interface
*/

package kr.or.bus.dao;

import kr.or.bus.dto.ApproveDTO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.ResRecordDTO;

public interface MemberDAO {
	//아이디 중복 체크
	public int checkId(String m_id);
	//이메일 인증번호 보내기
	public ApproveDTO emailApp();
	//이메일 인증번호 검증
	public int emailCheck(String a_num);
	//인증번호 번호 변경
	public void updateApp(String a_num);
	
	//member table insert
	public int insertMember(MemberDTO dto); 
	
	//mdtail table insert
	public int insertDetail(MDetailDTO dto);
	
	//resrecord table insert
	//public int insertRecord(ResRecordDTO dto);
	
}
