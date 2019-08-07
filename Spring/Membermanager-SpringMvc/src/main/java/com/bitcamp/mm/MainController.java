package com.bitcamp.mm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.mm.member.domain.LoginInfo;
import com.mysql.cj.protocol.ServerSession;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String getMainpage(HttpSession session) {
		
		if(session != null) {
			System.out.println(session.getAttribute("loginInfo"));
		}
		
		return "main";
	}
	

}