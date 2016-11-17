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
	
	//아이디 찾기(가입된 이름과 매칭되는 이메일이 있는지부터 확인)
	public int searchNameEmail(String m_name , String m_email);
	
	//아이디 찾기 (매칭된 이름,이메일로부터 ID 가져옴)
	public MemberDTO searchId(String m_name , String m_email);
	
	
	//비밀번호 찾기 (가입된 ID와 이메일 확인)
	public int searchIdEmail(String m_id , String m_email);
	
	//비밀번호 찾기(가입된 ID의 이름 가져와서 이메일 보낼때 활용)
	public MemberDTO getName(String m_id);
	
	//비밀번호 찾기 (매치된 ID,이메일로부터 가져온 비밀번호를 임시비밀번호로 변경)
	public void updatePw(String m_id , String temp);
	
	
}
