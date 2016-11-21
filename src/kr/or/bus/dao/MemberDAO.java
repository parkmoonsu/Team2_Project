/*
*	@FileName : MemberDAO.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : Member , MDTAIL table DAO interface
*/

package kr.or.bus.dao;

import java.util.List;

import kr.or.bus.dto.ApproveDTO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinJobDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;
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
	public int insertResrecord(ResRecordDTO dto);
	
	public List<MemberDTO> SelectAll(String search);
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
	
	//권한별 사이드바 바꾸기
	public MemberJoinJobDTO getJobName(String username);
	
	//승인여부 구하기 (N인 사람만 뽑기)
	public List<MemberJoinMDetailDTO> getNcheck();
	
	//로그인한 정보로 회원의 개인정보 확인 ( 수정 넘어가기 전 )
	public MemberJoinMDetailDTO getMemberInfo(String m_id);

	//수정할때 비밀번호 검증
	public MemberDTO passMatch(String m_id);
	
	//회원 정보 수정
	public void updateMember1(MemberDTO mdto, String m_id ,String hidden);
	public void updateMember2(MDetailDTO ddto, String m_id);
    //회원 정보 수정 > 이력사항 확인
	public List<MemberJoinResRecordDTO> getResRecordInfo(String m_id);
}
