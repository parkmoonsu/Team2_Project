/*
*	@FileName : ScheduleManageService.java
*	@Project	: KosBus
*	@Date	: 2016. 11.24
*	@Author	: 김수현
*	@Discription : 기사(회원) 스케줄관리 페이지 관련 Service
*/


package kr.or.bus.service;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.bus.dao.ScheduleDAO;
import kr.or.bus.dao.ScheduleManageDAO;
import kr.or.bus.dto.GarageDTO;
import kr.or.bus.dto.MemberJoinBusDTO;
import kr.or.bus.dto.MemberJoinBusJoinRouteJoinReguloffDTO;
import kr.or.bus.dto.MemberJoinRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2;
import kr.or.bus.dto.MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO;
import kr.or.bus.dto.MemberJoinReguloffrJoinMoffDTO;
import kr.or.bus.dto.OscheduleJoinMemberDTO;
import kr.or.bus.dto.RegulOffDTO;
import kr.or.bus.dto.RegulOffrDTO;
import kr.or.bus.dto.RegulOffrJoinDTO;
import kr.or.bus.dto.RegulOffrJoinMemberJoinBusDTO;
import kr.or.bus.dto.RouteDTO;
import kr.or.bus.dto.RouteDTO2;
import kr.or.bus.dto.RouteJoinGarageDTO;


