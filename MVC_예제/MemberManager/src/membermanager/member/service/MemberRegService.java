package membermanager.member.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import membermanager.member.dao.MemberDao;
import membermanager.member.model.RequestMemberInfo;

public class MemberRegService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		
		/*
		 * try { request.setCharacterEncoding("utf-8"); } catch
		 * (UnsupportedEncodingException e1) { // TODO Auto-generated catch block
		 * e1.printStackTrace(); }
		 */
		
		//String uId = request.getParameter("uId");
		//String uPW = request.getParameter("uPW");
		//String uName = request.getParameter("uName");
		
		//RequestMemberInfor requestMemberInfor = new RequestMemberInfor(uId, uPW, uName, null);
		
		RequestMemberInfo requestMemberInfo = new RequestMemberInfo();
		
		String uploadURI = "/uploadfile";
		// 시스템의 절대 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		
		

		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// FileItem <- 폼 페이지에서 전송한 데이터들  , uName, sNumber, report
		List<FileItem> items;
		try {
			items = upload.parseRequest(request);
			Iterator<FileItem> itr = items.iterator();
			
			while(itr.hasNext()) {
				
				FileItem fileItem =  itr.next();
				
				// 일반 폼 또는 파일
				if(fileItem.isFormField()) {
					
					if(fileItem.getFieldName().equals("uId")) {
						requestMemberInfo.setuId(fileItem.getString("utf-8"));
					}
					
					if(fileItem.getFieldName().equals("uPw")) {
						requestMemberInfo.setuPw(fileItem.getString("utf-8"));
					}
					
					if(fileItem.getFieldName().equals("uName")) {
						requestMemberInfo.setuName(fileItem.getString("utf-8"));
					}
					
				} else {
					
					if(fileItem.getFieldName().equals("uPhoto")) {
						// 새로운 저장 파일 이름
						String newFileName = "user_"+System.nanoTime();
						// 지정된 폴더에 파일 쓰기
						fileItem.write(new File(dir,newFileName));
						requestMemberInfo.setuPhoto(newFileName);
					}
				}
				
				
			}
			
			
			
			
			
			
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		MemberDao dao = MemberDao.getInstance();
		
		Connection conn=null;
		
		int rCnt = 0 ;
		
		try {
			conn = jdbc.ConnectionProvider.getConnection();
			
			rCnt = dao.insertMember(conn, requestMemberInfo.toMemberInfo());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("rCnt", rCnt);
		
		return "/WEB-INF/view/member/memberReg.jsp";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}