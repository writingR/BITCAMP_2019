package membermanager.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import membermanager.member.dao.MemberDao;
import membermanager.member.model.LoginInfo;
import membermanager.member.model.MemberInfo;

public class MemberLoginService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {


		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		
		MemberDao dao = MemberDao.getInstance(); 
		
		Connection conn = null ;
		
		MemberInfo memberInfo = null;
		
		String msg = "로그인되었습니다.";
		
		boolean loginChk = false;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			memberInfo = dao.selectMemberById(conn, uId);
			
			System.out.println("로그인 체크 정보 : " + memberInfo);
			
			if(memberInfo != null && memberInfo.pwChk(uPw)) {
				// 세션 추가
				LoginInfo loginInfo = memberInfo.toLoginInfo();
				
				// 회원 개인정보를 세션영역 속성에 저장
				request.getSession(false).setAttribute("loginInfo", loginInfo);
				
				loginChk = true;
				
			} else {
				throw new LoginFailException("아이디 또는 비밀번호가 틀립니다.");			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
		} catch (LoginFailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
		}
		
		// 결과 메시지 reqeust 속성에 저장
		request.setAttribute("msg", msg);
		request.setAttribute("loginChk", loginChk);
		
		
		
		
		return "/WEB-INF/view/login/login.jsp";
	}

}













