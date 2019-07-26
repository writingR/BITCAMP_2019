package membermanager.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMyPageService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		return "/WEB-INF/view/member/mypage.jsp";
	}

}