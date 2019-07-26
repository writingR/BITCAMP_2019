package membermanager.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membermanager.member.dao.MemberDao;
import membermanager.member.model.MemberInfo;

public class MemberIdCheckService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String uId = request.getParameter("uId");
		
		Connection conn = null;
		
		MemberDao dao = MemberDao.getInstance();
		
		MemberInfo memberInfo = null;
		
		String resultCode = "N";
		
		try {
			conn = jdbc.ConnectionProvider.getConnection();
			
			memberInfo = dao.selectMemberById(conn, uId);
			
			if(memberInfo == null) {
				resultCode = "Y";
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("resultCode", resultCode);
		
		
		
		
		
		
		
		
		return "/WEB-INF/view/member/idcheck.jsp";
	}

}