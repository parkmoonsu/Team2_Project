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
import kr.or.bus.dto.CommuteJoinCstartJoinCendDTO;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.MemberJoinJobDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinMDetailRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrDTO;
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
	
	//1 . 비밀번호 찾기(가입된 ID의 이름 가져와서 이메일 보낼때 활용)
	//2 . include 하는 페이지들의 세션 아이디를 통해 이름을 얻음
	public MemberDTO getName(String m_id);
	
	//비밀번호 찾기 (매치된 ID,이메일로부터 가져온 비밀번호를 임시비밀번호로 변경)
	public void updatePw(String m_id , String temp);
	
	//권한별 사이드바 바꾸기
	public MemberJoinJobDTO getJobName(String username);
	
	//로그인한 정보로 회원의 개인정보 확인 ( 수정 넘어가기 전 )
	public MemberJoinMDetailDTO getMemberInfo(String m_id);

	//수정할때 비밀번호 검증
	public MemberDTO passMatch(String m_id);
	
	//회원 정보 수정
	public void updateMember1(MemberDTO mdto, String m_id ,String hidden);
	public void updateMember2(MDetailDTO ddto, String m_id);

	//(관리자) 회원 정보 리스트 가져오기
	public List<MemberJoinMDetailDTO> memberList(int page);
	
	//(관리자) 회원 정보 개수
	public int memberCount();

    //회원 정보 수정 > 이력사항 확인
	public List<MemberJoinResRecordDTO> getResRecordInfo(String m_id);
	
	//(관리자) 회원 가입 승인 - 승인 여부 N인 사람만 가져오기
	public List<MemberJoinMDetailDTO> memberNList(int page);
	
	//(관리자) 승인이 안된 회원 총 인원 수
	public int memberNCount();
	
	//(관리자) 승인 클릭시 m_check -> y로 업데이트
	public void updateCheck(String m_id);
	//승인시 권한 부여
	public void insertAuth(String m_id);

	//(관리자) 회원 정보 상세 확인(휴무부여한 사람)
	public MemberJoinMDetailRegulOffDTO getMemberDetailRegulOff(String m_id);
	//(관리자) 회원 정보 상세확인(휴무부여하지 않은 사람)
	public MemberJoinMDetailDTO getMemberDetail(String m_id);
	//(관리자) 회원 정보 상세 확인 > 휴무 기록 확인
	public List<MemberJoinRegulOffrDTO> getRegulOffr(String m_id);

	
	//회원 사진 가져오기
	public MDetailDTO getPhoto(String m_id);
	
	/* 김수현 추가 2016.11.23 */

	// 권한 삭제
	public void deleteAuthority(String m_id);

	// 정규휴무기록 삭제
	public void deleteReguloff(String m_id);

	// 출퇴근 삭제
	public void deleteCommute(String m_id);

	// 정규휴무 삭제
	public void deleteRealoff(String m_id);

	// 이력 삭제
	public void deleteResrecord(String m_id);

	// 사원상세 삭제
	public void deleteMdetail(String m_id);

	// 사원 삭제
	public void deleteMember(String m_id);
	/* 김수현추가 끝 */
	
	//상단 nav 알림 카운트
	public int approveCount();
	
	public int getregul(String m_id);
	
	//회원 정보 - 출결상황 보기
	public int csstatic(String m_name , String c_date);
	public int csestatic(String m_name , String c_date);
	
}
