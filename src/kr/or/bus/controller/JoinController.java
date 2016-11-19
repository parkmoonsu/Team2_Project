/*
*	@FileName : JoinController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : 회원가입 페이지 Controller
*/

package kr.or.bus.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import kr.or.bus.dto.MDetailDTO;
import kr.or.bus.dto.MemberDTO;
import kr.or.bus.dto.ResRecordDTO;
import kr.or.bus.service.JoinService;

@Controller
public class JoinController {
	
	@Autowired
	private View jsonview;

	@Autowired
	private JoinService service;
	
	
	@RequestMapping("/join.htm")
	public String join(){
		return "join/join1";
	}
	
	@RequestMapping("/join2.htm")
	public String join2(){
		return "join/join2";
	}
	
	@RequestMapping(value="/join3.htm",method=RequestMethod.POST)
	public String join3(MDetailDTO ddto , MemberDTO mdto , ResRecordDTO rdto , HttpServletRequest request) throws IOException, BiffException{
		
		service.join3(ddto, mdto, request);
		return "join/join3";
	}
	
	@RequestMapping(value="/checkid.htm",method=RequestMethod.POST)
	public View checkid(String m_id , Model model){
		String check = service.checkid(m_id);
		model.addAttribute("check", check);
		
		return jsonview;
	}
	
	@RequestMapping(value="/popup.htm",method=RequestMethod.POST)
	public View popup(String m_email) throws AddressException, MessagingException{
		
		service.popup(m_email);
		
		return jsonview;
	}
	
	@RequestMapping(value="/echeck.htm",method=RequestMethod.POST)
	public View checkEmail(String m_echeck , Model model){
	
		String echeck = service.checkEmail(m_echeck);
		
		
		model.addAttribute("echeck", echeck);
		return jsonview;
	}
	
	@RequestMapping(value="/updateapp",method=RequestMethod.POST)
	public View checkEmail(){
		
		service.checkEmail();
		
		return jsonview;
	}
}
