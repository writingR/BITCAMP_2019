package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mm.member.domain.RequestMemberRegist;
import com.bitcamp.mm.member.service.MemberRegService;



@Controller
@RequestMapping("/member/regist")
public class MemberRegController {
	
	@Autowired
	private MemberRegService registService;

	@RequestMapping(method = RequestMethod.GET)
	public String getForm() {
		return "member/registForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String memberRegist(
			RequestMemberRegist regist,
			HttpServletRequest request,
			Model model
			) {
		
		System.out.println(regist);
		
		
		model.addAttribute("rCnt", registService.memberInsert(request, regist));
		;
		
		return "member/memberRegist";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}