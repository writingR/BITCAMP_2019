package member;

import java.util.Date;

public class LoginInfo {
	
	private String uId;
	private String uName;
	private Date regDate;
	
	public LoginInfo(String uId, String uName, Date regDate) {	
		this.uId = uId;
		this.uName = uName;
		this.regDate = regDate;
	}

	public String getuId() {
		return uId;
	}

	public String getuName() {
		return uName;
	}

	public Date getRegDate() {
		return regDate;
	}

	@Override
	public String toString() {
		return "LoginInfo [uId=" + uId + ", uName=" + uName + ", regDate=" + regDate + "]";
	}

	
	
	
	
	
	

}