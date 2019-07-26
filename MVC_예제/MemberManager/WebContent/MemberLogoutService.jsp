package membermanager.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLogoutService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession(false).invalidate();
		
		return "/WEB-INF/view/member/logout.jsp";
	}

}