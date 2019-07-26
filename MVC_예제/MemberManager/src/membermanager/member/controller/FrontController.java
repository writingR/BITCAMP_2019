package membermanager.member.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membermanager.member.service.MemberService;


@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "config", value = "/WEB-INF/commandService.properties")
		})
public class FrontController extends HttpServlet {
	
	private Map<String , MemberService> commands =  new HashMap<String, MemberService>();
       
 
	public void init(ServletConfig config) throws ServletException {
		String configfile = config.getInitParameter("config");
		Properties prop = new Properties();
		FileInputStream fis = null;
		String configFilePath = config.getServletContext().getRealPath(configfile);
		
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Iterator itr=  prop.keySet().iterator();
		
		while(itr.hasNext()) {
			
			String command = (String) itr.next();   // 사용자 요청 URI
			String serviceClassName = prop.getProperty(command);  // 서비스 클래스 이름
			
			System.out.println(command);
			
			// commands Map 에 저장 <String, GuestBookService>
			
			// prop 에 있는 클래스 이름으로 인스턴스 생성
			
			try {
				Class serviceClass = Class.forName(serviceClassName);
				// 객체 생성
				MemberService service = (MemberService) serviceClass.newInstance();
				
				// commands Map 에 저장 <String, GuestBookService>
				commands.put(command, service);
				
				System.out.println(command + " : " + service );
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
				
		
		
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 요청 분석
		
		String commandUri = request.getRequestURI(); // /guest/guestWriteForm
		
		if(commandUri.indexOf(request.getContextPath()) == 0) {
			commandUri = commandUri.substring(request.getContextPath().length());
		}
		
		//System.out.println(commandUri);  --------- > 경로 띄우는 창
		
		// 2. 사용자 요청에 맞는 모델 실행 ( 서비스.메서드 실행 ) -> view 페이지 반환
		
		String viewPage = "/WEB-INF/view/null.jsp";
		
		MemberService service = commands.get(commandUri); // null 값을 반환하기도 한다.
		if(service != null) {
			viewPage = service.getViewName(request, response);
		}
		
		
		// 3. view 로 포워딩
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
}