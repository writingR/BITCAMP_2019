package member;

import java.util.Date;

// usebean Class
public class MemberInfo {
	
	
	// �� ������ ���� ���������ڴ� private 
	private String uId;
	private String uPw;
	private String uName;
	private Date regDate;

	
	// default ������ �ʼ� 
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
	
	// �������� Getter/Setter  ����

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

	
	// ������ Ȯ���� ���� toString �������̵�
	@Override
	public String toString() {
		return "MemberInfo [uId=" + uId + ", uPW=" + uPw + ", uName=" + uName + ", regDate="+ regDate + "]";
	}
	
	// ȭ�� ��� ����� ���� HTML �ڵ� ��ȯ
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
	
	// MemberInfo ��ü -> LoginInfo ��ü ��ȯ
	public LoginInfo toLoginInfo() {
		
		return new LoginInfo(uId, uName , regDate);
		
	}
	
	


}