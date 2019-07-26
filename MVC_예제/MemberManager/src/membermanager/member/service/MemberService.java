package membermanager.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	
	String getViewName(HttpServletRequest request, HttpServletResponse response);

}