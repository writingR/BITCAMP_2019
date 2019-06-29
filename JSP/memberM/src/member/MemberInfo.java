package member;

import java.util.Date;

// usebean Class
public class MemberInfo {
	
	
	// 각 변수의 저근 제어지시자는 private 
	private String uId;
	private String uPw;
	private String uName;
	private Date regDate;

	
	// default 생성자 필수 
	public MemberInfo() {
		this.regDate = new Date();
	}
	
	public MemberInfo(String uId, String uPW, String uName) {
		super();
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.regDate = new Date();
	}
	
	// 변수들의 Getter/Setter  시작

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	// 데이터 확인을 위한 toString 오버라이딩
	@Override
	public String toString() {
		return "MemberInfo [uId=" + uId + ", uPW=" + uPw + ", uName=" + uName + ", regDate="+ regDate + "]";
	}
	
	// 화면 결과 출력을 위한 HTML 코드 반환
	public String makeHtmlDiv() {
		String str = "";
		
		str += "<div class=\"mInfor\"> \n";
		str += "	<h3> \n";
		str += "		" + uId + "("+ uName +")\n";
		str += "	</h3> \n";
		str += "	<p> \n";
		str += "		"+ uPw;
		str += "	</p> \n";
		str += "</div> \n";
		
		
		
		return str;
	}
	
	// MemberInfo 객체 -> LoginInfo 객체 반환
	public LoginInfo toLoginInfo() {
		
		return new LoginInfo(uId, uName , regDate);
		
	}
	
	


}