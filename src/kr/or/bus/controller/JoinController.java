/*
*	@FileName : JoinController.java
*	@Project	: KosBus
*	@Date	: 2016. 11.14
*	@Author	: 박문수
*	@Discription : 회원가입 페이지 Controller
*/

package kr.or.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	@RequestMapping("/join.htm")
	public String join(){
		return "join";
	}
}
