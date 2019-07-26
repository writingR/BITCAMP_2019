package membermanager.member.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
	
		return "/WEB-INF/view/member/memberList.jsp";
	}

}
