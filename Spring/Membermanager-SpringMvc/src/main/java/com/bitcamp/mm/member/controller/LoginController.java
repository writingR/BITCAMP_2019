package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.MemberLoginService;

@Controller
@RequestMapping ("/member/login")
public class LoginController {
	
	@Autowired
	private MemberLoginService loginService;
	
	@RequestMapping (method = RequestMethod.GET)
	public String getLoginForm(HttpServletRequest request) {
		
		//세션을 반환하고 세션이 없다면 null값을 반환한다.
		
		String view = "member/loginForm";
		
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loginInfo") != null) {
			view = "redirect:/main";
		}
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getLogin(
						  @RequestParam("uId") String id,
						  @RequestParam("uPw") String pw,
						  HttpServletRequest request
							) {
		
		String view = "member/loginfail";
		boolean loginChk = loginService.login(id, pw, request);
		
		
		if(loginChk) {
			
			view = "redirect:/main";
		}
		
		return view;
	}
	
}
