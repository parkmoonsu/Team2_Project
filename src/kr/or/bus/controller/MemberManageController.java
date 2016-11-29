/*
*	@FileName : MemberManageController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.21
*	@Author	: 박문수
*	@Discription : (관리자)회원 관리 페이지 Controller
*/


package kr.or.bus.controller;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import kr.or.bus.dto.MemberJoinJobDTO;
import kr.or.bus.dto.MemberJoinMDetailDTO;
import kr.or.bus.dto.MemberJoinMDetailRegulOffDTO;
import kr.or.bus.dto.MemberJoinRegulOffrDTO;
import kr.or.bus.dto.MemberJoinResRecordDTO;
import kr.or.bus.service.LoginService;
import kr.or.bus.service.MemberManageService;
@Controller
public class MemberManageController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private MemberManageService service;
	@Autowired
	private LoginService service2;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("/membermanage.admin")
	public String memberInfo(String pg , Model model) {
		
		List<MemberJoinMDetailDTO> list = service.memberInfo(pg);
		int membercount = service.memberCount();
		int page = service.pg(pg);
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",membercount);
		return "membermanage/memberinfo";
	}
	

	@RequestMapping(value="/mailsend.htm", method=RequestMethod.POST)
	public ModelAndView msendToMember(String subject, String to, String content, @RequestParam("filename") MultipartFile filename){
		
		service.mailSendToMember(subject, to, content, filename);
		
		return new ModelAndView("redirect:/membermanage.admin");
	}
	@RequestMapping("/joinapprove.admin")
	public String joinapprove(String pg , Model model){
		List<MemberJoinMDetailDTO> list = service.memberNList(pg);
		int page = service.pg(pg);
		int ncount = service.memberNCount();
		
		model.addAttribute("pgs", page);
		model.addAttribute("list", list);
		model.addAttribute("membercount",ncount);
		
		return "membermanage/joinapprove";
	}

	@RequestMapping("/searching.htm")
	public View searching(String param){
		System.out.println("param"+param);
		return jsonview;
	}
	
	@RequestMapping("/approveMember.admin")
	public String approveMember(String m_id){
		System.out.println("m_id : " + m_id);
		
		service.updateCheck(m_id);
		
		return "membermanage/updatesuccess";

	}

	@RequestMapping("/memberdetail.admin")
	public String memberDetail(String param, Model model){
		System.out.println("memberdetail.admin시작");
		System.out.println("param"+param);
		MemberJoinMDetailRegulOffDTO dto = service.memberDetail(param);
		model.addAttribute("mjdrodto", dto);
		return "membermanage/memberdetailmodal";
	}
	@RequestMapping("/download.admin")
	public void downloadfile(String folder, String filename, HttpServletRequest request,
			   HttpServletResponse response) throws IOException{
		System.out.println("folder"+folder);
		System.out.println("filename"+filename);
		String fname = new String(filename.getBytes("euc-kr"), "8859_1");
		response.setHeader("Content-Disposition", "attachment;filename="
			    + fname + ";");
		System.out.println(request.getServletContext().getRealPath("/join"));
		String fullpath = request.getServletContext().getRealPath(
			    "/join/" + folder + "/" + filename);
		 FileInputStream fin = new FileInputStream(fullpath);
		  // 출력 도구 얻기 :response.getOutputStream()
		  ServletOutputStream sout = response.getOutputStream();
		  byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		  int size = 0;
		  while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
		               // 담고
		  { // 마지막 남아있는 byte 담고 그다음 없으면 탈출
		   sout.write(buf, 0, size); // 1kbyte씩 출력
		  }
		  fin.close();
		  sout.close();
		 
	}
	
	@RequestMapping("/memberreguloffr.htm")
	public String memberreguloffr(String param, Model model){
		System.out.println("memberreguloffr.htm 시작");
		System.out.println("param"+param);
		
		List<MemberJoinRegulOffrDTO> list = service.memberreguloffr(param);
		model.addAttribute("offrlist", list);
		
		return "membermanage/memberdetailmodaltable";
	}

	@RequestMapping("/memberresrecord.admin")
	public String memberresrecord(String param, Model model){
		System.out.println("memberresrecord.admin 시작");
		System.out.println("param"+param);
		List<MemberJoinResRecordDTO> list = service.getResRecordInfo(param);
		model.addAttribute("reslist", list);
		return "membermanage/memberresrecordmodal";
	}

	@RequestMapping("/deleteMember.admin")
	public View deleteMember(String param , Model model , String pg){
	  System.out.println("member id가 삭제가 될까욧?");
      System.out.println("삭제 아이디 띄워주세요"+param);
      service.delete(param);
      
      return jsonview;
   }
	
	
	
	@RequestMapping("/passcheck.admin")
	public String passcheck(Model model , Principal principal , String param){
		System.out.println("세션 ID : " + principal.getName());
		
		String encodepass = service.getPass(principal.getName());
		System.out.println("m_pw : " + param);
		System.out.println("encodePass : " + encodepass);
		
		boolean result = bCryptPasswordEncoder.matches(param, encodepass);
		System.out.println("제발 출력이 나와랑");
		System.out.println("result : " + result);
		
		String viewpage = "";
		/*System.out.println(principal.getName());
		MemberJoinMDetailDTO dto = service.getMemberInfo(principal.getName());
		System.out.println("dto  :  "+dto);
		model.addAttribute("dto", dto);*/
		
	
	
		if(result){
			viewpage = "membermanage/memberinfo";
		}else{
			viewpage = "membermanage/matchfailpass";
		}
		
		return viewpage;
	}
	
	


}
