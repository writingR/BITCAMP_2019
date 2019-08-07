package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberMypageController {

	@RequestMapping("/member/mypage")
	public String getMypage(HttpSession session) {
		
		String view = "member/mypage";
		
		if(session == null || session.getAttribute("loginInfo")==null) {
			view = "redirect:/member/login";
		}
		
		return view;
	}
}