@Configuration
@EnableScheduling
@Service
public class ScheduleManageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<GarageDTO> showGarage(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<GarageDTO> gdto = dao.getTotalGarage();
		return gdto;
	}
	
	public List<RouteJoinGarageDTO> showRoute(String g_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RouteJoinGarageDTO> rdto = dao.getTotalRoute(g_num);
		return rdto;
	}
	
	public List<MemberJoinRegulOffDTO> unScheduledMember(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinRegulOffDTO> mjrdto = dao.getUndecideReguloffMember(r_num);
		return mjrdto;
	}
	
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> scheduledMember(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> mrmbrjdto = dao.getDecideReguloffMember(r_num);
		System.out.println("mrmbrjdto"+mrmbrjdto.toString());
		return mrmbrjdto;
	}
	
	public List<MemberJoinReguloffrJoinMoffDTO> requestRescheduled(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinReguloffrJoinMoffDTO> mjrjmdto = dao.getReqRescheduled(r_num);
		return mjrjmdto;
	}
	public String decideReguloffMember(String m_id, String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.insertReguloff(m_id, dao.getOcode(o_date));
		return dao.getOcode(o_date);
	}
	
	public String modifyReguloffMember(String m_id, String o_date){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.updateReguloff(m_id, dao.getOcode(o_date));
		return dao.getOcode(o_date);
	}
	
	
	//history
	public List<RegulOffrJoinDTO> history_select(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RegulOffrJoinDTO> list=dao.history_select();
		return list;
	}
	public void history_agree(String m_id, String ro_object){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.history_agree(m_id, ro_object);
	}
	
	//timetable
	public List<OscheduleJoinMemberDTO> timetable_get(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<OscheduleJoinMemberDTO> list=dao.timetable_get();
		
		return list;
		
		/*List<SelectDistinctDTO> list1=dao.selectdistinct();
		
		List<TimetableDTO> list2=new ArrayList<TimetableDTO>();
		
		//3 select문 돌리면서 시간 뽑아서 배열에 저장
		for(int index=0; index<list1.size(); index++){
			
			TimetableDTO dto=new TimetableDTO();
			SelectDistinctDTO selectdistinctdto=list1.get(index);

			String[] timelist=dao.selecttime(selectdistinctdto);
	
			
			dto.setSelectdistinctdto(list1.get(index));
			dto.setO_time(timelist);

			list2.add(dto);
		}

		return list2;*/
	}
	
	/*
	제목 : 
	작성자 : 길한종
	목적 : reguloff 테이블에 CRUD
	*/
	
	public MemberJoinRegulOffDTO reguloffInsert(String m_id, String o_code, String temp) throws ClassNotFoundException, SQLException{
		System.out.println("일정 저장하기");

		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		RegulOffDTO dto=new RegulOffDTO();
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		dto.setTemp(temp);
		
		dao.reguloff_insert(dto);
		
		MemberJoinRegulOffDTO dto2=dao.reguloff_selectseq(m_id);
		return dto2;
	}
	
	public List<MemberJoinRegulOffDTO> reguloffSelect(String m_id) throws ClassNotFoundException, SQLException{
		System.out.println("해당노선 일정 불러오기");
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		List<MemberJoinRegulOffDTO> dtolist=dao.reguloff_select(m_id);
		
		return dtolist;
	}
	
	public List<RegulOffrJoinMemberJoinBusDTO> reguloffrSelect(String m_id) throws ClassNotFoundException, SQLException{
		System.out.println("해당노선 일정 불러오기");
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		List<RegulOffrJoinMemberJoinBusDTO> dtolist=dao.reguloffr_select(m_id);
		System.out.println(dtolist);
		
		return dtolist;
	}
	
	public void reguloffDelete(String m_id) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("일정삭제");
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_delete(m_id);

	}
	
	public MemberJoinRegulOffDTO reguloffUpdate(String m_id, String o_code, String temp) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("reguloff_update일정수정");
		
		RegulOffDTO dto=new RegulOffDTO();
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		dto.setTemp(temp);
			
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		dao.reguloff_update(dto);

		MemberJoinRegulOffDTO dto2=dao.reguloff_selectseq(m_id);
		
		
		return dto2;
	}
	
	/*
	제목 : 기타 필요한 로직
	작성자 : 길한종
	목적 : 페이지 내에서 ajax로 간단한 정보 조회를 하기 위해
	*/
	
	public int dowcount(String o_code){
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		int dow = dao.dowcount(o_code);	
		return dow;
	}

	public int checkmid(String m_id){
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		int row = dao.checkmid(m_id);
		
		return row;
	}
		
	public String mid(String m_id){
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		String rid = dao.returnid(m_id);
		
		return rid;
	}
	
	public MemberJoinRegulOffDTO selectSeq(String m_id) throws ClassNotFoundException, SQLException{
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		MemberJoinRegulOffDTO dto= dao.reguloff_selectseq(m_id);
		
		return dto;
	}
	
	public int checkStatus(String m_id) throws ClassNotFoundException, SQLException{
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		int row= dao.reguloffr_checkstatus(m_id);
		
		return row;
	}
	
	/*
	제목 : 
	작성자 : 길한종
	목적 : reguloffr CRUD
	*/
	
	public List<RegulOffrJoinDTO> viewHistory(String m_id , String pg) throws ClassNotFoundException, SQLException{
		int page = 1;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		List<RegulOffrJoinDTO> list=dao.history_select(m_id , page);
				
		return list;
	}

	public MemberJoinRegulOffDTO insertHistory(
		String ko_code, 
		String m_id,
		String o_code,
		String ro_code,
		java.sql.Date ro_reqdate,
		java.sql.Date ro_regdate,
		String ro_object,
		String o_check
	) throws ClassNotFoundException, SQLException{
		ScheduleDAO dao=sqlsession.getMapper(ScheduleDAO.class);
		RegulOffrDTO dto=new RegulOffrDTO();
		dto.setKo_code(ko_code);
		dto.setM_id(m_id);
		dto.setO_code(o_code);
		dto.setRo_code(ro_code);
		dto.setRo_object(ro_object);
		dto.setO_check(o_check);
	
		dao.history_insert(dto);		

		MemberJoinRegulOffDTO dto2=dao.reguloff_selectseq(m_id);

		return dto2;
	}
	
	/*
	제목 : 스케줄러 
	작성자 : 길한종
	목적 : vschedule의 정보를 매일 0:00:00에 oschedule로 복사, vschedule 삭제
		
	*/

	@Scheduled(cron="0 0 0 * * *")
	public void copyScheduler(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.copy_vschedule();
		dao.delete_vschedule();
	}
	
	/*
	제목 : 스케줄러 
	작성자 : 길한종
	목적 : 특정 시간에만 정규휴무를 신청/변경할 수 있도록
	*/

	@Scheduled(cron="0 00 22 * * *")
	public void reguloffScheduler1(){
		//System.out.println("휴무변경 가능으로 변경");
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.reguloffscheduler("true");
	}
	
	@Scheduled(cron="0 00 20 * * *")
	public void reguloffScheduler2(){
		//System.out.println("휴무변경 불가능으로 변경");
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.reguloffscheduler("false");
	}
	
	//신청가능 여부 판별
	public String reguloff_schedulecheck(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		String str=dao.reguloff_schedulecheck();
		return str;
	}

	//수행할 최종스케줄 _김수현
	
	//캘린더에 content 뿌리기
	public List<MemberJoinBusJoinRouteJoinReguloffDTO> schedule_get(String r_num){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinBusJoinRouteJoinReguloffDTO> mjrolist=dao.getmemberjoinreg(r_num);
		  return mjrolist;
	}
	
	

	//select box에 뿌리는 노선
	public List<RouteDTO> rnum_get(){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RouteDTO> list=dao.getrnum();
		System.out.println("RouteDTO를 타나여?");
		return list;
	}
	
	//배차간격,첫차,막차 시간 가져오기
	public List<RouteDTO2> getintervalstartlast(Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<RouteDTO2> routedto =dao.getIntervalStartLast();
		model.addAttribute("routedto",routedto);
		return routedto;
	}

	

	//휴무 요청 상태 가져오기
	public int getRequestState(Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int total = dao.getRequestNum(); //변경요청수
		int refuse = dao.getRequestRefuseNum(); //변경거절수
		List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO> mrordto = dao.getRequestMember();
		
		model.addAttribute("mrordto", mrordto);
		model.addAttribute("total", total);
		model.addAttribute("refuse", refuse);
		return total;
	}

	
	//휴무 요청 노선에 따른 정보 가져오기
	public List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> getRequestInfoCal(String r_num, Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		List<MemberJoinReguloffJoinMoffJoinBusJoinRouteJoinDTO> mrmbrdto = dao.getRequestInfoCal(r_num);
		List<MemberJoinRegulOffrJoinBusJoinMoffJoinKoffDTO2> mbrdto = dao.getMemberTempTrue(r_num);
		System.out.println(mbrdto.toString());
		model.addAttribute("mrmbrdto", mrmbrdto); //정규 휴무 인원
		model.addAttribute("mbrdto", mbrdto); //정규 휴무 temp = true 인원
		return mrmbrdto;
	}
	
	//최초 휴무 등록자 요청 update 하기
	public int approveFirstRegister(String m_id, String o_code){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int result = dao.updateFirstRegister(m_id, o_code);
		return result;
	}
	
	//최초 휴무 등록자 휴무 기록 update 하기
	public int updateFirstRegisterRecord(String m_id, String o_code){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int result = dao.updateFirstRegisterRecord(m_id);
		return result;
	}
	
	//최초 휴무 등록자 거절 하기
	public int updateRefuseFirstRegister(String m_id, String o_code, String o_code_1){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		int result = 0;
		int result1 = 0;
		if(o_code.equals(o_code_1)){
		result = dao.refuseSameDelete(m_id);
		}else{
		result = dao.refuseFirstRegister(m_id, o_code);
		}
		result1 = dao.refuseFirstRegisterRecord(m_id);
		return result;
	}
	
	//정규 휴무 교환 정보 승인 업데이트
	public void updatebtwinfoall(String m_id, String o_code,String m_id_1, String o_code_1, Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.updateBtwReqRego(m_id, o_code_1);
		dao.updateBtwReqRegr(m_id, o_code);
		dao.updateBtwByRego(m_id_1, o_code);
		dao.updateBtwByRegr(m_id_1, o_code_1);
		
	}
	//정보 휴무 교환 정보 거절 업데이트
	public void updatebtwinforefuse(String m_id, String o_code,String m_id_1, String o_code_1, Model model){
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		dao.updateBtwReqRegrre(m_id);
		dao.updateBtwReqRegore(m_id, o_code);
		dao.updateBtwByRegrre(m_id_1);
		dao.updateBtwByRegore(m_id_1, o_code_1);
	}
	
	public MemberJoinBusDTO rnumcheck(String m_id){
		System.out.println("2");
		System.out.println(m_id);
		ScheduleManageDAO dao = sqlsession.getMapper(ScheduleManageDAO.class);
		System.out.println("여기가 수상하다1");
		MemberJoinBusDTO dto = dao.RnumCheck(m_id);
		System.out.println("여기가 수상하다2");

		return dto;		
	}
	
	public int historycount(){
		ScheduleDAO dao = sqlsession.getMapper(ScheduleDAO.class);
		
		int count = dao.historycount();
		
		return count;
		
	}
	

}
